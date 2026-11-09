"""Resumable GPU training and spectrum-level validation."""
from flat.common import device, load_data
from dataclasses import asdict
import copy
from pathlib import Path
import random
import time
import numpy as np
import torch
from torch.nn import functional as F
from torch.utils.data import DataLoader, TensorDataset
from tqdm import tqdm
from inverse_design import storage
from flat.model import SpectrumModel


def loss(prediction, reference):
    """Combine absorption fit, worst spectral deviation and auxiliary T/R/A fit.

    Args:
        prediction: Predicted spectra with final channel order T/R/A.
        reference: Received spectra with identical dimensions.

    Returns:
        Scalar differentiable forward-model loss.
    """
    difference = prediction[..., 2]-reference[..., 2]
    return difference.square().mean()+.25*difference.abs().amax(-1).mean()+.1*F.mse_loss(prediction, reference)


def subset(indices, families, limit):
    """Select a deterministic family-balanced subset only for configured smoke runs.

    Args:
        indices: Original partition indices.
        families: Full family array.
        limit: Maximum count, or zero to retain the entire partition.

    Returns:
        Original indices with at least one design from every represented family.
    """
    if not limit or limit >= len(indices):
        return indices
    groups = [indices[families[indices] == i] for i in np.unique(families[indices])]
    if limit < len(groups):
        raise ValueError('smoke limit must cover all represented families')
    selected = []
    for offset in range(max(len(group) for group in groups)):
        for group in groups:
            if offset < len(group) and len(selected) < limit:
                selected.append(group[offset])
    return np.array(selected, dtype=np.int64)


def evaluate(model, data, indices, batch_size, label):
    """Evaluate received spectra without confusing fit error with target feasibility.

    Args:
        model: Forward surrogate on its selected device.
        data: Prepared real data arrays.
        indices: Partition rows to evaluate.
        batch_size: GPU batch size.
        label: Progress stage name.

    Returns:
        Spectrum loss, absorption MAE and mean per-spectrum worst error.
    """
    model.eval()
    gpu = next(model.parameters()).device
    total = 0.
    errors = []
    print(f'Evaluating {label}: {len(indices)} real spectra', flush=True)
    with torch.no_grad():
        for start in range(0, len(indices), batch_size):
            rows = indices[start:start+batch_size]
            output = model(torch.as_tensor(data['family'][rows], device=gpu),
                           torch.as_tensor(data['parameters'][rows], device=gpu))
            target = torch.as_tensor(data['tra'][rows], device=gpu)
            total += float(loss(output, target))*len(rows)
            errors.append((output[..., 2]-target[..., 2]).abs().cpu().numpy())
    error = np.concatenate(errors)
    return dict(count=len(indices), loss=total/len(indices), absorption_mae_pp=float(error.mean()*100),
                mean_worst_spectrum_error_pp=float(error.max(-1).mean()*100),
                p95_worst_spectrum_error_pp=float(np.quantile(error.max(-1), .95)*100))


def load_model(directory, gpu='cuda:0'):
    """Load a checksummed flat-spectrum checkpoint.

    Args:
        directory: Training or exported winner directory.
        gpu: Requested device, with no implicit fallback.

    Returns:
        Frozen inference-ready spectrum surrogate.
    """
    state = storage.unpack(Path(directory)/'best.ckpt')
    model = SpectrumModel(**state['architecture']).to(gpu)
    model.load_state_dict(state['weights'])
    model.eval()
    return model


def train(directory, config, architecture=None, report=None, evaluate_test=False, stop_after=None):
    """Train or resume a spectrum surrogate from atomic epoch checkpoints.

    Args:
        directory: Owned candidate output directory.
        config: Complete settings loaded by its runner.
        architecture: Optional candidate network settings.
        report: Optional callback receiving durable epoch state.
        evaluate_test: Whether this selected model may evaluate the test split.
        stop_after: Deliberate epoch boundary interruption used by smoke validation.

    Returns:
        Training history and best-model validation metrics, plus authorized test metrics.
    """
    gpu = device(config)
    data, metadata = load_data(config.data)
    architecture = architecture or dict(width=config.width, depth=config.depth, dropout=config.dropout, trunk=config.trunk)
    architecture = dict(points=len(data['wavelengths']), **architecture)
    settings = {key: value for key, value in asdict(config).items() if key not in ('data', 'raw', 'output')}
    parts = {key: subset(data[key], data['family'], config.max_train if key == 'train' else config.max_eval)
             for key in ('train', 'validation', 'test')}
    with storage.ownership(directory) as directory:
        fingerprint = storage.manifest(directory, dict(schema='flat-spectrum-v1', settings=settings,
                                       architecture=architecture, dataset_sha256=metadata['dataset_sha256']))
        storage.save_json(directory/'config.json', asdict(config))
        random.seed(config.seed)
        np.random.seed(config.seed)
        torch.manual_seed(config.seed)
        torch.cuda.manual_seed_all(config.seed)
        model = SpectrumModel(**architecture).to(gpu)
        optimizer = torch.optim.AdamW(model.parameters(), lr=config.learning_rate, weight_decay=config.weight_decay)
        state = storage.load(directory, fingerprint)
        epoch, best, wait, history, best_weights = 0, float('inf'), 0, [], None
        if state:
            print(f'Resuming {directory.name} after epoch {state["epoch"]}', flush=True)
            model.load_state_dict(state['weights'])
            optimizer.load_state_dict(state['optimizer'])
            epoch, best, wait, history = state['epoch'], state['best'], state['wait'], state['history']
            best_weights = state['best_weights']
            random.setstate(state['python_rng'])
            np.random.set_state(state['numpy_rng'])
            torch.set_rng_state(state['torch_rng'])
            torch.cuda.set_rng_state_all(state['cuda_rng'])
        rows = parts['train']
        loader = DataLoader(TensorDataset(torch.from_numpy(data['family'][rows]),
                            torch.from_numpy(data['parameters'][rows]), torch.from_numpy(data['tra'][rows])),
                            batch_size=config.batch_size, shuffle=True)
        print(f'Training {len(rows)} geometries, validation {len(parts["validation"])}. Architecture: {architecture}', flush=True)
        while epoch < config.epochs and wait < config.patience:
            started = time.perf_counter()
            model.train()
            total = 0.
            progress = tqdm(loader, desc=f'{directory.name} epoch {epoch+1}/{config.epochs}', unit='batch')
            for families, parameters, target in progress:
                optimizer.zero_grad(set_to_none=True)
                output = model(families.to(gpu), parameters.to(gpu))
                value = loss(output, target.to(gpu))
                if not torch.isfinite(value):
                    raise ValueError('nonfinite spectrum training loss')
                value.backward()
                torch.nn.utils.clip_grad_norm_(model.parameters(), 5.)
                optimizer.step()
                total += float(value.detach())*len(families)
                progress.set_postfix(loss=f'{float(value.detach()):.5f}')
            validation = evaluate(model, data, parts['validation'], config.batch_size, 'validation')
            epoch += 1
            if validation['loss'] < best-config.min_delta:
                best, wait = validation['loss'], 0
                best_weights = {key: value.detach().cpu().clone() for key, value in model.state_dict().items()}
            else:
                wait += 1
            elapsed = time.perf_counter()-started
            history.append(dict(epoch=epoch, train_loss=total/len(rows), validation_loss=validation['loss'],
                                validation_absorption_mae_pp=validation['absorption_mae_pp'], seconds=elapsed))
            state = dict(fingerprint=fingerprint, architecture=architecture, epoch=epoch, best=best, wait=wait,
                         history=history, best_weights=best_weights,
                         weights={key: value.detach().cpu().clone() for key, value in model.state_dict().items()},
                         optimizer=copy.deepcopy(optimizer.state_dict()), python_rng=random.getstate(),
                         numpy_rng=np.random.get_state(), torch_rng=torch.get_rng_state(), cuda_rng=torch.cuda.get_rng_state_all())
            storage.save(directory, state)
            print(f'Epoch {epoch}/{config.epochs}: train={total/len(rows):.6f}, val={validation["loss"]:.6f}, '
                  f'val_A_MAE={validation["absorption_mae_pp"]:.3f} pp, duration={elapsed:.2f}s', flush=True)
            if report:
                report(state)
            if stop_after is not None and epoch >= stop_after:
                print(f'Deliberate smoke interruption after durable epoch {epoch}', flush=True)
                break
        storage.atomic(directory/'best.ckpt', storage.pack(dict(architecture=architecture, weights=best_weights)))
        model.load_state_dict(best_weights)
        result = dict(architecture=architecture, epoch=epoch, best_validation_loss=best, history=history,
                      dataset_sha256=metadata['dataset_sha256'],
                      train_count=len(parts['train']), validation=evaluate(model, data, parts['validation'], config.batch_size, 'best validation'))
        if evaluate_test:
            result['test'] = evaluate(model, data, parts['test'], config.batch_size, 'held-out test')
        storage.save_json(directory/'metrics.json', result)
        return result


def export_winner(root, candidate, config, identity):
    """Export the validation-selected candidate and evaluate its test split once.

    Args:
        root: Search root.
        candidate: Selected training directory.
        config: Complete runner settings.
        identity: Framework trial identity.

    Returns:
        Selected model metrics with held-out spectrum errors.
    """
    winner = Path(root)/'final'
    winner.mkdir(exist_ok=True)
    storage.atomic(winner/'best.ckpt', (Path(candidate)/'best.ckpt').read_bytes())
    data, _ = load_data(config.data)
    model = load_model(winner, config.device)
    indices = subset(data['test'], data['family'], config.max_eval)
    state = storage.load(candidate)
    validation_indices = subset(data['validation'], data['family'], config.max_eval)
    metrics = dict(identity=str(identity), architecture=state['architecture'], epoch=state['epoch'],
                   best_validation_loss=state['best'], history=state['history'],
                   dataset_sha256=load_data(config.data)[1]['dataset_sha256'],
                   train_count=len(subset(data['train'], data['family'], config.max_train)),
                   validation=evaluate(model, data, validation_indices, config.batch_size, 'selected winner validation'))
    metrics['test'] = evaluate(model, data, indices, config.batch_size, 'selected winner test')
    storage.save_json(winner/'metrics.json', metrics)
    storage.save_json(winner/'config.json', asdict(config))
    storage.save_json(Path(root)/'complete.json', metrics)
    return metrics
