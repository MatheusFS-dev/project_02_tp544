"""Flat baseline validation request and objective regression checks."""
import importlib.util
from pathlib import Path
import numpy as np


def load_validation():
    path = Path(__file__).resolve().parents[1]/'src/validation/flat/baseline/baseline_results.py'
    spec = importlib.util.spec_from_file_location('flat_baseline_validation',path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_flat_validation_preserves_previous_baseline_target_requests():
    module=load_validation()
    cases=module.selected_requests()
    assert len(cases)==5
    assert len({row['case'] for row in cases})==5
    import json
    original=json.loads((module.ROOT/'src/validation/inverse_design/baseline/predictions.json').read_text())
    assert np.array_equal([row['request'] for row in cases],[row['request'] for row in original['cases']])
