"""Isolated AutoKeras 3.0.0 / KerasTuner 1.4.7 epoch-recovery adapter.

The adapter searches the genuine AutoModel graph through its tuner. It bypasses
AutoTuner.search's final full-data refit and preprocessing, since inputs already
use the shared normalization. Explicit batches make epoch recovery deterministic.
"""
import copy
from dataclasses import asdict, replace
from importlib.metadata import version
import os
from time import perf_counter
from pathlib import Path
import types
import numpy as np
import torch
from tqdm import tqdm
from .core import Architecture, Model, dataset, normalize
from .training import device_for, prepare, random_state, restore_random, seed_all
from . import storage

os.environ['KERAS_BACKEND'] = 'torch'
import keras
import keras_tuner as kt
import autokeras as ak
from autokeras.engine.head import Head
from autokeras.tuners.random_search import RandomSearch


@keras.utils.register_keras_serializable(package='inverse_design')
class Trunk(ak.Block):
    """Search plain dense and pre-normalized residual feature extractors."""
    def build(self, hp, inputs=None):
        """Build one trunk from fixed shared architecture choices.

        Args:
            hp: Namespaced KerasTuner hyperparameters.
            inputs: Keras tensors entering the trunk.

        Returns:
            Feature tensor from the selected dense or residual trunk."""
        depth = hp.Int('depth', 1, 6)
        width = hp.Choice('width', [64, 128, 256, 512])
        activation = hp.Choice('activation', ['relu', 'silu', 'gelu'])
        dropout = hp.Choice('dropout', [0., .1, .2, .3])
        trunk = hp.Choice('trunk', ['dense', 'residual'])
        x = keras.layers.Dense(width, activation=activation, name='projection')(inputs[0])
        for i in range(depth):
            if trunk == 'residual':
                z = keras.layers.LayerNormalization(epsilon=1e-5, name=f'block_{i}_norm')(x)
                z = keras.layers.Dense(width, activation=activation, name=f'block_{i}_a')(z)
                z = keras.layers.Dropout(dropout, name=f'block_{i}_dropout')(z)
                z = keras.layers.Dense(width, name=f'block_{i}_b')(z)
                x = keras.layers.Add()([x, z])
            else:
                x = keras.layers.Dense(width, activation=activation, name=f'block_{i}_a')(x)
                x = keras.layers.Dropout(dropout, name=f'block_{i}_dropout')(x)
        return x


@keras.utils.register_keras_serializable(package='inverse_design')
class FixedHead(Head):
    """Fixed task head with explicit class count and loss."""
    def __init__(self, units=2, coordinate=False, **kwargs):
        self.units, self.coordinate = units, coordinate
        kwargs.setdefault('loss', keras.losses.Huber() if coordinate else keras.losses.SparseCategoricalCrossentropy(from_logits=True))
        super().__init__(**kwargs)

    def build(self, hp, inputs=None):
        """Create a fixed dense head without head hyperparameters.

        Args:
            hp: KerasTuner hyperparameters, unused by the fixed head.
            inputs: Keras feature tensors entering this head.

        Returns:
            Class logits or hard-sigmoid coordinate tensor."""
        return keras.layers.Dense(self.units, activation='hard_sigmoid' if self.coordinate else None, name=self.name)(inputs[0])

    def get_config(self):
        """Serialize task semantics for AutoKeras's persistent graph."""
        return dict(super().get_config(), units=self.units, coordinate=self.coordinate)


@keras.utils.register_keras_serializable(package='inverse_design')
class RoutedHuber(keras.losses.Loss):
    """True-family routed Huber objective for padded expert outputs."""

    def call(self, y_true, y_pred):
        """Return active-parameter losses for packed family and target rows.

        Args:
            y_true: Family index followed by seven coordinates.
            y_pred: Padded expert predictions.

        Returns:
            One masked Huber loss per sample.
        """
        from .families import MASK
        family = y_true[:, 0].long()
        values = y_pred[torch.arange(len(family), device=family.device), family]
        mask = torch.as_tensor(MASK, device=family.device)[family]
        return (torch.nn.functional.huber_loss(values, y_true[:, 1:], reduction='none') * mask).sum(-1) / mask.sum(-1)


@keras.utils.register_keras_serializable(package='inverse_design')
class ExpertHead(Head):
    """Small family-specific regressors sharing the AutoKeras trunk."""

    def __init__(self, **kwargs):
        kwargs.setdefault('loss', RoutedHuber())
        super().__init__(**kwargs)

    def build(self, hp, inputs=None):
        """Build padded expert outputs matching the PyTorch representation.

        Args:
            hp: Tuner hyperparameters, unused.
            inputs: Shared feature tensor.

        Returns:
            Tensor with twelve rows of seven masked coordinates per sample.
        """
        from .families import ACTIVE
        experts = []
        for i, active in enumerate(ACTIVE):
            hidden = keras.layers.Dense(32, activation=hp.values['trunk/activation'], name=f'expert_{i}_hidden')(inputs[0])
            values = keras.layers.Dense(len(active), activation='hard_sigmoid', name=f'expert_{i}_values')(hidden)
            projection = np.zeros((len(active), 7), dtype=np.float32)
            for j, index in enumerate(active):
                projection[j, index] = 1
            padded = keras.layers.Dense(7, use_bias=False, trainable=False,
                kernel_initializer=keras.initializers.Constant(projection), name=f'expert_{i}_pad')(values)
            experts.append(keras.layers.Reshape((1, 7))(padded))
        return keras.layers.Concatenate(axis=1, name=self.name)(experts)


def architecture(hp):
    """Extract the trunk's namespaced hyperparameters.

    Args:
        hp: KerasTuner hyperparameters from the genuine AutoModel graph.

    Returns:
        Shared immutable Architecture specification."""
    return Architecture(schema=2 if dataset(RecoverableTuner.config.data)['coordinates'].shape[1] == 7 else 1, **{k: hp.values[f'trunk/{k}'] for k in ('depth', 'width', 'activation', 'dropout', 'trunk')})


def torch_weights(model, spec):
    """Convert equivalent Keras layers to a portable PyTorch inference model.

    Args:
        model: Built Keras model with the adapter's named layers.
        spec: Matching shared architecture specification.

    Returns:
        PyTorch state dictionary containing equivalent inference weights."""
    target = Model(spec)
    def linear(layer, name):
        w, b = model.get_layer(name).get_weights()
        layer.weight.data.copy_(torch.tensor(w.T))
        layer.bias.data.copy_(torch.tensor(b))
    linear(target.trunk[0], 'projection')
    for i in range(spec.depth):
        block = target.trunk[i + 2]
        if spec.trunk == 'residual':
            gamma, beta = model.get_layer(f'block_{i}_norm').get_weights()
            block.layers[0].weight.data.copy_(torch.tensor(gamma))
            block.layers[0].bias.data.copy_(torch.tensor(beta))
            linear(block.layers[1], f'block_{i}_a')
            linear(block.layers[4], f'block_{i}_b')
        else:
            linear(block[0], f'block_{i}_a')
    linear(target.geometry, 'geometry')
    linear(target.substrate, 'substrate')
    if spec.schema == 2:
        for i, head in enumerate(target.experts):
            linear(head[0], f'expert_{i}_hidden')
            linear(head[2], f'expert_{i}_values')
    else:
        linear(target.dimensions[0], 'dimensions')
    return target.state_dict()


class RecoverableTuner(RandomSearch):
    """Version-pinned AutoTuner subclass preserving complete epoch state."""
    config = None
    root = None

    def run_trial(self, trial, *args, **kwargs):
        """Execute an AutoModel candidate, restoring optimizer, RNG and patience.

        Args:
            trial: KerasTuner trial retaining its original ID and parameters.
            *args: Unused tuner fit arguments.
            **kwargs: Unused tuner fit keyword arguments.

        Returns:
            Dictionary containing the lowest total validation loss."""
        config = self.config
        seed_all(config)
        keras.utils.set_random_seed(config.seed)
        model = self.hypermodel.build(trial.hyperparameters)
        spec = architecture(trial.hyperparameters)
        directory = self.root / f'trial-{trial.trial_id}'
        with storage.ownership(directory):
            print(f'Loading dataset and preparing AutoKeras trial {trial.trial_id}', flush=True)
            fingerprint = prepare(directory, config, spec)
            state = storage.load(directory, fingerprint)
            model.optimizer.build(model.trainable_variables)
            if state:
                for variable, value in zip(model.variables, state['variables']):
                    variable.assign(value)
                for variable, value in zip(model.optimizer.variables, state['optimizer']):
                    variable.assign(value)
                restore_random(state['random'])
                print(f"trial={trial.trial_id} resumed_epoch={state['epoch']} optimizer_steps={int(model.optimizer.iterations)} wait={state['wait']}", flush=True)
            else:
                state = dict(fingerprint=fingerprint, architecture=asdict(spec), epoch=0, best=float('inf'),
                             monitor=float('inf'), wait=0, history=[], complete=False)
            data = dataset(config.data)
            x = normalize(data['x'])
            y = [data[k] for k in ('geometry', 'substrate', 'coordinates')]
            if spec.schema == 2:
                y[2] = np.column_stack([data['geometry'], data['coordinates']]).astype(np.float32)
            while state['epoch'] < config.epochs and state['wait'] < config.patience and not state['complete']:
                epoch_start = perf_counter()
                order = np.random.permutation(data['train'])
                model.reset_metrics()
                starts = range(0, len(order), config.batch_size)
                for start in tqdm(starts, desc=f"Trial {trial.trial_id} training epoch {state['epoch'] + 1}/{config.epochs}",
                                  unit='batch', bar_format='{l_bar}{bar}| {n_fmt}/{total_fmt} [{elapsed}<{remaining}, {rate_fmt}]'):
                    batch = order[start:start+config.batch_size]
                    model.train_on_batch([x[batch]], [v[batch] for v in y])
                model.reset_metrics()
                print(f"Trial {trial.trial_id} validating epoch {state['epoch'] + 1}/{config.epochs}", flush=True)
                logs = model.test_on_batch([x[data['validation']]], [v[data['validation']] for v in y], return_dict=True)
                val = float(logs['loss'])
                if not np.isfinite(val):
                    raise RuntimeError('non-finite validation loss')
                if val < state['best']:
                    state['best'] = val
                    state['best_keras_weights'] = copy.deepcopy(model.get_weights())
                    state['best_weights'] = torch_weights(model, spec)
                if val < state['monitor'] - config.min_delta:
                    state['monitor'], state['wait'] = val, 0
                else:
                    state['wait'] += 1
                state['epoch'] += 1
                state['history'].append(dict(epoch=state['epoch'], validation_loss=val))
                state.update(variables=[v.numpy().copy() for v in model.variables],
                             optimizer=[v.numpy().copy() for v in model.optimizer.variables], random=random_state())
                storage.save(directory, state)
                print(f"trial={trial.trial_id} epoch={state['epoch']} val_loss={val} wait={state['wait']} epoch_duration_seconds={perf_counter() - epoch_start:.3f}", flush=True)
            state['complete'] = True
            print(f'Trial {trial.trial_id} saving final model and metrics', flush=True)
            storage.save(directory, state)
            model.set_weights(state['best_keras_weights'])
            model.save(directory / 'best.keras')
            storage.save_json(directory / 'metrics.json', dict(best_validation_loss=state['best'], history=state['history']))
            return {'val_loss': state['best']}


def make_automodel(root, config):
    """Construct a genuine AutoModel and fix its compilation policy.

    Args:
        root: Retained tuner project and candidate output directory.
        config: Shared training, resource and search-budget settings.

    Returns:
        AutoModel backed by the recoverable fixed-policy tuner.

    Raises:
        RuntimeError: Package versions or the active Keras backend mismatch."""
    for package, expected in [('autokeras', '3.0.0'), ('keras-tuner', '1.4.7'), ('keras', '3.11.3')]:
        if version(package) != expected:
            raise RuntimeError(f'epoch recovery adapter requires {package}=={expected}')
    if keras.backend.backend() != 'torch':
        raise RuntimeError('AutoKeras runner requires KERAS_BACKEND=torch before importing Keras')
    node = ak.Input(shape=(3,))
    node.dtype = 'float32'
    trunk = Trunk(name='trunk')(node)
    schema = 2 if dataset(config.data)['coordinates'].shape[1] == 7 else 1
    outputs = [FixedHead(12 if schema == 2 else 4, name='geometry')(trunk), FixedHead(2, name='substrate')(trunk),
               ExpertHead(name='dimensions')(trunk) if schema == 2 else FixedHead(2, coordinate=True, name='dimensions')(trunk)]
    RecoverableTuner.config, RecoverableTuner.root = config, Path(root)
    auto = ak.AutoModel(node, outputs, tuner=RecoverableTuner, directory=str(root),
                        project_name='tuner', max_trials=config.candidates, seed=config.seed, overwrite=False)
    def compile_fixed(graph, hp, model):
        model.compile(optimizer=keras.optimizers.AdamW(learning_rate=config.learning_rate,
                      weight_decay=config.weight_decay, epsilon=1e-8), loss=graph._get_loss())
        return model
    auto.tuner.hypermodel._compile_keras_model = types.MethodType(compile_fixed, auto.tuner.hypermodel)
    return auto


def search(auto):
    """Search through the tuner without AutoKeras's automatic final refit.

    Args:
        auto: Genuine AutoModel created by make_automodel."""
    # Populate the real graph space before oracle creation of the first trial.
    hp = auto.tuner.oracle.get_space()
    auto.tuner.hypermodel.build(hp)
    auto.tuner.oracle.update_space(hp)
    kt.Tuner.search(auto.tuner)
