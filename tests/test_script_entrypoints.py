"""Direct file entry points must resolve imports without starting training."""
from pathlib import Path
import runpy
import pytest
from inverse_design.training import Config


@pytest.mark.parametrize('name', ['baseline', 'optuna_search', 'autokeras_search', 'ray_search'])
def test_direct_file_entrypoint_reaches_dataset_validation(name, tmp_path, monkeypatch):
    root = Path(__file__).resolve().parents[1]
    config = Config(data=str(tmp_path / 'missing.npz'), output=str(tmp_path / name), device='cpu', epochs=1, candidates=1)
    monkeypatch.setattr('inverse_design.training.load_config', lambda _: config)
    with pytest.raises(FileNotFoundError):
        runpy.run_path(str(root / 'src/inverse_design' / f'{name}.py'), run_name='__main__')
