"""Independent genuine AutoKeras training, epoch recovery and final export."""
from flat.common import load_config, load_data, device, logging
import os
os.environ['KERAS_BACKEND'] = 'torch'

from dataclasses import asdict
import copy
import json
from pathlib import Path
import time
import numpy as np
import torch
import keras
import keras_tuner as kt
from autokeras.tuners.random_search import RandomSearch
from tqdm import tqdm
from inverse_design import storage
from inverse_design.training import random_state, restore_random
from flat.training import subset, export_winner


class RecoverableTuner(RandomSearch):
    """Train actual AutoKeras candidates with complete epoch recovery."""
    config = None
    root = None

    def run_trial(self, trial, *args, **kwargs):
        """Fit one AutoKeras graph and preserve optimizer, patience and RNG state.

        Args:
            trial: AutoKeras trial identity and graph parameters.
            *args: Unused graph-fit arguments.
            **kwargs: Unused graph-fit options.

        Returns:
            Lowest validation-only spectrum loss.
        """
        from flat.cases.autokeras.model import architecture, torch_weights, pack_inputs
        config = self.config
        data, metadata = load_data(config.data)
        keras.utils.set_random_seed(config.seed)
        model = self.hypermodel.build(trial.hyperparameters)
        spec = architecture(trial.hyperparameters, len(data['wavelengths']))
        settings = {key: value for key, value in asdict(config).items() if key not in ('data', 'raw', 'output')}
        with storage.ownership(self.root/f'trial-{trial.trial_id}') as directory:
            fingerprint = storage.manifest(directory, dict(settings=settings, architecture=spec,
                                                          dataset_sha256=metadata['dataset_sha256']))
            model.optimizer.build(model.trainable_variables)
            state = storage.load(directory, fingerprint)
            if state:
                for variable, value in zip(model.variables, state['variables']):
                    variable.assign(value)
                for variable, value in zip(model.optimizer.variables, state['optimizer']):
                    variable.assign(value)
                restore_random(state['random'])
                print(f'AutoKeras trial {trial.trial_id}: resuming epoch {state["epoch"]}', flush=True)
            else:
                state = dict(fingerprint=fingerprint, architecture=spec, epoch=0, best=float('inf'),
                             wait=0, history=[])
            train_rows = subset(data['train'], data['family'], config.max_train)
            validation = subset(data['validation'], data['family'], config.max_eval)
            x = pack_inputs(data['family'], data['parameters'])
            while state['epoch'] < config.epochs and state['wait'] < config.patience:
                started = time.perf_counter()
                order = np.random.permutation(train_rows)
                model.reset_metrics()
                print(f'AutoKeras trial {trial.trial_id}: training {len(order)} real spectra', flush=True)
                for start in tqdm(range(0, len(order), config.batch_size),
                                  desc=f'AutoKeras {trial.trial_id} epoch {state["epoch"]+1}/{config.epochs}', unit='batch'):
                    rows = order[start:start+config.batch_size]
                    model.train_on_batch([x[rows]], data['tra'][rows])
                train_loss = float(model.get_metrics_result()['loss'])
                model.reset_metrics()
                print(f'AutoKeras trial {trial.trial_id}: evaluating {len(validation)} validation spectra', flush=True)
                measured = model.test_on_batch([x[validation]], data['tra'][validation], return_dict=True)
                value = float(measured['loss'])
                if not np.isfinite(value):
                    raise ValueError('nonfinite AutoKeras validation spectrum loss')
                if value < state['best']-config.min_delta:
                    state.update(best=value, wait=0, best_keras_weights=copy.deepcopy(model.get_weights()),
                                 best_weights=torch_weights(model, spec))
                else:
                    state['wait'] += 1
                state['epoch'] += 1
                elapsed = time.perf_counter()-started
                state['history'].append(dict(epoch=state['epoch'], train_loss=train_loss,
                                             validation_loss=value, seconds=elapsed))
                state.update(variables=[variable.numpy().copy() for variable in model.variables],
                             optimizer=[variable.numpy().copy() for variable in model.optimizer.variables], random=random_state())
                storage.save(directory, state)
                print(f'AutoKeras epoch {state["epoch"]}/{config.epochs}: train={train_loss:.6f}, '
                      f'val={value:.6f}, duration={elapsed:.2f}s', flush=True)
            storage.save(directory, state)
            model.set_weights(state['best_keras_weights'])
            model.save(directory/'best.keras')
            storage.save_json(directory/'metrics.json', dict(architecture=spec, epoch=state['epoch'],
                              best_validation_loss=state['best'], history=state['history']))
            return {'val_loss': state['best']}


def run(config):
    """Run only this case's AutoKeras search and export one final model.

    Args:
        config: Complete independent AutoKeras settings.

    Returns:
        Final AutoKeras model's held-out spectrum metrics.
    """
    from flat.cases.autokeras.model import make_automodel, pack_inputs
    from flat.training import load_model
    gpu = device(config)
    data, metadata = load_data(config.data)
    settings = {key: value for key, value in asdict(config).items() if key not in ('data', 'raw', 'output')}
    with storage.ownership(Path(config.output)/'autokeras') as root:
        storage.manifest(root, dict(settings=settings, dataset_sha256=metadata['dataset_sha256']))
        if (root/'complete.json').exists():
            print('Independent AutoKeras search already complete', flush=True)
            return json.loads((root/'complete.json').read_text())
        with keras.device(str(gpu)):
            auto = make_automodel(root, config, len(data['wavelengths']))
            hp = auto.tuner.oracle.get_space()
            auto.tuner.hypermodel.build(hp)
            auto.tuner.oracle.update_space(hp)
            kt.Tuner.search(auto.tuner)
        best = auto.tuner.oracle.get_best_trials(1)[0]
        candidate = root/f'trial-{best.trial_id}'
        # Verify conversion before evaluating the selected model's test partition.
        converted = load_model(candidate, config.device)
        from flat.cases.autokeras.model import SpectrumLoss, FamilyFeatures
        with keras.device(str(gpu)):
            native = keras.models.load_model(candidate/'best.keras')
            rows = data['validation'][:8]
            reference = native.predict_on_batch([pack_inputs(data['family'][rows], data['parameters'][rows])])
        with torch.no_grad():
            prediction = converted(torch.as_tensor(data['family'][rows], device=gpu),
                                   torch.as_tensor(data['parameters'][rows], device=gpu)).cpu().numpy()
        if not np.allclose(reference, prediction, atol=2e-6):
            raise ValueError('AutoKeras export spectrum parity check failed')
        print('AutoKeras native/exported spectrum parity verified', flush=True)
        result = export_winner(root, candidate, config, best.trial_id)
        return result


def main():
    """Execute only the independent AutoKeras case from its own TOML."""
    config = load_config('autokeras')
    with logging(config, 'train', case='autokeras'):
        print(json.dumps(run(config), indent=2), flush=True)


if __name__ == '__main__':
    main()
