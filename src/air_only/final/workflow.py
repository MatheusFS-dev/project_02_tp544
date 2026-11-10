"""Final air-only data preparation, fixed-architecture training and inference."""
from air_only.flat.common import Config, ROOT, device, load_data, logging
from dataclasses import asdict
import hashlib
import io
import json
from pathlib import Path
import tomllib
import numpy as np
from tqdm import tqdm
from air_only.shared import storage
from air_only.shared.catalogue import load_received
from air_only.shared.families import NAMES, PARAMETERS, MASK, SCALES
from air_only.flat.training import train, load_model
from air_only.flat.optimize import optimize

CASES = ('baseline', 'optuna', 'ray', 'autokeras')


def configuration():
    """Load the complete shared final TOML and resolve its relative paths.

    Returns:
        Training Config, selected-model directories and HFSS settings.
    """
    path = ROOT/'configs/final.toml'
    print(f'Loading configuration: {path}', flush=True)
    values = tomllib.loads(path.read_text())
    sources = {key: (path.parent/value).resolve() for key, value in values.pop('selected_models').items()}
    hfss = values.pop('hfss')
    for key in ('data', 'raw', 'output'):
        values[key] = str((path.parent/values[key]).resolve())
    config = Config(**values)
    if config.device != 'cuda:0' or config.max_train or config.max_eval:
        raise ValueError('Final configuration requires cuda:0 and the complete dataset')
    if config.epochs < 1 or config.batch_size < 1 or config.patience < 1:
        raise ValueError('Training counts must be positive')
    if not 0 < config.trust_fraction <= 1 or min(config.optimization_steps, config.multistarts) < 1:
        raise ValueError('Invalid optimization settings')
    if set(sources) != set(CASES):
        raise ValueError('All four selected models are required')
    return config, sources, hfss


def split_80_20(families, seed):
    """Partition unique geometries by family, with no test examples.

    Args:
        families: Family index for each unique geometry.
        seed: Reproducible split seed.

    Returns:
        Train, validation and empty compatibility test index arrays.
    """
    rng = np.random.default_rng(seed)
    parts = dict(train=[], validation=[], test=[])
    for family in range(12):
        indices = np.flatnonzero(families == family)
        if len(indices) < 2:
            raise ValueError('Every family needs at least two unique geometries')
        rng.shuffle(indices)
        boundary = min(len(indices)-1, max(1, round(len(indices)*.8)))
        parts['train'].extend(indices[:boundary])
        parts['validation'].extend(indices[boundary:])
    return {key: np.array(sorted(value), dtype=np.int64) for key, value in parts.items()}


def prepare(config):
    """Explicitly prepare all received spectra using a grouped 80/20 split.

    Args:
        config: Settings identifying raw data, output NPZ and seed.

    Returns:
        Dataset provenance and partition manifest.
    """
    print('Loading every received source spectrum and grouping duplicate geometries', flush=True)
    catalogue = load_received(config.raw)
    designs = catalogue['designs']
    families = np.array([row['family'] for row in designs], dtype=np.int64)
    parts = split_80_20(families, config.seed)
    path = Path(config.data)
    with storage.ownership(path.parent):
        if path.exists():
            data, old = load_data(path)
            if (old.get('schema') != 'final-flat-air-80-20-v1' or old['seed'] != config.seed
                    or old['source_hashes'] != catalogue['source_hashes']
                    or any(not np.array_equal(data[key], value) for key, value in parts.items())):
                raise ValueError('Existing final dataset differs, preserve it and choose a new data path')
            print('Verified existing final 80/20 dataset', flush=True)
            return old
        arrays = dict(family=families,
                      parameters=np.array([row['parameters']/SCALES for row in designs], dtype=np.float32),
                      tra=np.stack([row['tra'] for row in designs]).astype(np.float32),
                      wavelengths=catalogue['wavelengths'], source_ids=np.array([row['ids'][0] for row in designs]), **parts)
        buffer = io.BytesIO()
        np.savez_compressed(buffer, **arrays)
        content = buffer.getvalue()
        metadata = dict(schema='final-flat-air-80-20-v1', substrate='air', seed=config.seed,
                        dataset_sha256=hashlib.sha256(content).hexdigest(), source_hashes=catalogue['source_hashes'],
                        unique_designs=len(designs), received_spectra=sum(len(row['ids']) for row in designs),
                        duplicate_sources={row['ids'][0]: row['ids'] for row in designs},
                        splits={key: dict(designs=len(ids),
                            source_ids=[gid for i in ids for gid in designs[i]['ids']],
                            family_counts={name: int((families[ids] == i).sum()) for i, name in enumerate(NAMES)})
                            for key, ids in parts.items()})
        storage.atomic(path, content)
        storage.save_json(path.with_suffix('.json'), metadata)
        print(f'Saved all {metadata["received_spectra"]} sources: {len(parts["train"])} training, '
              f'{len(parts["validation"])} validation, 0 test geometries', flush=True)
        return metadata


def final_data(config):
    """Load and enforce the final workflow's complete air-only 80/20 dataset.

    Args:
        config: Settings containing the prepared dataset path.

    Returns:
        Verified arrays and provenance metadata.
    """
    data, metadata = load_data(config.data)
    expected = split_80_20(data['family'], config.seed)
    if (metadata.get('schema') != 'final-flat-air-80-20-v1' or metadata.get('substrate') != 'air'
            or any(not np.array_equal(data[key], expected[key]) for key in expected)):
        raise ValueError('Run python3 src/air_only/final/prepare.py for the correct final dataset')
    return data, metadata


def train_case(case, config, source, stop_after=None):
    """Train a selected topology from scratch, or resume its own epoch state.

    Args:
        case: Independent model case.
        config: Complete training settings.
        source: Earlier selected model directory, used only for topology/provenance.
        stop_after: Optional interruption boundary for smoke checks.

    Returns:
        Validation-only metrics for the newly trained model.
    """
    if case not in CASES:
        raise ValueError('Unknown final case')
    _, metadata = final_data(config)
    source = Path(source)
    selected = json.loads((source/'metrics.json').read_text())
    checkpoint = storage.unpack(source/'best.ckpt')
    architecture = checkpoint['architecture']
    if architecture != selected['architecture']:
        raise ValueError('Source checkpoint and selected architecture disagree')
    specification = dict(case=case, initialization='from scratch',
                         selected_identity=selected.get('identity', case), architecture=architecture,
                         source_checkpoint_sha256=hashlib.sha256((source/'best.ckpt').read_bytes()).hexdigest(),
                         dataset_sha256=metadata['dataset_sha256'])
    with logging(config, 'train', case=case):
        with storage.ownership(Path(config.output)/case) as root:
            storage.manifest(root, specification)
            print(f'Training {case} selected topology from scratch: {architecture}', flush=True)
            result = train(root/'training', config,
                           {key: value for key, value in architecture.items() if key != 'points'}, stop_after=stop_after)
            state = storage.load(root/'training')
            completed = state['epoch'] >= config.epochs or state['wait'] >= config.patience
            result.update(case=case, selected_source=specification, completed=completed,
                          validation_count=result['validation']['count'], substrate='air', test_count=0)
            if completed:
                winner = root/'final'
                winner.mkdir(exist_ok=True)
                storage.atomic(winner/'best.ckpt', (root/'training/best.ckpt').read_bytes())
                storage.save_json(winner/'metrics.json', result)
                storage.save_json(winner/'config.json', asdict(config))
                storage.save_json(root/'complete.json', result)
                print(f'Published {case}: {winner/"best.ckpt"}', flush=True)
            return result


def validate_geometry(geometry):
    """Reject unsupported substrates, invalid family parameters and ring holes.

    Args:
        geometry: Family, substrate, tracks and seven native parameters in nm.

    Raises:
        ValueError: Geometry cannot be represented by the received HFSS setup.
    """
    if geometry.get('substrate') != 'air':
        raise ValueError('This final version supports the received air substrate only')
    if geometry.get('family') not in NAMES:
        raise ValueError('Unknown F01–F12 family')
    family = NAMES.index(geometry['family'])
    values = geometry['parameters_nm']
    if set(values) != set(PARAMETERS):
        raise ValueError('Expected the seven native geometry parameter keys')
    for index, name in enumerate(PARAMETERS):
        value = values[name]
        if MASK[family, index]:
            if isinstance(value, bool) or value is None or not np.isfinite(value) or not 0 < value <= SCALES[index]:
                raise ValueError(f'Invalid active dimension {name}')
        elif value not in (None, 0):
            raise ValueError(f'Inactive dimension {name} must be null or zero')
    if values['Lout_q'] and 2*values['w_q'] >= values['Lout_q']:
        raise ValueError('Square ring must have a positive hole')
    if values['Rout_c'] and values['w_c'] >= values['Rout_c']:
        raise ValueError('Circular ring must have a positive hole')
    if geometry.get('tracks') not in (0, 1, False, True) or bool(geometry['tracks']) != (family in (5, 7, 9, 11)):
        raise ValueError('Track flag does not match geometry family')


def geometry_text(geometry):
    """Format applicable native dimensions as ordinary text with full precision.

    Args:
        geometry: Validated geometry dictionary.

    Returns:
        Family, substrate, tracks and active dimensions in nm.
    """
    validate_geometry(geometry)
    lines = [f'Family: {geometry["family"]}', f'Substrate: {geometry["substrate"]}',
             f'Tracks: {"yes" if geometry["tracks"] else "no"}']
    for name, value in geometry['parameters_nm'].items():
        if value is not None and value != 0:
            lines.append(f'{name}: {float(value):.17g} nm')
    lines += ['Circular dimensions are radii. Square dimensions are side lengths.']
    return '\n'.join(lines)


def infer(case, config, request):
    """Optimize one absorption request and print/save the selected geometry.

    Args:
        case: Fixed independent model case.
        config: Complete inference settings.
        request: Band start/end in nm and target absorption fraction.

    Returns:
        Portable geometry dictionary and its saved JSON path.
    """
    if case not in CASES:
        raise ValueError('Unknown final case')
    device(config)
    data, metadata = final_data(config)
    model_path = Path(config.output)/case/'final'
    metrics = json.loads((model_path/'metrics.json').read_text())
    if not metrics['completed'] or metrics['dataset_sha256'] != metadata['dataset_sha256']:
        raise ValueError('Final model is incomplete or belongs to a different dataset')
    digest = hashlib.sha256((model_path/'best.ckpt').read_bytes()).hexdigest()
    key = storage.digest(dict(request=list(request), checkpoint=digest,
                              steps=config.optimization_steps, starts=config.multistarts,
                              trust_fraction=config.trust_fraction))[:16]
    directory = Path(config.output)/case/'designs'/key
    with logging(config, 'infer', case=case):
        result = optimize(load_model(model_path, config.device), data, config, request, directory)
        candidate = result['candidates'][0]
        geometry = dict(family=candidate['family'], substrate=candidate['substrate'], tracks=candidate['tracks'],
                        parameters_nm=candidate['parameters_nm'], request=list(request),
                        case=case, checkpoint_sha256=digest, dataset_sha256=metadata['dataset_sha256'],
                        predicted_worst_error_pp=candidate['predicted_worst_error_pp'])
        text = geometry_text(geometry)
        path = directory/'geometry.json'
        storage.save_json(path, geometry)
        (directory/'geometry.txt').write_text(text+'\n')
        print('\nSelected geometry\n'+text, flush=True)
        print(f'Predicted worst target error: {candidate["predicted_worst_error_pp"]:.3f} pp. '
              'This geometry requires HFSS verification.', flush=True)
        print(f'Geometry file for HFSS: {path}', flush=True)
        return geometry, path


def interactive_infer(case):
    """Ask for an absorption request using one fixed case's final model.

    Args:
        case: Model fixed by its dedicated inference runner.
    """
    config, _, _ = configuration()
    data, _ = final_data(config)
    print(f'Enter a band inside {data["wavelengths"][0]:.3f}–{data["wavelengths"][-1]:.3f} nm. '
          'Absorption is a percent, such as 30 for 30%.', flush=True)
    request = [float(input('Band start (nm): ')), float(input('Band end (nm): ')),
               float(input('Desired constant absorption (%): '))/100]
    infer(case, config, request)
