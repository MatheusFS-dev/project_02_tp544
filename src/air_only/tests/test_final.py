"""Final workflow split, geometry and text-output regression checks."""
import importlib.util
from pathlib import Path
import numpy as np
import pytest


def module(name):
    path = Path(__file__).resolve().parents[1]/f'final/{name}.py'
    spec = importlib.util.spec_from_file_location(f'final_{name}', path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def test_split_covers_every_geometry_without_a_test_partition():
    workflow = module('workflow')
    families = np.repeat(np.arange(12), 20)
    parts = workflow.split_80_20(families, 42)
    assert len(parts['train']) == 192
    assert len(parts['validation']) == 48
    assert len(parts['test']) == 0
    assert not set(parts['train']) & set(parts['validation'])
    assert np.array_equal(np.sort(np.r_[parts['train'], parts['validation']]), np.arange(240))
    for family in range(12):
        assert (families[parts['train']] == family).sum() == 16
        assert (families[parts['validation']] == family).sum() == 4
    assert np.array_equal(parts['train'], workflow.split_80_20(families, 42)['train'])


def test_geometry_rejects_other_substrates_and_invalid_holes():
    workflow = module('workflow')
    geometry = dict(family='F03', substrate='air', tracks=False,
                    parameters_nm=dict(Lout_q=None, w_q=None, Rout_c=80., w_c=12., R_d=None, L_s=None, w_t=None))
    workflow.validate_geometry(geometry)
    with pytest.raises(ValueError, match='substrate'):
        workflow.validate_geometry(dict(geometry, substrate='SiO2'))
    geometry['parameters_nm']['w_c'] = 80.
    with pytest.raises(ValueError, match='hole'):
        workflow.validate_geometry(geometry)


def test_plain_text_contains_only_applicable_dimensions_and_units():
    workflow = module('workflow')
    geometry = dict(family='F01', substrate='air', tracks=False,
                    parameters_nm=dict(Lout_q=None, w_q=None, Rout_c=None, w_c=None, R_d=40.125, L_s=None, w_t=None))
    text = workflow.geometry_text(geometry)
    assert 'F01' in text and 'air' in text and '40.125 nm' in text
    assert 'Rout_c' not in text


def test_actual_spectrum_scoring_interpolates_band_endpoints(monkeypatch):
    monkeypatch.syspath_prepend(str(Path(__file__).resolve().parents[1]/'final'))
    runner = module('hfss')
    wavelengths = np.array([500., 600., 700., 800.])
    absorption = wavelengths/1000
    scores = runner.score_actual(wavelengths, absorption, [600.1, 700.2, .65])
    assert scores['worst_error_pp'] == pytest.approx(5.02)
    assert scores['mean_error_pp'] > 0
    with pytest.raises(ValueError):
        runner.score_actual(wavelengths, absorption, [490., 700., .65])
