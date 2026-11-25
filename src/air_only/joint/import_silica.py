"""Import the received Case B (gold on SiO2) delivery into data/raw/silica."""
import csv
import json
import hashlib
from pathlib import Path
import shutil
import sys
from collections import Counter
from tqdm import tqdm
from air_only.shared import storage
from air_only.shared.catalogue import load_received

ROOT = Path(__file__).resolve().parents[1]
SPECTRA = 'Espectros_TRA_B'
NEW_FILES = ('resultados_B.csv', 'HFSS_Base_Dados.py')
DUPLICATE_TOLERANCE = 1e-3


def _sha256(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def _copy(source, target, dry_run):
    """Copy one file unless an identical copy exists; refuse differing content."""
    if target.exists():
        if _sha256(target) != _sha256(source):
            raise ValueError(f'Existing {target} differs from the delivery, preserve it and inspect manually')
        return
    if not dry_run:
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)


def import_silica(source, target, treinar, dry_run=False):
    """Copy new Case B files, verify duplicates of air files and write an audit.

    Args:
        source: Received Case B delivery folder.
        target: Destination raw silica folder.
        treinar: Imported air raw folder, used for identical-file checks and geometry IDs.
        dry_run: Report what would be copied without writing anything.

    Returns:
        Import manifest with copied files, hashes and identical air files.

    Raises:
        ValueError: An unknown file, a non-identical shared file or a differing existing copy.
    """
    source, target, treinar = Path(source), Path(target), Path(treinar)
    print(f'Inspecting Case B delivery: {source}', flush=True)
    spectra = sorted((source/SPECTRA).glob('*.csv'))
    if not spectra:
        raise ValueError(f'No spectra found in {source/SPECTRA}')
    identical = {}
    for path in sorted(p for p in source.iterdir() if p.is_file() and p.name not in NEW_FILES):
        reference = treinar/path.name
        if not reference.is_file() or _sha256(reference) != _sha256(path):
            raise ValueError(f'{path.name} is neither a known Case B file nor identical to the air delivery')
        identical[path.name] = _sha256(path)
    files = [source/name for name in NEW_FILES]+spectra
    for path in files:
        if not path.is_file():
            raise ValueError(f'Missing Case B file {path}')
    entries = []
    for path in tqdm(files, desc='Copying Case B files', unit='file'):
        relative = path.relative_to(source)
        _copy(path, target/relative, dry_run)
        entries.append(dict(path=str(relative), bytes=path.stat().st_size, sha256=_sha256(path)))
    manifest = dict(source=str(source), substrate='silica', material='SiO2, n = 1.45 (permittivity 2.1025), 1 um',
                    files=entries, identical_to_treinar=identical)
    if dry_run:
        print(f'Dry run: {len(entries)} files would be imported into {target}', flush=True)
        return manifest
    print('Validating imported silica spectra', flush=True)
    catalogue = load_received(target, SPECTRA, treinar/'geometrias_sorteadas.csv', True, DUPLICATE_TOLERANCE)
    available = {p.stem for p in spectra}
    with (source/'resultados_B.csv').open(encoding='utf-8-sig') as stream:
        excluded = [row['geometria'] for row in csv.DictReader(stream) if row['geometria'] not in available]
    families = Counter(design['family'] for design in catalogue['designs'])
    audit = dict(received_spectra=sum(len(d['ids']) for d in catalogue['designs']),
                 unique_geometries=len(catalogue['designs']), missing_ids=catalogue['missing_ids'],
                 conflicts=catalogue['conflicts'], duplicate_tolerance=DUPLICATE_TOLERANCE,
                 duplicate_rule='lowest source ID spectrum kept', excluded_result_rows=excluded,
                 family_counts={f'F{family+1:02d}': count for family, count in sorted(families.items())})
    for name, value, content in (('import_manifest.json', manifest, lambda v: {k: v[k] for k in v if k != 'source'}),
                                 ('audit.json', audit, lambda v: v)):
        path = target/name
        if path.exists():
            if storage.digest(content(json.loads(path.read_text()))) != storage.digest(content(value)):
                raise ValueError(f'Existing {path} differs, preserve it and inspect manually')
        else:
            storage.save_json(path, value)
    print(f'Imported {audit["received_spectra"]} silica spectra ({audit["unique_geometries"]} unique geometries), '
          f'{len(audit["missing_ids"])} geometry IDs without spectra, {len(audit["conflicts"])} small duplicate conflicts, '
          f'{len(excluded)} result rows without spectra.', flush=True)
    return manifest


def main():
    """Ask for the delivery folder and import it into data/raw/silica."""
    default = Path.home()/'Downloads/Dataset_CasoB'
    answer = input(f'Case B delivery folder (Enter for {default}): ').strip()
    import_silica(Path(answer).expanduser() if answer else default, ROOT/'data/raw/silica', ROOT/'data/raw/treinar',
                  dry_run='--dry-run' in sys.argv)


if __name__ == '__main__':
    main()
