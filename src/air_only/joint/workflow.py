"""Joint air + silica data preparation, training and inference."""
from air_only.flat.common import Config, ROOT, load_data, logging
import hashlib
import io
from pathlib import Path
import tomllib
import numpy as np
from air_only.shared import storage
from air_only.shared.catalogue import load_received, stratified_split
from air_only.shared.families import NAMES, SCALES, SUBSTRATES
from air_only.final import workflow as final_workflow
from air_only.final.workflow import CASES, split_80_20

SCHEMAS = dict(final='joint-flat-air-silica-80-20-v1', comparison='joint-flat-air-silica-70-15-15-v1')
SCHEMA = SCHEMAS['final']
SILICA_SPECTRA = 'Espectros_TRA_B'
DUPLICATE_TOLERANCE = 1e-3


def configuration(name='joint'):
    """Load a complete joint TOML and resolve its relative paths.

    Args:
        name: TOML basename, joint (80/20 final retraining) or joint_comparison (70/15/15).

    Returns:
        Training Config, selected topology directories and extra paths
        (silica_raw, air_data, references).
    """
    path = ROOT/f'configs/{name}.toml'
    print(f'Loading configuration: {path}', flush=True)
    values = tomllib.loads(path.read_text())
    sources = {key: (path.parent/value).resolve() for key, value in values.pop('selected_models').items()}
    references = {key: (path.parent/value).resolve() for key, value in values.pop('reference_models').items()}
    split = values.pop('split', 'final')
    if split not in SCHEMAS:
        raise ValueError('split must be final or comparison')
    extras = dict(split=split, silica_raw=(path.parent/values.pop('silica_raw')).resolve(),
                  air_data=(path.parent/values.pop('air_data')).resolve(), references=references)
    for key in ('data', 'raw', 'output'):
        values[key] = str((path.parent/values[key]).resolve())
    config = Config(**values)
    if config.device != 'cuda:0' or config.max_train or config.max_eval:
        raise ValueError('Joint configuration requires cuda:0 and the complete dataset')
    if config.epochs < 1 or config.batch_size < 1 or config.patience < 1:
        raise ValueError('Training counts must be positive')
    if not 0 < config.trust_fraction <= 1 or min(config.optimization_steps, config.multistarts) < 1:
        raise ValueError('Invalid optimization settings')
    if set(sources) != set(CASES) or set(references) != set(CASES):
        raise ValueError('All four selected and reference models are required')
    return config, sources, extras


def pair_partitions(air_keys, air_parts, silica_keys):
    """Give each silica geometry the partition of the identical air geometry.

    Args:
        air_keys: Geometry identity per air row.
        air_parts: Air train, validation and test index arrays.
        silica_keys: Geometry identity per silica row.

    Returns:
        Silica-local train, validation and test index arrays.

    Raises:
        ValueError: A silica geometry has no air counterpart.

    Examples:
        >>> parts = dict(train=np.array([0]), validation=np.array([1]), test=np.array([], dtype=np.int64))
        >>> pair_partitions([(0, 1.), (0, 2.)], parts, [(0, 2.)])['validation'].tolist()
        [0]
    """
    lookup = {key: index for index, key in enumerate(air_keys)}
    owner = {}
    for name, indices in air_parts.items():
        for index in indices:
            owner[int(index)] = name
    result = {name: [] for name in ('train', 'validation', 'test')}
    for index, key in enumerate(silica_keys):
        if key not in lookup:
            raise ValueError(f'Silica geometry {key} has no matching air geometry')
        result[owner[lookup[key]]].append(index)
    return {name: np.array(value, dtype=np.int64) for name, value in result.items()}


def _keys(designs):
    return [(row['family'], *row['parameters'].tolist()) for row in designs]


def prepare(config, extras):
    """Build the joint air + silica dataset with the air final split inherited by geometry.

    Args:
        config: Settings identifying the air raw folder, output NPZ and seed.
        extras: Resolved silica raw folder and air final dataset paths.

    Returns:
        Joint dataset provenance and partition manifest.

    Raises:
        ValueError: Inputs disagree with the air final dataset, a family lacks a
            substrate in a partition, or an existing joint dataset differs.
    """
    print('Loading air spectra', flush=True)
    air = load_received(config.raw)
    print('Loading silica spectra', flush=True)
    silica = load_received(extras['silica_raw'], SILICA_SPECTRA, Path(config.raw)/'geometrias_sorteadas.csv',
                           True, DUPLICATE_TOLERANCE)
    if not np.array_equal(air['wavelengths'], silica['wavelengths']):
        raise ValueError('Air and silica wavelength grids differ')
    print('Verifying air rows against the air dataset with the same split', flush=True)
    reference, reference_metadata = load_data(extras['air_data'])
    air_families = np.array([row['family'] for row in air['designs']], dtype=np.int64)
    split = extras.get('split', 'final')
    air_parts = (split_80_20 if split == 'final' else stratified_split)(air_families, config.seed)
    air_arrays = dict(family=air_families,
                      parameters=np.array([row['parameters']/SCALES for row in air['designs']], dtype=np.float32),
                      tra=np.stack([row['tra'] for row in air['designs']]).astype(np.float32),
                      source_ids=np.array([row['ids'][0] for row in air['designs']]))
    for key, value in dict(air_arrays, **air_parts, wavelengths=air['wavelengths']).items():
        if not np.array_equal(reference[key], value):
            raise ValueError(f'Air rows differ from the air final dataset in {key}')
    silica_parts = pair_partitions(_keys(air['designs']), air_parts, _keys(silica['designs']))
    offset = len(air['designs'])
    silica_families = np.array([row['family'] for row in silica['designs']], dtype=np.int64)
    arrays = dict(
        family=np.r_[air_families, silica_families],
        parameters=np.r_[air_arrays['parameters'],
                         np.array([row['parameters']/SCALES for row in silica['designs']], dtype=np.float32)],
        tra=np.r_[air_arrays['tra'], np.stack([row['tra'] for row in silica['designs']]).astype(np.float32)],
        wavelengths=air['wavelengths'],
        source_ids=np.r_[air_arrays['source_ids'], np.array([row['ids'][0] for row in silica['designs']])],
        substrate=np.r_[np.zeros(offset, dtype=np.int64), np.ones(len(silica['designs']), dtype=np.int64)],
        **{key: np.r_[air_parts[key], silica_parts[key]+offset].astype(np.int64) for key in ('train', 'validation', 'test')})
    for key in ('train', 'validation') if split == 'final' else ('train', 'validation', 'test'):
        for family in range(12):
            for code, name in enumerate(SUBSTRATES):
                rows = arrays[key]
                if not ((arrays['family'][rows] == family) & (arrays['substrate'][rows] == code)).any():
                    raise ValueError(f'{NAMES[family]} has no {name} geometry in {key}')
    path = Path(config.data)
    with storage.ownership(path.parent):
        if path.exists():
            data, old = load_data(path)
            if (old.get('schema') != SCHEMAS[split] or old['seed'] != config.seed
                    or old['source_hashes'] != dict(air=air['source_hashes'], silica=silica['source_hashes'])
                    or any(not np.array_equal(data[key], value) for key, value in arrays.items())):
                raise ValueError('Existing joint dataset differs, preserve it and choose a new data path')
            print('Verified existing joint dataset', flush=True)
            return old
        buffer = io.BytesIO()
        np.savez_compressed(buffer, **arrays)
        content = buffer.getvalue()
        designs = dict(air=air['designs'], silica=silica['designs'])
        metadata = dict(
            schema=SCHEMAS[split], substrates=list(SUBSTRATES), seed=config.seed,
            dataset_sha256=hashlib.sha256(content).hexdigest(),
            air_dataset_sha256=reference_metadata['dataset_sha256'],
            source_hashes=dict(air=air['source_hashes'], silica=silica['source_hashes']),
            silica_conflicts=silica['conflicts'], silica_missing_ids=silica['missing_ids'],
            silica_duplicate_rule='lowest source ID spectrum kept', silica_duplicate_tolerance=DUPLICATE_TOLERANCE,
            unique_designs={name: len(rows) for name, rows in designs.items()},
            received_spectra={name: sum(len(row['ids']) for row in rows) for name, rows in designs.items()},
            splits={key: {name: dict(
                designs=int((arrays['substrate'][arrays[key]] == code).sum()),
                family_counts={family: int(((arrays['family'][arrays[key]] == index)
                                            & (arrays['substrate'][arrays[key]] == code)).sum())
                               for index, family in enumerate(NAMES)})
                for code, name in enumerate(SUBSTRATES)} for key in ('train', 'validation', 'test')})
        storage.atomic(path, content)
        storage.save_json(path.with_suffix('.json'), metadata)
        counts = {key: {name: value['designs'] for name, value in metadata['splits'][key].items()}
                  for key in ('train', 'validation', 'test')}
        print(f'Saved joint {split} dataset: {len(arrays["family"])} rows. Train {counts["train"]}, '
              f'validation {counts["validation"]}, test {counts["test"]}', flush=True)
        return metadata


def joint_data(config):
    """Load and enforce the joint air + silica dataset.

    Args:
        config: Settings containing the prepared dataset path.

    Returns:
        Verified arrays and provenance metadata.
    """
    data, metadata = load_data(config.data)
    if metadata.get('schema') not in SCHEMAS.values() or metadata.get('substrates') != list(SUBSTRATES) or 'substrate' not in data:
        raise ValueError('Run python3 src/air_only/joint/prepare.py for the joint dataset')
    return data, metadata


def train_case(case, config, source, stop_after=None, evaluate_test=False):
    """Train one selected topology from scratch on the joint dataset.

    Args:
        case: Independent model case.
        config: Complete joint training settings.
        source: Selected model directory, used only for topology/provenance.
        stop_after: Optional interruption boundary for smoke checks.
        evaluate_test: Evaluate the held-out test split once (comparison split only).

    Returns:
        Validation metrics, plus test metrics when requested, including per-substrate errors.
    """
    return final_workflow.train_case(case, config, source, stop_after, joint_data, len(SUBSTRATES), evaluate_test)


def validate_geometry(geometry):
    """Validate a joint geometry, accepting air and silica substrates.

    Args:
        geometry: Family, substrate, tracks and seven native parameters in nm.
    """
    final_workflow.validate_geometry(geometry, SUBSTRATES)


def infer(case, config, request):
    """Optimize one request over 12 families and both substrates with a joint model.

    Args:
        case: Fixed independent model case.
        config: Complete joint inference settings.
        request: Band start/end in nm and target absorption fraction.

    Returns:
        Portable geometry dictionary (with substrate) and its saved JSON path.
    """
    return final_workflow.infer(case, config, request, joint_data, SUBSTRATES)


def interactive_infer(case):
    """Ask for an absorption request using one fixed case's joint model.

    Args:
        case: Model fixed by its dedicated inference runner.
    """
    config, _, _ = configuration()
    data, _ = joint_data(config)
    print(f'Enter a band inside {data["wavelengths"][0]:.3f}–{data["wavelengths"][-1]:.3f} nm. '
          'Absorption is a percent, such as 30 for 30%. The model chooses air or silica.', flush=True)
    request = [float(input('Band start (nm): ')), float(input('Band end (nm): ')),
               float(input('Desired constant absorption (%): '))/100]
    infer(case, config, request)
