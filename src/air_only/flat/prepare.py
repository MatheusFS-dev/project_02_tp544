"""Prepare every received geometry and spectrum for forward learning."""
from air_only.flat.common import load_config, logging, load_data
import hashlib
import io
from pathlib import Path
import numpy as np
from air_only.shared.catalogue import load_received, stratified_split
from air_only.shared.families import SCALES, NAMES
from air_only.shared import storage


def prepare(config):
    """Group duplicates, stratify unique geometries and retain full provenance.

    Args:
        config: Settings identifying the original raw files and output NPZ.

    Returns:
        Manifest describing every source and the geometry-held-out partitions.
    """
    with storage.ownership(Path(config.data).parent):
        catalogue = load_received(config.raw)
        designs = catalogue['designs']
        families = np.array([row['family'] for row in designs], dtype=np.int64)
        splits = stratified_split(families, config.seed)
        path = Path(config.data)
        if path.exists():
            _, old = load_data(path)
            if old['source_hashes'] != catalogue['source_hashes'] or old['seed'] != config.seed:
                raise ValueError('prepared data sources or split seed changed, choose a new data path')
            print('Verified existing complete flat-spectrum dataset', flush=True)
            return old
        print('Saving complete spectra and unique-geometry 70/15/15 split', flush=True)
        arrays = dict(family=families, parameters=np.array([row['parameters']/SCALES for row in designs], dtype=np.float32),
                      tra=np.stack([row['tra'] for row in designs]).astype(np.float32),
                      wavelengths=catalogue['wavelengths'],
                      source_ids=np.array([row['ids'][0] for row in designs]), **splits)
        buffer = io.BytesIO()
        np.savez_compressed(buffer, **arrays)
        content = buffer.getvalue()
        metadata = dict(schema='flat-spectrum-v1', seed=config.seed, dataset_sha256=hashlib.sha256(content).hexdigest(),
                        source_hashes=catalogue['source_hashes'],
                        unique_designs=len(designs), received_spectra=sum(len(row['ids']) for row in designs),
                        duplicate_sources={row['ids'][0]: row['ids'] for row in designs},
                        splits={key: dict(designs=len(value), source_ids=[gid for i in value for gid in designs[i]['ids']],
                                          family_counts={name: int((families[value] == i).sum()) for i, name in enumerate(NAMES)})
                                for key, value in splits.items()})
        storage.atomic(path, content)
        storage.save_json(path.with_suffix('.json'), metadata)
        print(f'Saved {metadata["received_spectra"]} source spectra as {len(designs)} unique geometries: {path}', flush=True)
        return metadata


def main():
    """Prepare the complete dataset using flat_prepare.toml."""
    config = load_config('prepare')
    with logging(config, 'prepare'):
        prepare(config)


if __name__ == '__main__':
    main()
