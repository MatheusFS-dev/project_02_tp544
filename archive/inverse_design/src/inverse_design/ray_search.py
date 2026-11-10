"""Ray Tune random residual search with ASHA and experiment restoration."""
from dataclasses import asdict
import json
from pathlib import Path
import shutil
from inverse_design.core import Architecture
from inverse_design.training import Config, load_config, device_for, prepare, train
from inverse_design.search import export_winner
from inverse_design import storage


def candidate(parameters, settings):
    """Train one Ray candidate, reporting a durable checkpoint each epoch.

    Args:
        parameters: Candidate architecture dictionary supplied by Ray Tune.
        settings: Serialized shared Config settings."""
    from ray import tune as ray_train
    config = Config(**settings)
    directory = Path(ray_train.get_context().get_trial_dir()) / 'training'
    checkpoint = ray_train.get_checkpoint()
    if checkpoint:
        with checkpoint.as_directory() as source:
            if directory.exists():
                shutil.rmtree(directory)
            shutil.copytree(source, directory)
    def report(state):
        ray_train.report({'validation_loss': state['best'], 'epoch': state['epoch'], 'wait': state['wait']},
                         checkpoint=ray_train.Checkpoint.from_directory(str(directory)))
    train(directory, config, Architecture(**parameters), report=report, evaluate_test=False)


def run(config):
    """Execute or restore one experiment, including unfinished/errored trials.

    Args:
        config: Shared training, resource, output and search-budget settings.

    Returns:
        Selected winner architecture, validation loss and held-out metrics.

    Raises:
        RuntimeError: Trials failed or the experiment was interrupted."""
    from ray import tune
    from ray.tune import CheckpointConfig, RunConfig
    from ray.tune.schedulers import ASHAScheduler
    from ray.tune.search.basic_variant import BasicVariantGenerator
    print(f'Starting Ray search: {config.candidates} candidates', flush=True)
    with storage.ownership(Path(config.output) / 'ray') as root:
        prepare(root, config)
        if (root / 'complete.json').exists():
            return json.loads((root / 'complete.json').read_text())
        experiment = root.resolve() / 'experiment'
        trainable = tune.with_resources(tune.with_parameters(candidate, settings=asdict(config)),
                                        {'cpu': config.threads, 'gpu': 0 if device_for(config).type == 'cpu' else 1})
        if tune.Tuner.can_restore(str(experiment)):
            tuner = tune.Tuner.restore(str(experiment), trainable=trainable, resume_unfinished=True, resume_errored=True)
        else:
            tuner = tune.Tuner(trainable, param_space={
                'depth': tune.randint(1, 7), 'width': tune.choice([64, 128, 256, 512]),
                'activation': tune.choice(['relu', 'silu', 'gelu']), 'dropout': tune.choice([0., .1, .2, .3])},
                tune_config=tune.TuneConfig(metric='validation_loss', mode='min', num_samples=config.candidates,
                    search_alg=BasicVariantGenerator(random_state=config.seed, max_concurrent=1),
                    scheduler=ASHAScheduler(time_attr='epoch', max_t=config.epochs,
                                            grace_period=min(10, config.epochs), reduction_factor=3)),
                run_config=RunConfig(name='experiment', storage_path=str(root.resolve()),
                    checkpoint_config=CheckpointConfig(num_to_keep=2)))
        results = tuner.fit()
        if any(result.error for result in results):
            raise RuntimeError('Ray trials failed, rerun to restore errored trials')
        if results.num_terminated != config.candidates:
            raise RuntimeError('Ray experiment interrupted before budget completion, rerun to resume')
        best = results.get_best_result(metric='validation_loss', mode='min')
        print('Exporting Ray winner', flush=True)
        with best.checkpoint.as_directory() as path:
            return export_winner(root, path, config, best.metrics['validation_loss'], best.path)


from inverse_design.run_logging import logged_runner


@logged_runner('ray')
def main():
    """Execute the Ray module entry point."""
    print(json.dumps(run(load_config('ray')), indent=2))


if __name__ == '__main__':
    main()
