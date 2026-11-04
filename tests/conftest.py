"""Create fake test input explicitly, outside the training implementation."""
from pathlib import Path
import runpy
import numpy as np
import pytest


@pytest.fixture(scope='session')
def example_directory(tmp_path_factory):
    """Write the standalone generator's arrays into a temporary data directory."""
    root = tmp_path_factory.mktemp('received-data')
    (root / 'data').mkdir()
    generator = Path(__file__).resolve().parents[1] / 'data/fake_generator.py'
    arrays = runpy.run_path(str(generator))['generate']()
    np.savez(root / 'data/example.npz', **arrays)
    return root


@pytest.fixture(autouse=True)
def received_data(example_directory, monkeypatch):
    """Run tests against explicit temporary input without repository data files."""
    monkeypatch.chdir(example_directory)
