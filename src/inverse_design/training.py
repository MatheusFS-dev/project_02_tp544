"""Deterministic epoch-boundary training, recovery and prediction APIs."""
from dataclasses import asdict, dataclass
import copy
import hashlib
import json
from pathlib import Path
import random
import tomllib
from time import perf_counter
import numpy as np
import torch
from tqdm import tqdm
from torch.nn import functional as F
from .core import Architecture, GEOMETRIES, SUBSTRATES, Model, dataset, decode, metrics, normalize
from . import storage


@dataclass(frozen=True)
class Config:
    """Fixed optimizer settings and bounded training/search budgets."""
    epochs: int = 50
    candidates: int = 100
    device: str = 'cuda:0'
    data: str = 'data/example.npz'
    seed: int = 42
    patience: int = 8
    min_delta: float = 1e-4
    batch_size: int = 32
    learning_rate: float = 1e-3
    weight_decay: float = 1e-4
    threads: int = 1
    output: str = 'runs'

    def __post_init__(self):
        if self.device not in ('auto', 'cuda', 'cuda:0', 'cpu'):
            raise ValueError('device must select GPU 0 (cuda:0) or explicitly request cpu')
        if not 1 <= self.epochs <= 50 or self.candidates < 1:
            raise ValueError('epochs must be 1–50 and candidates positive')
        if self.patience < 1 or self.batch_size < 1 or self.threads < 1 or self.min_delta < 0:
            raise ValueError('invalid training controls')
        if self.learning_rate <= 0 or self.weight_decay < 0:
            raise ValueError('invalid optimizer settings')


def load_config(runner):
    """Load the runner's TOML from src/configs without command-line parsing.

    Args:
        runner: Configuration name in src/configs.

    Returns:
        Training settings with the data path resolved relative to the TOML.
    """
    path = Path(__file__).resolve().parents[1] / 'configs' / f'{runner}.toml'
    settings = tomllib.loads(path.read_text())
    settings['data'] = str((path.parent / settings['data']).resolve())
    return Config(**settings)


def device_for(config):
    """Resolve the configured CPU or single CUDA device.

    Args:
        config: Settings with an explicit device string or automatic selection.

    Returns:
        Selected torch device. GPU 0 is the default, with no automatic CPU fallback."""
    return torch.device('cuda:0' if config.device in ('auto', 'cuda') else config.device)


def seed_all(config):
    """Initialize random generators and deterministic execution.

    Args:
        config: Settings providing the seed and CPU thread count."""
    torch.set_num_threads(config.threads)
    random.seed(config.seed)
    np.random.seed(config.seed)
    torch.manual_seed(config.seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed_all(config.seed)
    torch.use_deterministic_algorithms(True)


def random_state():
    """Capture all random generators used by the trainers."""
    return dict(python=random.getstate(), numpy=np.random.get_state(), torch=torch.get_rng_state(),
                cuda=torch.cuda.get_rng_state_all() if torch.cuda.is_available() else [])


def restore_random(state):
    """Restore random generators after model and optimizer construction.

    Args:
        state: Python, NumPy, PyTorch and optional CUDA generator states."""
    random.setstate(state['python'])
    np.random.set_state(state['numpy'])
    torch.set_rng_state(state['torch'])
    if state['cuda'] and torch.cuda.is_available():
        torch.cuda.set_rng_state_all(state['cuda'])


def specification(config, architecture=None):
    """Describe the data, split, configuration and architecture for hashing.

    Args:
        config: Complete settings to include in the resume identity.
        architecture: Candidate specification, or None for a search root.

    Returns:
        JSON-compatible versioned specification with hashes of every data array."""
    data = dataset(config.data)
    hashes = {k: hashlib.sha256(v.tobytes()).hexdigest() for k, v in data.items()}
    return dict(schema=1, data=hashes, config=asdict(config),
                architecture=asdict(architecture) if architecture else None)


def prepare(directory, config, architecture=None):
    """Validate run identity and persist shared synthetic arrays and split.

    Args:
        directory: Existing run directory owned by the caller.
        config: Settings included in the resume fingerprint.
        architecture: Candidate specification, or None for a search root.

    Returns:
        SHA-256 fingerprint of the complete resume specification.

    Raises:
        ValueError: An existing manifest has an incompatible specification."""
    directory = Path(directory)
    fingerprint = storage.manifest(directory, specification(config, architecture))
    if not (directory / 'data.npz').exists():
        import io
        buffer = io.BytesIO()
        np.savez(buffer, **dataset(config.data))
        storage.atomic(directory / 'data.npz', buffer.getvalue())
    return fingerprint


def loss(outputs, targets):
    """Sum equally weighted classification cross-entropies and Huber loss.

    Args:
        outputs: Geometry logits, substrate logits and coordinate tensors.
        targets: Corresponding class-index and coordinate tensors.

    Returns:
        Scalar differentiable total training objective."""
    return F.cross_entropy(outputs[0], targets[0]) + F.cross_entropy(outputs[1], targets[1]) + F.huber_loss(outputs[2], targets[2])


def train(directory, config=Config(), architecture=Architecture(), report=None, evaluate_test=True):
    """Train or resume a candidate and return best-validation metrics.

    Args:
        directory: Exclusive local output directory.
        config: Training and search settings.
        architecture: Serializable trunk specification.
        report: Optional callback receiving state after each durable epoch.
        evaluate_test: Whether this selected model may access the held-out test set.

    Returns:
        JSON-compatible metrics, architecture, epoch and validation history.
    """
    with storage.ownership(directory) as directory:
        print(f'Loading dataset and preparing training: {directory}', flush=True)
        fingerprint = prepare(directory, config, architecture)
        seed_all(config)
        device = device_for(config)
        model = Model(architecture).to(device)
        optimizer = torch.optim.AdamW(model.parameters(), lr=config.learning_rate, weight_decay=config.weight_decay)
        data = dataset(config.data)
        x = torch.tensor(normalize(data['x']), device=device)
        y = [torch.tensor(data[k], device=device) for k in ('geometry', 'substrate', 'coordinates')]
        state = storage.load(directory, fingerprint)
        if state is None:
            state = dict(fingerprint=fingerprint, architecture=asdict(architecture), epoch=0,
                         best=float('inf'), monitor=float('inf'), wait=0, history=[], complete=False)
        else:
            model.load_state_dict(state['weights'])
            optimizer.load_state_dict(state['optimizer'])
            restore_random(state['random'])
        resumed = state['epoch']
        if resumed:
            print(json.dumps(dict(resumed_epoch=resumed, optimizer_steps=max(float(v['step']) for v in optimizer.state.values()), wait=state['wait'])), flush=True)
        while state['epoch'] < config.epochs and state['wait'] < config.patience and not state['complete']:
            epoch_start = perf_counter()
            model.train()
            order = torch.tensor(data['train'])[torch.randperm(len(data['train']))].tolist()
            starts = range(0, len(order), config.batch_size)
            for start in tqdm(starts, desc=f"Training epoch {state['epoch'] + 1}/{config.epochs}",
                              unit='batch', unit_scale=False, bar_format='{l_bar}{bar}| {n_fmt}/{total_fmt} [{elapsed}<{remaining}, {rate_fmt}]'):
                batch = order[start:start + config.batch_size]
                optimizer.zero_grad(set_to_none=True)
                objective = loss(model(x[batch]), [t[batch] for t in y])
                objective.backward()
                optimizer.step()
            model.eval()
            print(f"Validating epoch {state['epoch'] + 1}/{config.epochs}", flush=True)
            with torch.no_grad():
                val = float(loss(model(x[data['validation']]), [t[data['validation']] for t in y]).cpu())
            if not np.isfinite(val):
                raise RuntimeError('non-finite validation loss')
            if val < state['best']:
                state['best'] = val
                state['best_weights'] = copy.deepcopy({k: v.cpu() for k, v in model.state_dict().items()})
            if val < state['monitor'] - config.min_delta:
                state['monitor'], state['wait'] = val, 0
            else:
                state['wait'] += 1
            state['epoch'] += 1
            state['history'].append(dict(epoch=state['epoch'], validation_loss=val))
            state.update(weights={k: v.detach().cpu().clone() for k, v in model.state_dict().items()},
                         optimizer=copy.deepcopy(optimizer.state_dict()), random=random_state())
            storage.save(directory, state)
            print(json.dumps(dict(epoch=state['epoch'], validation_loss=val, wait=state['wait'],
                                  epoch_duration_seconds=round(perf_counter() - epoch_start, 3))), flush=True)
            if report:
                report(state)
        state['complete'] = True
        print('Saving final metrics', flush=True)
        storage.save(directory, state)
        model.load_state_dict(state['best_weights'])
        model.eval()
        result = dict(architecture=asdict(architecture), best_validation_loss=state['best'],
                      epoch=state['epoch'], history=state['history'])
        with torch.no_grad():
            for split in ('validation', 'test') if evaluate_test else ('validation',):
                indices = data[split]
                result[split] = metrics([t.cpu().numpy() for t in model(x[indices])], data, indices)
        storage.save_json(directory / 'metrics.json', result)
        storage.save_json(directory / 'architecture.json', asdict(architecture))
        storage.save_json(directory / 'config.json', asdict(config))
        return result


def load_model(directory, device='cuda:0'):
    """Load a trusted local best-validation model for inference.

    Args:
        directory: Run or winner directory containing best.ckpt.
        device: Torch device on which to construct the model.

    Returns:
        Loaded PyTorch model in evaluation mode.

    Raises:
        ValueError: The checkpoint fails its integrity check."""
    state = storage.unpack(Path(directory) / 'best.ckpt')
    model = Model(Architecture(**state['architecture'])).to(device)
    model.load_state_dict(state['weights'])
    return model.eval()


def predict(model, values):
    """Return named classes, nanometer dimensions and class probabilities.

    Args:
        model: Loaded three-head PyTorch model in evaluation mode.
        values: Physical input rows ordered as A, B, X.

    Returns:
        One dictionary per row with named classes, dimensions and probabilities.

    Raises:
        ValueError: Any input fails domain validation."""
    with torch.no_grad():
        g, s, c = model(torch.tensor(normalize(values), device=next(model.parameters()).device))
        gp, sp = g.softmax(-1).cpu().numpy(), s.softmax(-1).cpu().numpy()
        gi, si = gp.argmax(-1), sp.argmax(-1)
        dims = decode(c.cpu().numpy(), gi)
    return [dict(geometry=GEOMETRIES[a], substrate=SUBSTRATES[b], outer_nm=float(d[0]),
                 inner_nm=float(d[1]), geometry_probabilities=p.tolist(), substrate_probabilities=q.tolist())
            for a, b, d, p, q in zip(gi, si, dims, gp, sp)]
