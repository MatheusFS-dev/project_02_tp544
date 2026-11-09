"""Configuration, real-data loading and persistent console logging."""
import os

os.environ.setdefault('CUDA_VISIBLE_DEVICES', '0')
os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] = 'true'

from contextlib import contextmanager, redirect_stderr, redirect_stdout
from dataclasses import dataclass
from datetime import datetime
import hashlib
import json
from pathlib import Path
import sys
import tomllib
import numpy as np
import torch
from inverse_design.run_logging import Tee

ROOT = Path(__file__).resolve().parents[2]


@dataclass
class Config:
    """Complete settings loaded from one runner-specific TOML."""
    data: str
    raw: str
    output: str
    device: str = 'cuda:0'
    epochs: int = 300
    candidates: int = 100
    seed: int = 42
    patience: int = 30
    min_delta: float = .00001
    batch_size: int = 64
    learning_rate: float = .001
    weight_decay: float = .0001
    threads: int = 2
    width: int = 256
    depth: int = 3
    dropout: float = .1
    trunk: str = 'residual'
    max_train: int = 0
    max_eval: int = 0
    optimization_steps: int = 500
    multistarts: int = 8
    trust_fraction: float = .1
    tolerance: float = .05


def load_config(name):
    """Load a complete runner TOML and resolve its paths.

    Args:
        name: Runner suffix such as baseline, optuna, ray, smoke or prepare.

    Returns:
        Validated settings with absolute data and output paths.
    """
    path = ROOT/'src/configs'/f'flat_{name}.toml'
    print(f'Loading configuration: {path}', flush=True)
    values = tomllib.loads(path.read_text())
    for key in ('data', 'raw'):
        values[key] = str((path.parent/values[key]).resolve())
    values['output'] = str((ROOT/values['output']).resolve())
    config = Config(**values)
    if config.device != 'cuda:0':
        raise ValueError('flat runners require configured cuda:0')
    if config.epochs < 1 or config.batch_size < 1 or config.candidates < 1:
        raise ValueError('epochs, batch size and candidates must be positive')
    if not 0 < config.trust_fraction <= 1 or config.multistarts < 1 or config.optimization_steps < 1:
        raise ValueError('invalid optimization settings')
    return config


def load_data(path):
    """Read the prepared real spectra and reject missing or modified input.

    Args:
        path: Received-spectrum NPZ produced by prepare.py.

    Returns:
        Validated NumPy arrays and the source provenance manifest.
    """
    path = Path(path)
    metadata = json.loads(path.with_suffix('.json').read_text())
    if hashlib.sha256(path.read_bytes()).hexdigest() != metadata['dataset_sha256']:
        raise ValueError('prepared flat dataset checksum mismatch')
    with np.load(path, allow_pickle=False) as archive:
        data = {key: archive[key] for key in archive.files}
    n = len(data['family'])
    if data['tra'].shape != (n, len(data['wavelengths']), 3):
        raise ValueError('invalid spectral dimensions')
    if not np.isfinite(data['tra']).all() or not np.allclose(data['tra'].sum(-1), 1, atol=2e-6):
        raise ValueError('invalid received T/R/A power balance')
    parts = [data[key] for key in ('train', 'validation', 'test')]
    if len(np.concatenate(parts)) != n or len(np.unique(np.concatenate(parts))) != n:
        raise ValueError('duplicate or missing split rows')
    return data, metadata


def device(config):
    """Select the configured GPU without an implicit CPU fallback.

    Args:
        config: Complete runner settings.

    Returns:
        CUDA device after checking availability.
    """
    if not torch.cuda.is_available():
        raise RuntimeError('CUDA is required for flat training and optimization')
    torch.set_num_threads(config.threads)
    print(f'Using {config.device}: {torch.cuda.get_device_name(0)}', flush=True)
    return torch.device(config.device)


def final_directory(config, case):
    """Resolve one case's independent final-model directory.

    Args:
        config: Settings containing the output root.
        case: Baseline, optuna, autokeras or ray.

    Returns:
        Case-specific final checkpoint directory.
    """
    if case not in ('baseline', 'optuna', 'autokeras', 'ray'):
        raise ValueError('unknown flat absorption case')
    return Path(config.output)/case/'final'


@contextmanager
def logging(config, name, case=None):
    """Mirror terminal progress and errors into an append-only case log.

    Args:
        config: Runner settings defining the output root.
        name: Log basename.
        case: Optional independent case directory.

    Yields:
        Path of the persistent log.
    """
    root = Path(config.output)/case if case else Path(config.output)
    path = root/'logs'/f'{name}.log'
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open('a', buffering=1) as stream:
        with redirect_stdout(Tee(sys.stdout, stream)), redirect_stderr(Tee(sys.stderr, stream)):
            print(f'{datetime.now().isoformat()} Starting {name}. Log: {path}', flush=True)
            try:
                yield path
            except BaseException:
                import traceback
                traceback.print_exc()
                raise
            print(f'{datetime.now().isoformat()} Completed {name}', flush=True)
