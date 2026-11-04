"""Ray orchestration regressions using bounded framework-boundary doubles."""
import importlib.util
from pathlib import Path
import pytest
from inverse_design.training import Config

pytestmark = pytest.mark.skipif(importlib.util.find_spec('ray') is None, reason='Ray extra not installed')


def test_interrupted_grid_is_not_exported(tmp_path, monkeypatch):
    from ray import tune
    from inverse_design import ray_search
    class PartialGrid:
        num_terminated = 0
        def __iter__(self):
            return iter(())
    class InterruptedTuner:
        def __init__(self, *args, **kwargs):
            pass
        @staticmethod
        def can_restore(path):
            return False
        def fit(self):
            return PartialGrid()
    monkeypatch.setattr(tune, 'Tuner', InterruptedTuner)
    with pytest.raises(RuntimeError, match='interrupted'):
        ray_search.run(Config(epochs=2, candidates=1, device='cpu', output=str(tmp_path)))
    assert not (tmp_path / 'ray/complete.json').exists()
    assert not (tmp_path / 'ray/winner').exists()


def test_registered_checkpoint_replaces_newer_local_epoch(tmp_path, monkeypatch):
    from contextlib import contextmanager
    from types import SimpleNamespace
    from ray import tune
    from inverse_design import ray_search
    source = tmp_path / 'registered'
    source.mkdir()
    (source / 'epoch-0001.ckpt').write_bytes(b'old')
    trial = tmp_path / 'trial'
    target = trial / 'training'
    target.mkdir(parents=True)
    (target / 'epoch-0002.ckpt').write_bytes(b'unreported')
    class Checkpoint:
        @contextmanager
        def as_directory(self):
            yield str(source)
    monkeypatch.setattr(tune, 'get_context', lambda: SimpleNamespace(get_trial_dir=lambda: str(trial)))
    monkeypatch.setattr(tune, 'get_checkpoint', lambda: Checkpoint())
    observed = []
    def check(directory, *args, **kwargs):
        observed.extend(p.name for p in Path(directory).iterdir())
    monkeypatch.setattr(ray_search, 'train', check)
    from dataclasses import asdict
    ray_search.candidate(dict(depth=1, width=64), asdict(Config(device='cpu')))
    assert observed == ['epoch-0001.ckpt']
