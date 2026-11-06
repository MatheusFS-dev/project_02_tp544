"""Evaluate flat-target predictions only when their spectra are available."""
import json
from pathlib import Path
import numpy as np
from tqdm import tqdm
from .core import GEOMETRIES, SUBSTRATES, dataset, normalize
from .flatness import score_band, select_design
from .preparation import load_catalogue, validate_preparation
from .training import load_model, predict


def evaluate_predictions(predictions: list, requests: np.ndarray, catalogue: dict) -> list:
    """Score exact catalogue matches and identify designs requiring simulation.

    Args:
        predictions: Design dictionaries returned by training.predict.
        requests: Physical band start/end and target level for each prediction.
        catalogue: Validated dictionary returned by preparation.load_catalogue.

    Returns:
        Per-request records with verification status and nullable physical scores.

    Raises:
        ValueError: Request count differs or request values are invalid.
    """
    requests = np.asarray(requests, dtype=np.float64)
    normalize(requests)
    if len(predictions) != len(requests):
        raise ValueError('prediction and request counts must agree')
    records = []
    for prediction, request in tqdm(zip(predictions, requests), total=len(requests), desc='Physical evaluation', unit='request'):
        _, alternatives = select_design(catalogue['wavelengths'], catalogue['spectra'], request)
        record = dict(request=request.tolist(), prediction=prediction, status='requires_simulation',
                      simulation_id=None, worst_error=None, average_error=None, ripple=None, excess_worst_error=None)
        for sid, design in catalogue['designs'].items():
            if (prediction['geometry'] == GEOMETRIES[design['geometry']]
                    and prediction['substrate'] == SUBSTRATES[design['substrate']]
                    and prediction['outer_nm'] == design['outer_nm']
                    and prediction['inner_nm'] == design['inner_nm']):
                scores = score_band(catalogue['wavelengths'], catalogue['spectra'][sid], request)
                record.update(status='verified_catalogue', simulation_id=sid, **scores,
                              excess_worst_error=scores['worst_error'] - alternatives[0]['worst_error'])
                break
        records.append(record)
    return records


def summarize_evaluation(records: list) -> dict:
    """Summarize verified errors without assigning scores to unverified designs.

    Args:
        records: Per-request records from evaluate_predictions.

    Returns:
        Verification counts and nullable aggregate errors over verified designs.
    """
    verified = [record for record in records if record['status'] == 'verified_catalogue']
    summary = dict(verified_count=len(verified), unverified_count=len(records) - len(verified))
    for key in ('worst_error', 'average_error', 'ripple'):
        summary[f'mean_{key}'] = float(np.mean([row[key] for row in verified])) if verified else None
    summary['max_worst_error'] = max((row['worst_error'] for row in verified), default=None)
    return summary


def evaluate_model(model_directory: Path, data_path: Path, geometry_path: Path,
                   spectra_path: Path, output_path: Path, device: str = 'cuda:0') -> dict:
    """Predict held-out requests and export provenance-checked physical results.

    Args:
        model_directory: Existing baseline or winner directory with best.ckpt.
        data_path: Prepared NPZ beside its selection and preparation JSON files.
        geometry_path: Original received geometry CSV.
        spectra_path: Original received HFSS CSV.
        output_path: New JSON destination that must not already exist.
        device: Inference device, default GPU 0. CPU is explicit for tests.

    Returns:
        Summary and per-request physical evaluation records.

    Raises:
        FileExistsError: Destination already exists.
        ValueError: Prepared dataset provenance or values are invalid.
    """
    output_path = Path(output_path)
    if output_path.exists():
        raise FileExistsError('evaluation output already exists')
    print('Validating dataset and received catalogue provenance', flush=True)
    manifest = validate_preparation(data_path, geometry_path, spectra_path)
    catalogue = load_catalogue(geometry_path, spectra_path)
    data = dataset(data_path)
    requests = data['x'][data['test']]
    print('Loading best model and predicting test requests', flush=True)
    model = load_model(model_directory, device=device)
    predictions = []
    for start in tqdm(range(0, len(requests), 256), desc='Inference', unit='batch'):
        predictions.extend(predict(model, requests[start:start + 256]))
    print('Comparing predicted designs with received spectra', flush=True)
    records = evaluate_predictions(predictions, requests, catalogue)
    result = dict(objective_version=manifest['objective_version'],
                  data_hash=manifest['output_hashes']['data'],
                  model_directory=str(Path(model_directory).resolve()),
                  summary=summarize_evaluation(records), records=records)
    print('Saving physical evaluation results', flush=True)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open('x') as stream:
        json.dump(result, stream, indent=2, allow_nan=False)
    return result
