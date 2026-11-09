"""Convert the received air-only Treinar catalogue without changing spectra."""
import csv
import json
from pathlib import Path
import numpy as np
from tqdm import tqdm
from .preparation import _digest, load_catalogue


FAMILIES = {'F01': 'circular_disk', 'F02': 'square', 'F03': 'circular_ring', 'F04': 'square_ring'}


def convert_catalogue(raw_directory: Path, output_directory: Path) -> dict:
    """Convert compatible received families and audit every spectral file.

    Circular sizes are converted from radii to diameters. Repeated physical
    designs are collapsed only when their complete T/R/A spectra are identical.
    Substrate is air, as specified by CASO A in the received HFSS generator.

    Args:
        raw_directory: Imported Treinar directory with geometry CSV and spectra.
        output_directory: New directory for converted CSVs and conversion audit.

    Returns:
        Audit containing hashes, family coverage, exclusions and duplicate IDs.

    Raises:
        ValueError: IDs, dimensions, grids, energy balance or spectra are invalid.
        FileExistsError: Output directory already exists.
        FileNotFoundError: An expected received file is missing.
    """
    raw_directory, output_directory = Path(raw_directory), Path(output_directory)
    if output_directory.exists():
        raise FileExistsError('choose a new conversion output directory')
    print('Loading received geometry metadata', flush=True)
    geometry_path = raw_directory / 'geometrias_sorteadas.csv'
    with geometry_path.open(encoding='utf-8-sig', newline='') as stream:
        rows = list(csv.DictReader(stream))
    ids = [row['id'] for row in rows]
    if not rows or len(set(ids)) != len(ids) or any(not gid for gid in ids):
        raise ValueError('empty or duplicate received geometry IDs')
    files = {p.stem: p for p in (raw_directory / 'Espectros_TRA').glob('*.csv')}
    if set(ids) != set(files):
        raise ValueError('geometry IDs and received spectra must match exactly')
    grid, unique, geometries, spectral_rows = None, {}, [], []
    audit = dict(source_hashes={'geometry': _digest(geometry_path)}, family_counts={},
                 excluded_ids=[], duplicate_ids={}, substrate='air',
                 substrate_evidence='received HFSS_Base_Dados.py: CASO = A',
                 size_convention='outer and inner diameters for circular families, side lengths for square families')
    print('Validating spectra and converting the four compatible families', flush=True)
    for row in tqdm(sorted(rows, key=lambda r: r['id']), desc='Converting', unit='spectrum'):
        gid, family = row['id'], row['familia']
        path = files[gid]
        audit['source_hashes'][gid] = _digest(path)
        audit['family_counts'][family] = audit['family_counts'].get(family, 0) + 1
        values = np.genfromtxt(path, delimiter=',', names=True, encoding='utf-8-sig')
        if values.dtype.names != ('lambda_nm', 'T', 'R', 'A') or values.ndim != 1 or len(values) < 2:
            raise ValueError(f'{gid}: invalid spectral schema')
        wavelength = values['lambda_nm']
        tra = np.column_stack([values[k] for k in ('T', 'R', 'A')])
        if (not np.isfinite(wavelength).all() or np.any(np.diff(wavelength) <= 0)
                or wavelength[0] < 450 or wavelength[-1] > 1600
                or not np.isfinite(tra).all() or np.any((tra < 0) | (tra > 1))
                or np.max(np.abs(tra.sum(axis=1) - 1)) > 2e-6):
            raise ValueError(f'{gid}: invalid physical spectral values')
        if grid is None:
            grid = wavelength
        elif not np.array_equal(grid, wavelength):
            raise ValueError(f'{gid}: inconsistent received wavelength grid')
        if family not in FAMILIES:
            audit['excluded_ids'].append(gid)
            continue
        if family == 'F01':
            outer, inner = 2 * float(row['R_d']), 0.0
        elif family == 'F02':
            outer, inner = float(row['L_s']), 0.0
        elif family == 'F03':
            outer = 2 * float(row['Rout_c'])
            inner = outer - 2 * float(row['w_c'])
        else:
            outer = float(row['Lout_q'])
            inner = outer - 2 * float(row['w_q'])
        if not np.isfinite([outer, inner]).all() or not 0 <= inner <= outer <= 320:
            raise ValueError(f'{gid}: invalid received dimensions')
        identity = (family, outer, inner)
        if identity in unique:
            original_id, original_tra = unique[identity]
            if not np.array_equal(tra, original_tra):
                raise ValueError(f'{gid}: duplicate design has conflicting spectra')
            audit['duplicate_ids'][gid] = original_id
            continue
        unique[identity] = (gid, tra)
        geometries.append([gid, FAMILIES[family], outer, inner])
        spectral_rows.extend([gid, gid, 'air', float(w), *map(float, values)] for w, values in zip(grid, tra))
    if not geometries:
        raise ValueError('no compatible received designs')
    audit.update(received_spectra=len(rows), compatible_samples=len(rows) - len(audit['excluded_ids']),
                 unique_compatible_designs=len(geometries), wavelength_count=len(grid),
                 wavelength_range_nm=[float(grid[0]), float(grid[-1])])
    print('Saving converted catalogue and source provenance', flush=True)
    output_directory.mkdir(parents=True)
    for name, header, records in [
        ('geometries.csv', ['geometry_id', 'geometry_type', 'outer_dimension_nm', 'inner_dimension_nm'], geometries),
        ('spectra.csv', ['simulation_id', 'geometry_id', 'substrate', 'wavelength_nm', 'T', 'R', 'A'], spectral_rows),
    ]:
        with (output_directory / name).open('x', newline='') as stream:
            writer = csv.writer(stream)
            writer.writerow(header)
            writer.writerows(records)
        audit.setdefault('output_hashes', {})[name] = _digest(output_directory / name)
    load_catalogue(output_directory / 'geometries.csv', output_directory / 'spectra.csv')
    (output_directory / 'conversion.json').write_text(json.dumps(audit, indent=2, allow_nan=False))
    return audit
