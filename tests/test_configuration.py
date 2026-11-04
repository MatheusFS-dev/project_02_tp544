"""File-backed data and automatic runner configuration regressions."""
from dataclasses import fields
from pathlib import Path
import sys
import numpy as np
import pytest
from inverse_design.core import dataset
from inverse_design.training import Config, load_config, specification


def test_missing_data_is_never_generated(tmp_path):
    path = tmp_path / 'missing.npz'
    with pytest.raises(FileNotFoundError):
        dataset(path)
    assert not path.exists()


def test_each_runner_loads_complete_default_config(monkeypatch):
    monkeypatch.setattr(sys, 'argv', ['runner'])
    for runner in ('baseline', 'optuna', 'autokeras', 'ray'):
        config = load_config(runner)
        assert config.device == 'cuda:0'
        assert Path(config.data).is_absolute()
        assert Path(config.data).name == 'example.npz'
        import tomllib
        path = Path(__file__).resolve().parents[1] / 'src/configs' / f'{runner}.toml'
        assert set(tomllib.loads(path.read_text())) == {field.name for field in fields(Config)}


def test_config_is_independent_of_command_line(monkeypatch):
    monkeypatch.setattr(sys, 'argv', ['runner', 'unused.toml', 'unused'])
    config = load_config('baseline')
    expected = Path(__file__).resolve().parents[1] / 'data/example.npz'
    assert config.data == str(expected)


def test_configured_data_changes_resume_fingerprint(tmp_path):
    data = dataset()
    path = tmp_path / 'received.npz'
    np.savez(path, **data)
    config = Config(data=str(path))
    before = specification(config)
    data['coordinates'] = data['coordinates'].copy()
    data['coordinates'][0, 0] += .01
    np.savez(path, **data)
    assert specification(config) != before


def test_received_data_has_no_fixed_sample_count(tmp_path):
    original = dataset()
    data = {key: original[key][:8] for key in ('x', 'geometry', 'substrate', 'coordinates')}
    data.update(train=np.arange(4), validation=np.arange(4, 6), test=np.arange(6, 8))
    path = tmp_path / 'small.npz'
    np.savez(path, **data)
    assert len(dataset(path)['x']) == 8


def test_received_data_rejects_overlapping_splits(tmp_path):
    data = dataset()
    data['test'] = data['validation'].copy()
    path = tmp_path / 'overlap.npz'
    np.savez(path, **data)
    with pytest.raises(ValueError, match='disjoint'):
        dataset(path)
