"""Focused validation selection and source safety checks."""
import importlib.util
from pathlib import Path
import numpy as np


def load_validation():
    spec = importlib.util.spec_from_file_location('baseline_validation', Path(__file__).resolve().parents[1] / 'src/validation/baseline/baseline_results.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_selection_is_deterministic_and_diverse():
    module = load_validation()
    predictions = [{'family': f'F{i % 6 + 1:02d}'} for i in range(36)]
    first = module.select_cases(predictions)
    assert first == module.select_cases(predictions)
    assert len(first) == 5
    assert len({predictions[i]['family'] for i in first}) == 5


def test_original_builder_loading_has_no_batch_side_effects():
    module = load_validation()
    builder = module.load_builder(Path(__file__).resolve().parents[1] / 'data/raw/treinar/HFSS_Base_Dados.py')
    assert callable(builder['construir'])
    assert builder['CASO'] == 'A'
    assert builder['C0'] == 299792458.0
    assert builder['EPS0'] == 8.8541878128e-12
    assert builder['N_PONTOS'] == 401
    assert 'lista' not in builder
