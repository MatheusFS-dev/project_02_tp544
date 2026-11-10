"""Checks for the fixed final HFSS comparison experiment."""
import importlib.util
from pathlib import Path

import numpy as np
import pytest


def runner():
    path = Path(__file__).resolve().parents[1]/'validation/final/run_validation.py'
    assert path.exists(), 'Final comparison runner is missing'
    spec = importlib.util.spec_from_file_location('final_validation', path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def test_physical_identity_ignores_model_but_preserves_dimensions_and_request():
    experiment = runner()
    geometry = dict(family='F01', substrate='air', tracks=False,
                    parameters_nm=dict(Lout_q=None, w_q=None, Rout_c=None, w_c=None,
                                       R_d=40., L_s=None, w_t=None),
                    request=[500., 510., .4], case='baseline', checkpoint_sha256='a')
    physical = experiment.physical_geometry(geometry)
    assert physical == experiment.physical_geometry(dict(geometry, case='ray', checkpoint_sha256='b'))
    changed = dict(geometry, parameters_nm=dict(geometry['parameters_nm'], R_d=41.))
    assert physical != experiment.physical_geometry(changed)
    assert physical != experiment.physical_geometry(dict(geometry, request=[500., 520., .4]))


def test_actual_metrics_validate_passivity_and_interpolate_target_endpoints():
    experiment = runner()
    spectrum = np.array([(500., .4, .3, .3), (510., .3, .3, .4), (520., .2, .3, .5)],
                        dtype=[(key, float) for key in ('lambda_nm', 'T', 'R', 'A')])
    result = experiment.spectrum_metrics(spectrum, [502., 518., .4])
    assert result['worst_error_pp'] == pytest.approx(8.)
    assert result['mean_error_pp'] == pytest.approx(4.)
    assert result['band_min_absorption_percent'] == pytest.approx(32.)
    assert result['band_max_absorption_percent'] == pytest.approx(48.)
    spectrum['T'][0] = -1
    with pytest.raises(ValueError, match='spectrum'):
        experiment.spectrum_metrics(spectrum, [502., 518., .4])
