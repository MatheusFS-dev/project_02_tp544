"""Optional sampler transition and transactional winner-export regressions."""
import importlib.util
from pathlib import Path
import pytest
from inverse_design import storage
from inverse_design.core import Architecture
from inverse_design.search import export_winner
from inverse_design.training import Config, train


@pytest.mark.skipif(importlib.util.find_spec('optuna') is None, reason='Optuna extra not installed')
@pytest.mark.parametrize('crash_draw', [1, 2, 3, 4])
def test_optuna_sampler_draw_replay(tmp_path, monkeypatch, crash_draw):
    import optuna
    from inverse_design.optuna_search import sample_architecture
    def setup(name):
        url = f'sqlite:///{tmp_path / (name + ".sqlite3")}'
        study = optuna.create_study(storage=url, study_name=name, sampler=optuna.samplers.TPESampler(seed=42))
        return study, url
    reference, _ = setup('reference')
    interrupted, url = setup('interrupted')
    reference_path, interrupted_path = tmp_path / 'reference.ckpt', tmp_path / 'sampler.ckpt'
    # Exercise TPE's model-based path, not only startup random sampling.
    for study, path in [(reference, reference_path), (interrupted, interrupted_path)]:
        for i in range(11):
            journal = dict(number=i, consumed=0, sampler=study.sampler)
            trial = study.ask()
            spec = sample_architecture(study, trial, journal, path)
            study.tell(trial, float(spec.depth + spec.width / 1000))
    reference_trial = reference.ask()
    expected = sample_architecture(reference, reference_trial,
                                   dict(number=11, consumed=0, sampler=reference.sampler), reference_path)
    trial = interrupted.ask()
    journal = dict(number=11, consumed=0, sampler=interrupted.sampler)
    storage.atomic(interrupted_path, storage.pack(journal))
    original_atomic = storage.atomic
    calls = 0
    class Interrupted(Exception):
        pass
    def fail_before_snapshot(path, data):
        nonlocal calls
        calls += 1
        if calls == crash_draw:
            raise Interrupted
        original_atomic(path, data)
    with monkeypatch.context() as patch:
        patch.setattr(storage, 'atomic', fail_before_snapshot)
        with pytest.raises(Interrupted):
            sample_architecture(interrupted, trial, journal, interrupted_path)
    journal = storage.unpack(interrupted_path)
    recovered = optuna.load_study(study_name='interrupted', storage=url, sampler=journal['sampler'])
    trial = optuna.Trial(recovered, recovered.trials[-1]._trial_id)
    assert sample_architecture(recovered, trial, journal, interrupted_path) == expected
    reference.tell(reference_trial, .5)
    recovered.tell(trial, .5)
    next_ref, next_recovered = reference.ask(), recovered.ask()
    assert sample_architecture(reference, next_ref, dict(number=12, consumed=0, sampler=reference.sampler), reference_path) == sample_architecture(recovered, next_recovered, dict(number=12, consumed=0, sampler=recovered.sampler), interrupted_path)


def test_winner_complete_only_after_all_artifacts(tmp_path):
    config = Config(epochs=1, device='cpu')
    candidate = tmp_path / 'candidate'
    result = train(candidate, config, Architecture(depth=1, width=64), evaluate_test=False)
    root = tmp_path / 'search'
    root.mkdir()
    with pytest.raises(FileNotFoundError):
        export_winner(root, candidate, config, result['best_validation_loss'], '0', extra_artifacts=('best.keras',))
    assert not (root / 'complete.json').exists()
    export_winner(root, candidate, config, result['best_validation_loss'], '0')
    assert (root / 'complete.json').exists()
    assert storage.unpack(root / 'winner/best.ckpt')['architecture']['width'] == 64
