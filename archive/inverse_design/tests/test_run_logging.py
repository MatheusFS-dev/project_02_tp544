"""Persistent runner console logging regression."""
from pathlib import Path
from types import SimpleNamespace
import pytest
from inverse_design.run_logging import logged_runner


def test_runner_logs_progress_and_failure(tmp_path, monkeypatch, capsys):
    monkeypatch.setattr('inverse_design.training.load_config', lambda _: SimpleNamespace(output=str(tmp_path)))

    @logged_runner('baseline')
    def failing():
        print('Loading dataset')
        raise ValueError('training failed')

    with pytest.raises(ValueError, match='training failed'):
        failing()
    text = (tmp_path / 'logs/baseline.log').read_text()
    assert 'Loading dataset' in text
    assert 'ValueError: training failed' in text
    assert 'Loading dataset' in capsys.readouterr().out
