"""Evaluate an existing model against exact received catalogue spectra."""
from pathlib import Path
from inverse_design.physical_evaluation import evaluate_model


if __name__ == '__main__':
    model = Path(input('Model directory (baseline or search winner containing best.ckpt): ').strip()).expanduser()
    data = Path(input('Prepared dataset.npz (with selection.json and preparation.json beside it): ').strip()).expanduser()
    from inverse_design.core import dataset
    if dataset(data)['coordinates'].shape[1] == 7:
        from inverse_design.family_evaluation import evaluate_families
        raw = Path(input('Original Treinar directory (all received files): ').strip()).expanduser()
        output = Path(input('New output JSON path: ').strip()).expanduser()
        print(evaluate_families(model, data, raw, output)['summary'])
        raise SystemExit(0)
    geometry = Path(input('Original geometry CSV (must match preparation): ').strip()).expanduser()
    spectra = Path(input('Original HFSS CSV (must match preparation): ').strip()).expanduser()
    output = Path(input('Output JSON path (must not already exist): ').strip()).expanduser()
    result = evaluate_model(model, data, geometry, spectra, output)
    print(f"Physical evaluation: {result['summary']}", flush=True)
