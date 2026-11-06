"""Explicit conversion of received spectra into flat-target design labels."""
import csv
import hashlib
import json
from pathlib import Path
import numpy as np
from tqdm import tqdm
from .core import normalize
from .flatness import select_design

GEOMETRY_LABELS = {'circular_disk': 0, 'square': 1, 'circular_ring': 2, 'square_ring': 3}
SUBSTRATE_LABELS = {'air': 0, 'SiO2': 1}
OBJECTIVE_VERSION = 'flat_target_v1'


def _read_rows(path, required):
    with Path(path).open(newline='', encoding='utf-8-sig') as stream:
        reader = csv.DictReader(stream)
        if not required.issubset(reader.fieldnames or []):
            raise ValueError(f'{path}: require columns {sorted(required)}')
        rows = list(reader)
    if not rows or any(None in row or any(value is None for value in row.values()) for row in rows):
        raise ValueError(f'{path}: empty or malformed CSV')
    return rows


def _number(row, key):
    try:
        value = float(row[key])
    except (ValueError, TypeError) as exc:
        raise ValueError(f'{key}: require a received numeric value, not a blank') from exc
    if not np.isfinite(value):
        raise ValueError(f'{key}: require a finite value')
    return value


def _digest(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def load_catalogue(geometry_path: Path, spectra_path: Path) -> dict:
    """Validate and join received geometry and absorption CSVs.

    Args:
        geometry_path: CSV with geometry IDs, types and outer/inner dimensions.
        spectra_path: HFSS CSV with simulation IDs, substrate and sampled A.

    Returns:
        Shared wavelengths, spectra and design metadata keyed by simulation ID.
        Original T/R fields are retained in received_rows without modification.

    Raises:
        ValueError: Schema, values, identifiers or spectral coverage are invalid.
        FileNotFoundError: An input file does not exist.
    """
    geometries = {}
    for row in _read_rows(geometry_path, {'geometry_id', 'geometry_type', 'outer_dimension_nm', 'inner_dimension_nm'}):
        gid = row['geometry_id']
        if not gid or gid in geometries or row['geometry_type'] not in GEOMETRY_LABELS:
            raise ValueError('invalid or duplicate geometry ID/type')
        g = GEOMETRY_LABELS[row['geometry_type']]
        outer, inner = (_number(row, key) for key in ('outer_dimension_nm', 'inner_dimension_nm'))
        if not 0 <= inner <= outer <= 320 or (g < 2 and inner != 0):
            raise ValueError('require 0 <= inner <= outer <= 320 and zero inner size for solids')
        geometries[gid] = dict(geometry=g, outer_nm=outer, inner_nm=inner)
    designs, samples = {}, {}
    rows = _read_rows(spectra_path, {'simulation_id', 'geometry_id', 'substrate', 'wavelength_nm', 'T', 'R', 'A'})
    for row in rows:
        sid, gid = row['simulation_id'], row['geometry_id']
        if not sid or gid not in geometries or row['substrate'] not in SUBSTRATE_LABELS:
            raise ValueError('unknown geometry/substrate or empty simulation ID')
        design = dict(geometry_id=gid, substrate=SUBSTRATE_LABELS[row['substrate']], **geometries[gid])
        if sid in designs and designs[sid] != design:
            raise ValueError('inconsistent design for simulation ID')
        designs[sid] = design
        wavelength, absorption = _number(row, 'wavelength_nm'), _number(row, 'A')
        if not 450 <= wavelength <= 1600 or not 0 <= absorption <= 1:
            raise ValueError('received wavelength or absorption outside physical bounds')
        sample = samples.setdefault(sid, {})
        if wavelength in sample:
            raise ValueError('duplicate simulation/wavelength row')
        sample[wavelength] = absorption
    grid = np.array(sorted(samples[min(samples)]), dtype=np.float64)
    if len(grid) < 2:
        raise ValueError('require at least two wavelengths')
    seen, spectra = set(), {}
    for sid in sorted(samples):
        if sorted(samples[sid]) != grid.tolist():
            raise ValueError('require complete shared wavelength grids for all simulations')
        design = designs[sid]
        identity = tuple(design[key] for key in ('geometry', 'substrate', 'outer_nm', 'inner_nm'))
        if identity in seen:
            raise ValueError('duplicate physical design')
        seen.add(identity)
        spectra[sid] = np.array([samples[sid][value] for value in grid], dtype=np.float64)
    return dict(wavelengths=grid, spectra=spectra, designs=designs, received_rows=rows)


def prepare_dataset(geometry_path: Path, spectra_path: Path, requests_path: Path, output_directory: Path) -> dict:
    """Write best-match NPZ labels and auditable scores from received CSVs.

    Args:
        geometry_path: Received geometry CSV path.
        spectra_path: Received HFSS CSV path.
        requests_path: CSV with band_start_nm, band_end_nm, target_absorption, split.
        output_directory: Destination directory without existing preparation files.

    Returns:
        Paths keyed by data, selection and manifest.

    Raises:
        ValueError: Any input or request is invalid.
        FileExistsError: A destination artifact already exists.
    """
    output_directory = Path(output_directory)
    paths = dict(data=output_directory / 'dataset.npz', selection=output_directory / 'selection.json',
                 manifest=output_directory / 'preparation.json')
    if any(path.exists() for path in paths.values()):
        raise FileExistsError('preparation artifacts already exist, choose a new output directory')
    print('Validating received catalogue and requests', flush=True)
    catalogue = load_catalogue(geometry_path, spectra_path)
    rows = _read_rows(requests_path, {'band_start_nm', 'band_end_nm', 'target_absorption', 'split'})
    requests, seen = [], set()
    splits = {name: [] for name in ('train', 'validation', 'test')}
    for i, row in enumerate(rows):
        values = [_number(row, key) for key in ('band_start_nm', 'band_end_nm', 'target_absorption')]
        normalize([values])
        if tuple(values) in seen or row['split'] not in splits:
            raise ValueError('duplicate request or unknown split')
        seen.add(tuple(values))
        requests.append(values)
        splits[row['split']].append(i)
    if any(not indices for indices in splits.values()):
        raise ValueError('train, validation and test splits must be nonempty')
    records, labels, substrates, coordinates = [], [], [], []
    print('Scoring catalogue designs for each request', flush=True)
    for i, values in enumerate(tqdm(requests, desc='Selecting labels', unit='request')):
        winner, scores = select_design(catalogue['wavelengths'], catalogue['spectra'], values)
        design = catalogue['designs'][winner]
        labels.append(design['geometry'])
        substrates.append(design['substrate'])
        outer, inner = design['outer_nm'], design['inner_nm']
        coordinates.append([outer / 320, inner / outer if outer else 0])
        records.append(dict(request_id=i, request=values, split=rows[i]['split'], winner=winner, alternatives=scores))
    arrays = dict(x=np.asarray(requests, dtype=np.float64), geometry=np.asarray(labels, dtype=np.int64),
                  substrate=np.asarray(substrates, dtype=np.int64), coordinates=np.asarray(coordinates, dtype=np.float32),
                  **{key: np.asarray(indices, dtype=np.int64) for key, indices in splits.items()})
    source_hashes = {key: _digest(path) for key, path in
                     [('geometry', geometry_path), ('spectra', spectra_path), ('requests', requests_path)]}
    print('Saving training labels and selection provenance', flush=True)
    output_directory.mkdir(parents=True, exist_ok=True)
    with paths['data'].open('xb') as stream:
        np.savez(stream, **arrays)
    with paths['selection'].open('x') as stream:
        json.dump(records, stream, indent=2, allow_nan=False)
    manifest = dict(objective_version=OBJECTIVE_VERSION, source_hashes=source_hashes,
                    output_hashes={key: _digest(paths[key]) for key in ('data', 'selection')},
                    geometry_labels=GEOMETRY_LABELS, substrate_labels=SUBSTRATE_LABELS,
                    selection_order=['worst_error', 'average_error', 'simulation_id'],
                    average_rule='trapezoidal absolute sample error divided by band width')
    with paths['manifest'].open('x') as stream:
        json.dump(manifest, stream, indent=2, allow_nan=False)
    return paths


def validate_preparation(data_path: Path, geometry_path: Path, spectra_path: Path) -> dict:
    """Check prepared dataset provenance before physical evaluation.

    Args:
        data_path: Prepared dataset.npz alongside selection.json and preparation.json.
        geometry_path: Received geometry CSV used for evaluation.
        spectra_path: Received HFSS CSV used for evaluation.

    Returns:
        Validated preparation manifest.

    Raises:
        ValueError: Objective version or an input/output hash differs.
        FileNotFoundError: A required preparation artifact does not exist.
    """
    data_path = Path(data_path)
    manifest = json.loads((data_path.parent / 'preparation.json').read_text())
    if manifest.get('objective_version') != OBJECTIVE_VERSION:
        raise ValueError('unsupported preparation objective version')
    for key, path in [('geometry', geometry_path), ('spectra', spectra_path)]:
        if _digest(path) != manifest['source_hashes'][key]:
            raise ValueError(f'{key} source hash does not match preparation')
    for key, path in [('data', data_path), ('selection', data_path.parent / 'selection.json')]:
        if _digest(path) != manifest['output_hashes'][key]:
            raise ValueError(f'{key} output hash does not match preparation')
    return manifest
