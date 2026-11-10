"""Explicitly prepare flat-target labels from received CSV files."""
from pathlib import Path
from inverse_design.preparation import prepare_dataset


if __name__ == '__main__':
    geometry = Path(input('Geometry CSV (IDs, types and dimensions): ').strip()).expanduser()
    spectra = Path(input('HFSS CSV (received wavelength-by-wavelength absorption): ').strip()).expanduser()
    requests = Path(input('Requests CSV (band start/end, target absorption and split): ').strip()).expanduser()
    output = Path(input('Output directory (use a new destination for this dataset): ').strip()).expanduser()
    results = prepare_dataset(geometry, spectra, requests, output)
    print(f"Prepared training data: {results['data']}", flush=True)
