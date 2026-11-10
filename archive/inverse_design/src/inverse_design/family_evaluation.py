"""Exact received-spectrum verification of family-expert predictions."""
import json
from pathlib import Path
import numpy as np
from tqdm import tqdm
from .core import dataset
from .families import ACTIVE, PARAMETERS, SCALES
from .family_data import load_received
from .preparation import _digest
from .training import load_model, predict
from .flatness import score_band


def evaluate_families(model_directory, data_path, raw_directory, output_path, device='cuda:0'):
    """Evaluate test requests without assigning spectra to unsimulated designs.

    Args:
        model_directory: Trusted checkpoint directory.
        data_path: Prepared version-two NPZ.
        raw_directory: Original imported Treinar directory.
        output_path: New JSON output file.
        device: Explicit inference device.

    Returns:
        Predictions and exact-match physical verification counts.

    Raises:
        ValueError: Dataset or original source hashes differ from preparation.
        FileExistsError: Output already exists.
    """
    data_path, output_path = Path(data_path), Path(output_path)
    if output_path.exists():
        raise FileExistsError(output_path)
    print('Validating full-catalogue evaluation provenance', flush=True)
    manifest = json.loads((data_path.parent / 'preparation.json').read_text())
    catalogue = load_received(raw_directory)
    if manifest['dataset_sha256'] != _digest(data_path) or manifest['source_hashes'] != catalogue['source_hashes']:
        raise ValueError('evaluation provenance does not match preparation')
    data = dataset(data_path)
    model = load_model(model_directory, device=device)
    requests = data['x'][data['test']]
    records = []
    print('Predicting held-out requests and checking exact catalogue matches', flush=True)
    for start in tqdm(range(0, len(requests), 256), desc='Evaluating', unit='batch'):
        for request, prediction in zip(requests[start:start+256], predict(model, requests[start:start+256])):
            record = dict(request=request.tolist(), prediction=prediction, status='requires_simulation', scores=None)
            family = int(prediction['family'][1:]) - 1
            values = prediction['parameters_nm']
            for design in catalogue['designs']:
                if family == design['family'] and all(values[PARAMETERS[j]] == design['parameters'][j] for j in ACTIVE[family]) and prediction['substrate'] == 'air':
                    record.update(status='verified_catalogue', source_id=design['ids'][0],
                                  scores=score_band(catalogue['wavelengths'], design['tra'][:, 2], request))
                    break
            records.append(record)
    verified = sum(r['status'] == 'verified_catalogue' for r in records)
    result = dict(summary=dict(verified_count=verified, unverified_count=len(records)-verified), records=records)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(result, indent=2))
    return result
