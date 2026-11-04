"""Shared input domain, file-backed data, labels, architecture and evaluation semantics."""
from dataclasses import dataclass
import numpy as np
import torch
from torch import nn

GEOMETRIES = ('disk', 'square', 'circular ring', 'square ring')
SUBSTRATES = ('air', 'SiO₂')


def normalize(values):
    """Validate physical inputs and return normalized float32 rows.

    Args:
        values: Finite physical input rows ordered as A, B, X.

    Returns:
        A float32 array with normalized wavelength columns and unchanged X.

    Raises:
        ValueError: Inputs violate the shape, finiteness or physical bounds."""
    x = np.asarray(values, dtype=np.float64)
    if x.ndim != 2 or x.shape[1] != 3 or not np.isfinite(x).all():
        raise ValueError('inputs must be finite rows of [A, B, X]')
    a, b, absorption = x.T
    if not ((450 <= a) & (a < b) & (b <= 1600) & (0 <= absorption) & (absorption <= 1)).all():
        raise ValueError('require 450 ≤ A < B ≤ 1600 and 0 ≤ X ≤ 1')
    return ((x - [450, 450, 0]) / [1150, 1150, 1]).astype(np.float32)


def decode(coordinates, geometry):
    """Decode outer fraction and inner ratio into outer/inner nanometers.

    Args:
        coordinates: Rows containing outer fraction and inner-to-outer ratio.
        geometry: Corresponding geometry class indices.

    Returns:
        Bounded outer/inner nanometer pairs, with zero inner size for solids."""
    c = np.clip(np.asarray(coordinates), 0, 1)
    outer = c[..., 0] * 320
    inner = np.where(np.asarray(geometry) < 2, 0, outer * c[..., 1])
    return np.stack([outer, inner], axis=-1)


def dataset(path='data/example.npz'):
    """Load received data and fixed split indices from an NPZ file.

    Args:
        path: Existing NPZ containing physical x, labels, coordinates and splits.

    Returns:
        Validated arrays ready for normalization and training.

    Raises:
        FileNotFoundError: The supplied dataset does not exist.
        ValueError: Required arrays, values or split indices are invalid.
    """
    keys = ('x', 'geometry', 'substrate', 'coordinates', 'train', 'validation', 'test')
    with np.load(path, allow_pickle=False) as archive:
        if not set(keys).issubset(archive.files):
            raise ValueError(f'dataset must contain {keys}')
        data = {key: archive[key] for key in keys}
    normalize(data['x'])
    n = len(data['x'])
    for key, classes in (('geometry', 4), ('substrate', 2)):
        values = data[key]
        if values.shape != (n,) or values.dtype.kind not in 'iu' or not ((0 <= values) & (values < classes)).all():
            raise ValueError(f'invalid {key} labels')
        data[key] = values.astype(np.int64)
    coordinates = data['coordinates']
    if coordinates.shape != (n, 2) or not np.isfinite(coordinates).all() or not ((0 <= coordinates) & (coordinates <= 1)).all():
        raise ValueError('coordinates must be finite [outer/320, inner/outer] rows in [0, 1]')
    if (coordinates[data['geometry'] < 2, 1] != 0).any():
        raise ValueError('solid shapes must have zero inner ratio')
    data['coordinates'] = coordinates.astype(np.float32)
    for key in ('train', 'validation', 'test'):
        indices = data[key]
        if indices.ndim != 1 or not len(indices) or indices.dtype.kind not in 'iu' or not ((0 <= indices) & (indices < n)).all():
            raise ValueError(f'invalid {key} indices')
        data[key] = indices.astype(np.int64)
    indices = np.concatenate([data[key] for key in ('train', 'validation', 'test')])
    if len(indices) != n or len(np.unique(indices)) != n:
        raise ValueError('splits must be disjoint and cover every row exactly once')
    return data


@dataclass(frozen=True)
class Architecture:
    """Serializable residual or dense trunk specification."""
    depth: int = 3
    width: int = 256
    activation: str = 'silu'
    dropout: float = 0.0
    trunk: str = 'residual'

    def __post_init__(self):
        if not 1 <= self.depth <= 6 or self.width not in (64, 128, 256, 512):
            raise ValueError('invalid depth or width')
        if self.activation not in ('relu', 'silu', 'gelu') or self.dropout not in (0, .1, .2, .3):
            raise ValueError('invalid activation or dropout')
        if self.trunk not in ('residual', 'dense'):
            raise ValueError('invalid trunk')


class Block(nn.Module):
    """Pre-normalized residual block."""
    def __init__(self, spec):
        super().__init__()
        act = {'relu': nn.ReLU, 'silu': nn.SiLU, 'gelu': nn.GELU}[spec.activation]
        self.layers = nn.Sequential(nn.LayerNorm(spec.width), nn.Linear(spec.width, spec.width),
                                    act(), nn.Dropout(spec.dropout), nn.Linear(spec.width, spec.width))

    def forward(self, x):
        """Apply residual update.

        Args:
            x: Batch of hidden features at the configured width.

        Returns:
            Input features plus the learned residual update."""
        return x + self.layers(x)


class Model(nn.Module):
    """Three-head inverse model consuming normalized inputs."""
    def __init__(self, architecture=Architecture()):
        super().__init__()
        self.architecture = architecture
        a = architecture
        act = {'relu': nn.ReLU, 'silu': nn.SiLU, 'gelu': nn.GELU}[a.activation]
        blocks = [Block(a) if a.trunk == 'residual' else nn.Sequential(
            nn.Linear(a.width, a.width), act(), nn.Dropout(a.dropout)) for _ in range(a.depth)]
        self.trunk = nn.Sequential(nn.Linear(3, a.width), act(), *blocks)
        self.geometry = nn.Linear(a.width, 4)
        self.substrate = nn.Linear(a.width, 2)
        self.dimensions = nn.Sequential(nn.Linear(a.width, 2), nn.Hardsigmoid())

    def forward(self, x):
        """Return geometry logits, substrate logits and bounded coordinates.

        Args:
            x: Batch of three normalized input features.

        Returns:
            Geometry logits, substrate logits and hard-sigmoid coordinates."""
        z = self.trunk(x)
        return self.geometry(z), self.substrate(z), self.dimensions(z)


def metrics(outputs, data, indices):
    """Compute shared classification and decoded dimensional metrics.

    Args:
        outputs: Geometry logits, substrate logits and coordinate arrays.
        data: Shared dataset dictionary containing reference labels.
        indices: Dataset rows corresponding to the supplied outputs.

    Returns:
        Classification accuracies and decoded dimensional MAEs in nanometers."""
    g, s, c = [np.asarray(x) for x in outputs]
    pg, ps = g.argmax(-1), s.argmax(-1)
    target_g, target_s = data['geometry'][indices], data['substrate'][indices]
    error = np.abs(decode(c, pg) - decode(data['coordinates'][indices], target_g))
    return dict(geometry_accuracy=float(np.mean(pg == target_g)),
                substrate_accuracy=float(np.mean(ps == target_s)),
                joint_accuracy=float(np.mean((pg == target_g) & (ps == target_s))),
                dimensional_mae_nm=float(error.mean()),
                outer_mae_nm=float(error[:, 0].mean()), inner_mae_nm=float(error[:, 1].mean()))
