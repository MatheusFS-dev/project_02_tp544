"""Genuine AutoKeras spectrum graph and equivalent PyTorch model export."""
from air_only.flat.common import Config
import os
os.environ['KERAS_BACKEND'] = 'torch'

from pathlib import Path
import types
import numpy as np
import torch
import keras
import autokeras as ak
from autokeras.engine.head import Head
from air_only.shared.families import MASK
from air_only.flat.model import SpectrumModel


def pack_inputs(families, parameters):
    """Pack family indicators, masked parameters and active masks for AutoKeras.

    Args:
        families: Integer family indices.
        parameters: Seven normalized parameters per geometry.

    Returns:
        Float32 array with 26 input features per geometry.
    """
    masks = MASK[families]
    return np.concatenate((np.eye(12, dtype=np.float32)[families], parameters*masks, masks), -1).astype(np.float32)


@keras.utils.register_keras_serializable(package='flat_spectrum')
class FamilyFeatures(keras.layers.Layer):
    """Learn family embeddings while retaining geometry parameters and masks."""

    def build(self, input_shape):
        """Create the twelve family embeddings.

        Args:
            input_shape: Packed input dimensions.
        """
        self.embeddings = self.add_weight(name='embeddings', shape=(12, 16), initializer='random_normal')

    def call(self, inputs):
        """Embed family indicators and append the normalized geometry features.

        Args:
            inputs: Packed family and geometry tensors.

        Returns:
            Thirty features per geometry.
        """
        return keras.ops.concatenate((keras.ops.matmul(inputs[:, :12], self.embeddings), inputs[:, 12:]), axis=-1)


@keras.utils.register_keras_serializable(package='flat_spectrum')
class SpectrumLoss(keras.losses.Loss):
    """Match the shared absorption-first forward-spectrum training objective."""

    def call(self, y_true, y_pred):
        """Compute absorption MSE, worst deviation and auxiliary T/R/A error.

        Args:
            y_true: Received T/R/A spectra.
            y_pred: Predicted T/R/A spectra.

        Returns:
            Per-geometry spectrum losses.
        """
        delta = y_pred[..., 2]-y_true[..., 2]
        return (keras.ops.mean(keras.ops.square(delta), axis=-1)
                +.25*keras.ops.max(keras.ops.abs(delta), axis=-1)
                +.1*keras.ops.mean(keras.ops.square(y_pred-y_true), axis=(-1, -2)))


@keras.utils.register_keras_serializable(package='flat_spectrum')
class SpectrumTrunk(ak.Block):
    """Search the spectrum trunk independently inside the AutoKeras graph."""

    def build(self, hp, inputs=None):
        """Build plain or residual layers with the shared architecture space.

        Args:
            hp: Namespaced AutoKeras hyperparameters.
            inputs: Packed input tensors.

        Returns:
            Geometry-conditioned spectrum features.
        """
        width = hp.Choice('width', [128, 256, 512])
        depth = hp.Int('depth', 2, 5)
        dropout = hp.Choice('dropout', [0., .1, .2])
        trunk = hp.Choice('trunk', ['plain', 'residual'])
        x = FamilyFeatures(name='family_features')(inputs[0])
        x = keras.layers.Dense(width, activation='silu', name='projection')(x)
        for i in range(depth):
            value = keras.layers.Dense(width, name=f'block_{i}_dense')(x)
            value = keras.layers.LayerNormalization(epsilon=1e-5, name=f'block_{i}_norm')(value)
            value = keras.layers.Activation('silu')(value)
            value = keras.layers.Dropout(dropout)(value)
            x = keras.layers.Add()([x, value]) if trunk == 'residual' else value
        return x


@keras.utils.register_keras_serializable(package='flat_spectrum')
class SpectrumHead(Head):
    """Predict nonnegative T/R/A fractions conserving power per wavelength."""

    def __init__(self, points=401, **kwargs):
        """Set the complete received spectral grid size.

        Args:
            points: Number of received wavelengths.
            **kwargs: AutoKeras head settings.
        """
        self.points = points
        kwargs.setdefault('loss', SpectrumLoss())
        super().__init__(**kwargs)

    def build(self, hp, inputs=None):
        """Build fixed-size T/R/A spectrum probabilities.

        Args:
            hp: Head hyperparameters, unused.
            inputs: Shared trunk features.

        Returns:
            Wavelength-by-three spectrum tensor.
        """
        logits = keras.layers.Dense(self.points*3, name='tra_logits')(inputs[0])
        return keras.layers.Softmax(axis=-1, name=self.name)(keras.layers.Reshape((self.points, 3))(logits))

    def get_config(self):
        """Return the serializable head configuration."""
        return dict(super().get_config(), points=self.points)


def architecture(hp, points):
    """Read the candidate architecture selected by the AutoKeras graph.

    Args:
        hp: Trial hyperparameters.
        points: Spectral grid size.

    Returns:
        Matching PyTorch spectrum architecture settings.
    """
    return dict(points=points, **{key: hp.values[f'trunk/{key}'] for key in ('width', 'depth', 'dropout', 'trunk')})


def torch_weights(model, spec):
    """Convert the trained AutoKeras spectrum network for gradient-based design.

    Args:
        model: Trained Keras spectrum model.
        spec: Equivalent PyTorch architecture settings.

    Returns:
        Portable PyTorch state dictionary.
    """
    target = SpectrumModel(**spec)
    target.embedding.weight.data.copy_(torch.tensor(model.get_layer('family_features').get_weights()[0]))
    def linear(layer, name):
        weights, bias = model.get_layer(name).get_weights()
        layer.weight.data.copy_(torch.tensor(weights.T))
        layer.bias.data.copy_(torch.tensor(bias))
    linear(target.input[0], 'projection')
    for i, block in enumerate(target.blocks):
        linear(block[0], f'block_{i}_dense')
        gamma, beta = model.get_layer(f'block_{i}_norm').get_weights()
        block[1].weight.data.copy_(torch.tensor(gamma))
        block[1].bias.data.copy_(torch.tensor(beta))
    linear(target.output, 'tra_logits')
    return target.state_dict()


def make_automodel(root, config, points=401):
    """Create a genuine, persistent AutoModel with fixed training policy.

    Args:
        root: Independent AutoKeras case directory.
        config: Complete AutoKeras settings.
        points: Received wavelength count.

    Returns:
        Genuine AutoModel backed by epoch-recoverable candidate training.
    """
    from air_only.flat.cases.autokeras.train import RecoverableTuner
    if keras.backend.backend() != 'torch':
        raise RuntimeError('AutoKeras flat spectra requires KERAS_BACKEND=torch')
    node = ak.Input(shape=(26,))
    node.dtype = 'float32'
    output = SpectrumHead(points=points, name='tra')(SpectrumTrunk(name='trunk')(node))
    RecoverableTuner.config, RecoverableTuner.root = config, Path(root)
    auto = ak.AutoModel(node, output, tuner=RecoverableTuner, directory=str(root), project_name='tuner',
                        max_trials=config.candidates, seed=config.seed, overwrite=False)
    def compile_fixed(graph, hp, model):
        model.compile(optimizer=keras.optimizers.AdamW(learning_rate=config.learning_rate,
                      weight_decay=config.weight_decay, epsilon=1e-8), loss=SpectrumLoss())
        return model
    auto.tuner.hypermodel._compile_keras_model = types.MethodType(compile_fixed, auto.tuner.hypermodel)
    return auto
