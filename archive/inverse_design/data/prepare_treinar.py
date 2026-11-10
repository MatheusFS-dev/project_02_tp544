"""Prepare all received families using split-local flat-target labels."""
from pathlib import Path
from inverse_design.family_data import prepare_families

if __name__ == '__main__':
    raw = Path(input('Imported Treinar directory (original geometry CSV and spectra): ').strip()).expanduser()
    output = Path(input('New output directory (NPZ and split provenance): ').strip()).expanduser()
    prepare_families(raw, output, mode='flat_target')
    print(f'Full-family dataset prepared: {output / "dataset.npz"}', flush=True)
