"""Load received spectra and group geometries before family-stratified splitting."""
import csv
import hashlib
from pathlib import Path
import numpy as np
from tqdm import tqdm
from .families import ACTIVE, MASK, NAMES, PARAMETERS, SCALES


def _digest(path):
    with Path(path).open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def load_received(raw, spectra='Espectros_TRA', geometry_csv=None, partial=False, duplicate_tolerance=0.):
    """Load all original designs, validating spectra and duplicate identities.

    Args:
        raw: Imported received-data directory.
        spectra: Spectrum folder name inside raw.
        geometry_csv: Geometry table, defaulting to raw/geometrias_sorteadas.csv.
        partial: Whether spectra may cover only a subset of the geometry IDs.
        duplicate_tolerance: Largest accepted T/R/A difference between duplicate
            geometries. The lowest source ID spectrum is kept.

    Returns:
        Sorted unique designs, original IDs, parameters, spectra, source hashes,
        duplicate conflicts and geometry IDs without spectra.

    Raises:
        ValueError: Metadata, spectra or repeated designs are inconsistent.
    """
    raw = Path(raw)
    print('Loading and validating all twelve received families', flush=True)
    path = Path(geometry_csv) if geometry_csv else raw / 'geometrias_sorteadas.csv'
    rows = sorted(csv.DictReader(path.open(encoding='utf-8-sig')), key=lambda r: r['id'])
    files = {p.stem: p for p in (raw / spectra).glob('*.csv')}
    ids = {r['id'] for r in rows}
    if len(ids) != len(rows) or not files or not set(files) <= ids or (not partial and set(files) != ids):
        raise ValueError('geometry IDs and spectra must match exactly')
    missing = sorted(ids-set(files))
    rows = [r for r in rows if r['id'] in files]
    conflicts = []
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
            difference = float(np.max(np.abs(original['tra']-tra)))
            if difference > duplicate_tolerance:
                raise ValueError('duplicate design has conflicting spectra')
            if difference > 0:
                known = next((c for c in conflicts if c['ids'][0] == original['ids'][0]), None)
                if known is None:
                    conflicts.append(dict(ids=list(original['ids'])+[row['id']], max_abs_difference=difference))
                else:
                    known['ids'].append(row['id'])
                    known['max_abs_difference'] = max(known['max_abs_difference'], difference)
            original['ids'].append(row['id'])
        else:
            identities[identity] = len(designs)
            designs.append(dict(family=family, parameters=values, tra=tra, ids=[row['id']]))
    return dict(designs=designs, wavelengths=grid, source_hashes=hashes, conflicts=conflicts, missing_ids=missing)


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
