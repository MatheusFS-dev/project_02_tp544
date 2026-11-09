"""Validated full-catalogue arrays and family-stratified geometry partitions."""
import csv
import json
from pathlib import Path
import numpy as np
from tqdm import tqdm
from .families import ACTIVE, MASK, NAMES, PARAMETERS, SCALES
from .core import normalize
from .preparation import _digest


def validate_arrays(data):
    """Validate the version-two NPZ training contract.

    Args:
        data: Loaded required training arrays.

    Returns:
        Validated arrays.

    Raises:
        ValueError: Labels, parameters or partitions violate the contract.
    """
    normalize(data['x'])
    n = len(data['x'])
    for key, classes in [('geometry', 12), ('substrate', 2)]:
        a = data[key]
        if a.shape != (n,) or a.dtype.kind not in 'iu' or np.any((a < 0) | (a >= classes)):
            raise ValueError(f'invalid {key} labels')
    c = data['coordinates']
    if c.shape != (n, 7) or not np.isfinite(c).all() or np.any((c < 0) | (c > 1)):
        raise ValueError('invalid family parameters')
    if np.any(c * (1 - MASK[data['geometry']]) != 0):
        raise ValueError('inactive parameters must be zero')
    for split in ('train', 'validation', 'test'):
        a = data[split]
        if a.ndim != 1 or not len(a) or a.dtype.kind not in 'iu' or np.any((a < 0) | (a >= n)):
            raise ValueError(f'invalid {split} indices')
    all_indices = np.concatenate([data[k] for k in ('train', 'validation', 'test')])
    if len(all_indices) != n or len(np.unique(all_indices)) != n:
        raise ValueError('splits must be disjoint and cover every row')
    if 'source_ids' in data:
        groups = [set(data['source_ids'][data[k]].tolist()) for k in ('train', 'validation', 'test')]
        if any(groups[i] & groups[j] for i in range(3) for j in range(i)):
            raise ValueError('source geometry leakage between splits')
    data['coordinates'] = c.astype(np.float32)
    return data


def load_received(raw):
    """Load all original designs, validating spectra and duplicate identities.

    Args:
        raw: Imported Treinar directory.

    Returns:
        Sorted unique designs, original IDs, parameters, spectra and source hashes.

    Raises:
        ValueError: Metadata, spectra or repeated designs are inconsistent.
    """
    raw = Path(raw)
    print('Loading and validating all twelve received families', flush=True)
    path = raw / 'geometrias_sorteadas.csv'
    rows = sorted(csv.DictReader(path.open(encoding='utf-8-sig')), key=lambda r: r['id'])
    files = {p.stem: p for p in (raw / 'Espectros_TRA').glob('*.csv')}
    if len({r['id'] for r in rows}) != len(rows) or set(files) != {r['id'] for r in rows}:
        raise ValueError('geometry IDs and spectra must match exactly')
    designs, identities, grid = [], {}, None
    hashes = {path.name: _digest(path)}
    for row in tqdm(rows, desc='Loading catalogue', unit='spectrum'):
        family = NAMES.index(row['familia'])
        values = np.array([float(row[k]) if row[k] else 0 for k in PARAMETERS])
        mask = MASK[family]
        if not np.isfinite(values).all() or np.any(values[mask == 1] <= 0) or np.any(values > SCALES) or np.any(values[mask == 0] != 0):
            raise ValueError('invalid active geometry parameters')
        if family in (5, 7, 9, 11) and row.get('trilhas') != '1':
            raise ValueError('family and track flag disagree')
        path = files[row['id']]
        hashes[path.name] = _digest(path)
        a = np.genfromtxt(path, delimiter=',', names=True)
        if a.dtype.names != ('lambda_nm', 'T', 'R', 'A') or a.ndim != 1 or len(a) < 2:
            raise ValueError('invalid received spectral schema')
        wavelength = a['lambda_nm']
        tra = np.column_stack([a[k] for k in ('T', 'R', 'A')])
        if not np.isfinite(tra).all() or np.any((tra < 0) | (tra > 1)) or np.max(abs(tra.sum(-1)-1)) > 2e-6:
            raise ValueError('invalid received spectrum')
        if not np.isfinite(wavelength).all() or wavelength[0] < 450 or wavelength[-1] > 1600 or np.any(np.diff(wavelength) <= 0):
            raise ValueError('invalid received grid')
        if grid is None:
            grid = wavelength
        if not np.array_equal(grid, wavelength):
            raise ValueError('inconsistent received grids')
        identity = (family, *values)
        if identity in identities:
            original = designs[identities[identity]]
            if not np.array_equal(original['tra'], tra):
                raise ValueError('duplicate design has conflicting spectra')
            original['ids'].append(row['id'])
        else:
            identities[identity] = len(designs)
            designs.append(dict(family=family, parameters=values, tra=tra, ids=[row['id']]))
    return dict(designs=designs, wavelengths=grid, source_hashes=hashes)


def stratified_split(labels, seed=42):
    """Partition rows by family into approximately 70/15/15 percent.

    Args:
        labels: One family label per unique geometry or request.
        seed: Reproducible shuffle seed.

    Returns:
        Disjoint train, validation and test index arrays, covering all rows.

    Raises:
        ValueError: A represented family has too few rows for three partitions.
    """
    rng = np.random.default_rng(seed)
    splits = {k: [] for k in ('train', 'validation', 'test')}
    for family in sorted(set(labels)):
        ids = np.flatnonzero(np.asarray(labels) == family)
        rng.shuffle(ids)
        if len(ids) < 7:
            raise ValueError('each represented family needs at least seven rows for stratification')
        n = len(ids)
        a, b = round(n * .7), round(n * .15)
        for key, part in zip(splits, (ids[:a], ids[a:a+b], ids[a+b:])):
            splits[key].extend(part.tolist())
    return {k: np.asarray(sorted(v), dtype=np.int64) for k, v in splits.items()}


def prepare_families(raw, output, mode, seed=42, bands_per_design=4):
    """Prepare the full received catalogue with an explicit inverse objective.

    Args:
        raw: Imported Treinar directory.
        output: New output directory.
        mode: 'flat_target' for split-local minimax flat-target labels.
        seed: Seed for geometry partitions and target request selection.
        bands_per_design: Request budget multiplier per unique design.

    Returns:
        Dataset preparation manifest.

    Raises:
        ValueError: The objective or band count is invalid.
        FileExistsError: Output already exists.
    """
    if mode != 'flat_target' or not 1 <= bands_per_design <= 100:
        raise ValueError('require explicit flat_target objective and positive band count')
    output = Path(output)
    if output.exists():
        raise FileExistsError('choose a new output directory')
    catalogue = load_received(raw)
    designs, grid = catalogue['designs'], catalogue['wavelengths']
    partitions = stratified_split([d['family'] for d in designs], seed)
    rng = np.random.default_rng(seed)
    x, labels, coordinates, source_ids = [], [], [], []
    splits = {key: [] for key in partitions}
    print('Selecting minimax labels within each held-out geometry partition', flush=True)
    seen_requests = set()
    for split, indices in partitions.items():
        spectra = np.stack([designs[i]['tra'][:, 2] for i in indices])
        for index in tqdm(indices, desc=f'Preparing {split}', unit='design'):
            design = designs[index]
            for _ in range(bands_per_design):
                while True:
                    a, b = sorted(rng.choice(len(grid), 2, replace=False).tolist())
                    target = float(rng.uniform(0, 1))
                    identity = (a, b, target)
                    if identity not in seen_requests:
                        seen_requests.add(identity)
                        break
                winner = select_flat(grid, spectra, a, b, target)
                design = designs[indices[winner]]
                splits[split].append(len(x))
                x.append([grid[a], grid[b], target])
                labels.append(design['family'])
                coordinates.append(design['parameters'] / SCALES)
                source_ids.append(design['ids'][0])
    arrays = dict(x=np.asarray(x), geometry=np.asarray(labels, dtype=np.int64),
                  substrate=np.zeros(len(x), dtype=np.int64), coordinates=np.asarray(coordinates, dtype=np.float32),
                  **{k: np.asarray(v, dtype=np.int64) for k, v in splits.items()})
    validate_arrays(arrays)
    output.mkdir(parents=True)
    print('Saving version-two arrays and geometry split provenance', flush=True)
    np.savez(output / 'dataset.npz', schema=np.array(2), source_ids=np.array(source_ids), **arrays)
    manifest = dict(schema=2, objective='split_local_flat_target_v2', seed=seed,
                    bands_per_design=bands_per_design, source_hashes=catalogue['source_hashes'],
                    dataset_sha256=_digest(output / 'dataset.npz'), raw_directory=str(Path(raw).resolve()),
                    parameter_names=PARAMETERS, parameter_scales_nm=SCALES.tolist(),
                    received_samples=sum(len(d['ids']) for d in designs), unique_designs=len(designs),
                    family_labels=NAMES,
                    splits={k: dict(design_count=len(v), request_count=len(splits[k]),
                                   families={name: sum(designs[i]['family'] == j for i in v) for j, name in enumerate(NAMES)},
                                   source_ids=[gid for i in v for gid in designs[i]['ids']],
                                   label_families={name: sum(labels[i] == j for i in splits[k]) for j, name in enumerate(NAMES)}) for k, v in partitions.items()})
    (output / 'preparation.json').write_text(json.dumps(manifest, indent=2))
    return manifest



def select_flat(grid, spectra, start, end, target):
    """Select the minimax design with average-error and row-order tie breaks.

    Args:
        grid: Common received wavelength grid.
        spectra: Absorption matrix ordered by canonical source ID.
        start: First grid index of the requested band.
        end: Last grid index, inclusive.
        target: Constant target absorption.

    Returns:
        Winning row index, matching the reference selector on sorted IDs.
    """
    error = np.abs(spectra[:, start:end+1] - target)
    worst = error.max(axis=1)
    average = np.trapz(error, grid[start:end+1], axis=1) / (grid[end] - grid[start])
    return int(np.lexsort((np.arange(len(spectra)), average, worst))[0])
