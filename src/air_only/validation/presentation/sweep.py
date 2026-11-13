"""Prepare nested real-data subsets and resume the 45 learning-curve fits."""
import os
os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
os.environ.setdefault('CUDA_VISIBLE_DEVICES', '1')
os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] = 'true'

from dataclasses import replace
import hashlib
import json
from pathlib import Path
import numpy as np
from tqdm import tqdm
from air_only.flat.common import load_config, load_data, logging
from air_only.flat.training import train
from air_only.shared import storage

# ---------------------------------------------------------------------------- #
#                                    Config                                    #
# ---------------------------------------------------------------------------- #
FRACTIONS = (.1, .25, .5, .75, 1.)
SEEDS = (42, 43, 44)
CASES = ('baseline', 'optuna', 'autokeras')
ROOT = Path(__file__).resolve().parents[2]
OUTPUT = Path(__file__).resolve().parent
RUNS = ROOT/'runs/presentation/learning_curve'
# ---------------------------------------------------------------------------- #


def nested_rows(training, families, fraction, seed):
    """Select exact-size nested family-stratified training subsets.

    Args:
        training: Original training row indices.
        families: Family ID of each original row.
        fraction: Fraction of training rows to retain.
        seed: Seed for within-family random order.

    Returns:
        Deterministic original rows, with no validation or test rows.
    """
    rng = np.random.default_rng(seed)
    groups = [rng.permutation(training[families[training] == family])
              for family in np.unique(families[training])]
    # Interleave by normalized rank, so every prefix is proportional and nested.
    ranked = sorted(((j+.5)/len(group), family, int(row))
                    for family, group in enumerate(groups) for j, row in enumerate(group))
    return np.array([row for _, _, row in ranked[:round(len(training)*fraction)]], dtype=np.int64)


def prepare_subset(data, metadata, fraction, seed):
    """Write a checksummed subset retaining the complete fixed validation and test.

    Args:
        data: Prepared comparison dataset.
        metadata: Original provenance metadata.
        fraction: Retained training fraction.
        seed: Subset random seed.

    Returns:
        Path to the derived dataset.
    """
    selected = nested_rows(data['train'], data['family'], fraction, seed)
    rows = np.concatenate([selected, data['validation'], data['test']])
    derived = {}
    for key, value in data.items():
        if key not in ('train', 'validation', 'test'):
            derived[key] = value[rows] if key != 'wavelengths' and value.ndim and len(value) == len(data['family']) else value
    n, v = len(selected), len(data['validation'])
    derived.update(train=np.arange(n), validation=np.arange(n, n+v), test=np.arange(n+v, len(rows)))
    path = OUTPUT/'data'/f'seed_{seed}_fraction_{fraction:g}.npz'
    path.parent.mkdir(parents=True, exist_ok=True)
    if not path.exists():
        np.savez_compressed(path, **derived)
    with np.load(path) as existing:
        if any(not np.array_equal(existing[key], value) for key, value in derived.items()):
            raise ValueError('incompatible existing subset')
    storage.save_json(path.with_suffix('.json'), dict(dataset_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        source_dataset_sha256=metadata['dataset_sha256'], original_rows=rows.tolist(),
        original_training_rows=selected.tolist(), fraction=fraction, seed=seed))
    return path


def retained_results(path, source_hash):
    """Restore aggregate progress while rejecting a changed source dataset.

    Args:
        path: Aggregate summary file.
        source_hash: Expected original dataset SHA-256.

    Returns:
        Completed records retained across restarts.

    Raises:
        ValueError: The aggregate belongs to a different source dataset.
    """
    if not path.exists():
        return []
    artifact = json.loads(path.read_text())
    if artifact['source_dataset_sha256'] != source_hash:
        raise ValueError('learning curve source dataset changed')
    return artifact['results']


def main():
    """Run all selected topologies without repeating architecture searches."""
    print('Preparing the learning curve: 45 fits, GPU 1, atomic recovery', flush=True)
    config = load_config('baseline')
    data, metadata = load_data(config.data)
    if tuple(len(data[key]) for key in ('train', 'validation', 'test')) != (1348, 289, 289):
        raise ValueError('learning curve requires the original comparison split')
    results = retained_results(OUTPUT/'learning_curve.json', metadata['dataset_sha256'])
    for seed, fraction, case in tqdm([(s, f, c) for s in SEEDS for f in FRACTIONS for c in CASES], desc='Learning curve', unit='fit'):
        path = prepare_subset(data, metadata, fraction, seed)
        architecture = json.loads((ROOT/f'results/flat/{case}/final/metrics.json').read_text())['architecture']
        architecture.pop('points', None)
        directory = RUNS/case/f'seed_{seed}'/f'fraction_{fraction:g}'
        settings = replace(config, data=str(path), seed=seed, output=str(RUNS))
        with logging(settings, f'seed_{seed}_fraction_{fraction:g}', case=case):
            metrics = train(directory, settings, architecture, evaluate_test=True)
        results = [r for r in results if (r['case'], r['seed'], r['fraction']) != (case, seed, fraction)]
        results.append(dict(case=case, seed=seed, fraction=fraction, train_count=metrics['train_count'],
                            test=metrics['test'], best_validation_loss=metrics['best_validation_loss'], epochs=metrics['epoch']))
        storage.save_json(OUTPUT/'learning_curve.json', dict(source_dataset_sha256=metadata['dataset_sha256'],
            protocol='Nested family-stratified subsets, fixed validation/test, validation-selected epochs, no new topology search', results=results))
    print('Learning curve complete', flush=True)


if __name__ == '__main__':
    main()
