"""Resumable Ray ASHA search for flat-spectrum forward architectures."""
from flat.common import Config, load_config, load_data, logging
from dataclasses import asdict
import json
from pathlib import Path
from inverse_design import storage
from flat.training import train, export_winner


def candidate_directory(config, trial_id):
    """Keep rotating epoch files outside Ray's asynchronous artifact sync tree.

    Args:
        config: Independent Ray case settings.
        trial_id: Stable identifier from the current Ray trial context.

    Returns:
        Persistent training directory separate from experiment artifacts.
    """
    return Path(config.output)/'ray'/'training'/trial_id


def candidate(parameters, settings):
    """Train one candidate and publish durable epoch checkpoints to Ray.

    Args:
        parameters: Candidate architecture dictionary.
        settings: Serialized complete training settings.
    """
    from ray import tune
    config = Config(**settings)
    directory = candidate_directory(config, tune.get_context().get_trial_id())
    checkpoint = tune.get_checkpoint()
    if checkpoint and not (directory/'best.ckpt').exists():
        with checkpoint.as_directory() as source:
            for path in Path(source).iterdir():
                if path.is_file() and path.name != '.lock':
                    storage.atomic(directory/path.name, path.read_bytes())
    reported_epoch = None
    def report(state):
        nonlocal reported_epoch
        tune.report(dict(validation_loss=state['best'], epoch=state['epoch']),
                    checkpoint=tune.Checkpoint.from_directory(str(directory)))
        reported_epoch = state['epoch']
    train(directory, config, parameters, report=report)
    state = storage.load(directory)
    if reported_epoch != state['epoch']:
        report(state)


def run(config):
    """Run or restore ASHA search, selecting solely by validation spectrum loss.

    Args:
        config: Complete Ray resource and training settings.

    Returns:
        Selected architecture and held-out forward-spectrum metrics.
    """
    import ray
    from ray import tune
    from ray.tune import RunConfig, CheckpointConfig
    from ray.tune.schedulers import ASHAScheduler
    from ray.tune.search.basic_variant import BasicVariantGenerator
    with storage.ownership(Path(config.output)/'ray') as root:
        _, metadata = load_data(config.data)
        settings = {key: value for key, value in asdict(config).items() if key not in ('data', 'raw', 'output')}
        storage.manifest(root, dict(settings=settings, dataset_sha256=metadata['dataset_sha256']))
        if (root/'complete.json').exists():
            print('Ray search is already complete', flush=True)
            return json.loads((root/'complete.json').read_text())
        print(f'Starting Ray: {config.candidates} candidates, ASHA, one GPU per candidate', flush=True)
        if not ray.is_initialized():
            ray.init(num_cpus=config.threads, num_gpus=1, include_dashboard=False)
        trainable = tune.with_resources(tune.with_parameters(candidate, settings=asdict(config)),
                                        dict(cpu=config.threads, gpu=1))
        experiment = root/'experiment'
        if tune.Tuner.can_restore(str(experiment)):
            tuner = tune.Tuner.restore(str(experiment), trainable=trainable, resume_unfinished=True, resume_errored=True)
        else:
            tuner = tune.Tuner(trainable, param_space=dict(width=tune.choice([128, 256, 512]), depth=tune.randint(2, 6),
                               dropout=tune.choice([0., .1, .2]), trunk=tune.choice(['plain', 'residual'])),
                               tune_config=tune.TuneConfig(metric='validation_loss', mode='min', num_samples=config.candidates,
                               search_alg=BasicVariantGenerator(random_state=config.seed, max_concurrent=1),
                               scheduler=ASHAScheduler(time_attr='epoch', max_t=config.epochs,
                                                       grace_period=min(10, config.epochs), reduction_factor=3)),
                               run_config=RunConfig(name='experiment', storage_path=str(root.resolve()),
                               checkpoint_config=CheckpointConfig(num_to_keep=2), verbose=1))
        results = tuner.fit()
        if any(result.error for result in results):
            raise RuntimeError('Ray candidates failed, rerun the same command to resume')
        if results.num_terminated != config.candidates:
            raise RuntimeError('Ray search is incomplete, rerun the same command to resume')
        best = results.get_best_result(metric='validation_loss', mode='min')
        print(f'Exporting Ray winner {Path(best.path).name} from its committed checkpoint', flush=True)
        with best.checkpoint.as_directory() as directory:
            return export_winner(root, directory, config, Path(best.path).name)


def main():
    """Execute the configured complete Ray forward-spectrum search."""
    config = load_config('ray')
    with logging(config, 'train', case='ray'):
        print(json.dumps(run(config), indent=2), flush=True)


if __name__ == '__main__':
    main()
