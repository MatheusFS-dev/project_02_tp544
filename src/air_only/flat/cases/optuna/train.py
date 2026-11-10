"""Validation-only Optuna search for flat-spectrum forward architectures."""
from air_only.flat.common import load_config, logging
from dataclasses import asdict
import json
from pathlib import Path
import optuna
from air_only.shared import storage
from air_only.flat.common import load_data
from air_only.flat.training import train, export_winner


def run(config):
    """Resume a TPE architecture search and export its validation-selected model.

    Args:
        config: Complete Optuna settings.

    Returns:
        Selected architecture and held-out forward-spectrum metrics.
    """
    with storage.ownership(Path(config.output)/'optuna') as root:
        _, metadata = load_data(config.data)
        settings = {key: value for key, value in asdict(config).items() if key not in ('data', 'raw', 'output')}
        storage.manifest(root, dict(settings=settings, dataset_sha256=metadata['dataset_sha256']))
        if (root/'complete.json').exists():
            print('Optuna search is already complete', flush=True)
            return json.loads((root/'complete.json').read_text())
        study = optuna.create_study(study_name='flat_spectrum', storage=f'sqlite:///{root/"study.sqlite3"}',
                                   direction='minimize', load_if_exists=True,
                                   sampler=optuna.samplers.TPESampler(seed=config.seed),
                                   pruner=optuna.pruners.MedianPruner(n_startup_trials=5, n_warmup_steps=10))
        sampler_path = root/'sampler.ckpt'
        if sampler_path.exists():
            study.sampler.__dict__.update(storage.unpack(sampler_path).__dict__)
        while True:
            trials = study.get_trials(deepcopy=False)
            finished = [trial for trial in trials if trial.state.is_finished()]
            if len(finished) >= config.candidates:
                break
            pending = [trial for trial in trials if trial.state == optuna.trial.TrialState.RUNNING]
            trial = optuna.trial.Trial(study, pending[0]._trial_id) if pending else study.ask()
            architecture = dict(width=trial.suggest_categorical('width', [128, 256, 512]),
                                depth=trial.suggest_int('depth', 2, 5),
                                dropout=trial.suggest_categorical('dropout', [0., .1, .2]),
                                trunk=trial.suggest_categorical('trunk', ['plain', 'residual']))
            storage.atomic(sampler_path, storage.pack(study.sampler))
            print(f'Optuna trial {trial.number+1}/{config.candidates}: {architecture}', flush=True)
            def report(state):
                trial.report(state['best'], state['epoch'])
                if trial.should_prune():
                    raise optuna.TrialPruned()
            try:
                result = train(root/f'trial-{trial.number}', config, architecture, report=report)
            except optuna.TrialPruned:
                study.tell(trial, state=optuna.trial.TrialState.PRUNED)
                print(f'Pruned Optuna trial {trial.number} after a durable checkpoint', flush=True)
            else:
                study.tell(trial, result['best_validation_loss'])
            storage.atomic(sampler_path, storage.pack(study.sampler))
        best = study.best_trial
        print(f'Exporting Optuna winner {best.number}', flush=True)
        return export_winner(root, root/f'trial-{best.number}', config, best.number)


def main():
    """Execute the configured complete Optuna forward-spectrum search."""
    config = load_config('optuna')
    with logging(config, 'train', case='optuna'):
        print(json.dumps(run(config), indent=2), flush=True)


if __name__ == '__main__':
    main()
