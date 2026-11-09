"""Seeded TPE search with persistent study and interrupted-trial recovery."""
import json
from pathlib import Path
from inverse_design.core import Architecture
from inverse_design.training import load_config, prepare, train
from inverse_design.search import export_winner
from inverse_design import storage


def run(config):
    """Run or resume the configured Optuna candidate budget.

    Args:
        config: Shared training, output and search-budget settings.

    Returns:
        Selected winner architecture, validation loss and held-out metrics."""
    import optuna
    print(f'Starting Optuna search: {config.candidates} candidates', flush=True)
    with storage.ownership(Path(config.output) / 'optuna') as root:
        prepare(root, config)
        if (root / 'complete.json').exists():
            return json.loads((root / 'complete.json').read_text())
        sampler_path = root / 'sampler.ckpt'
        journal = storage.unpack(sampler_path) if sampler_path.exists() else None
        sampler = journal['sampler'] if journal else optuna.samplers.TPESampler(seed=config.seed)
        study = optuna.create_study(study_name='inverse', storage=f'sqlite:///{root.resolve() / "study.sqlite3"}',
                                    load_if_exists=True, direction='minimize', sampler=sampler)
        while True:
            pending = [t for t in study.trials if t.state == optuna.trial.TrialState.RUNNING]
            if pending:
                trial = optuna.Trial(study, pending[0]._trial_id)
            elif len(study.trials) < config.candidates:
                journal = dict(number=len(study.trials), consumed=0, sampler=study.sampler)
                storage.atomic(sampler_path, storage.pack(journal))
                trial = study.ask()
            else:
                break
            if journal is None or journal['number'] != trial.number:
                raise RuntimeError('Optuna sampler journal does not match the interrupted trial')
            spec = sample_architecture(study, trial, journal, sampler_path)
            print(f'Training Optuna candidate {trial.number + 1}/{config.candidates}', flush=True)
            result = train(root / f'trial-{trial.number}', config, spec, evaluate_test=False)
            study.tell(trial, result['best_validation_loss'])
        best = study.best_trial
        print('Exporting Optuna winner', flush=True)
        return export_winner(root, root / f'trial-{best.number}', config, best.value, best.number)


def sample_architecture(study, trial, journal, sampler_path):
    """Journal each draw and replay a draw committed only to Optuna's SQLite.

    A process can die after SQLite commits a parameter but before the sampler
    snapshot commits. Replaying that single independent TPE draw advances the
    saved RNG without changing the parameter already attached to this trial.

    Args:
        study: Persistent Optuna study with the journal's sampler loaded.
        trial: Original running trial whose parameters must be preserved.
        journal: Sampler snapshot and count of durably consumed draws.
        sampler_path: Atomic sampler-journal filename.

    Returns:
        Original or newly sampled architecture for this trial.

    Raises:
        RuntimeError: A replay does not reproduce its persisted parameter.
    """
    import optuna
    choices = [('depth', optuna.distributions.IntDistribution(1, 6)),
               ('width', optuna.distributions.CategoricalDistribution([64, 128, 256, 512])),
               ('activation', optuna.distributions.CategoricalDistribution(['relu', 'silu', 'gelu'])),
               ('dropout', optuna.distributions.CategoricalDistribution([0., .1, .2, .3]))]
    for i, (name, distribution) in enumerate(choices):
        if i < journal['consumed']:
            continue
        if name in trial.params:
            sampled = study.sampler.sample_independent(study, study.trials[trial.number], name, distribution)
            if sampled != trial.params[name]:
                raise RuntimeError(f'Optuna sampler replay mismatch for {name}')
        elif name == 'depth':
            trial.suggest_int(name, 1, 6)
        else:
            trial.suggest_categorical(name, list(distribution.choices))
        journal.update(consumed=i + 1, sampler=study.sampler)
        storage.atomic(sampler_path, storage.pack(journal))
    return Architecture(**trial.params)


from inverse_design.run_logging import logged_runner


@logged_runner('optuna')
def main():
    """Execute the Optuna module entry point."""
    print(json.dumps(run(load_config('optuna')), indent=2))


if __name__ == '__main__':
    main()
