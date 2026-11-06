"""Physical scores require exact design spectra, not nearby substitutes."""
import numpy as np
import pytest
from inverse_design.physical_evaluation import evaluate_predictions, summarize_evaluation


def catalogue():
    """Return a minimal real-shape catalogue fixture."""
    return dict(wavelengths=np.array([500., 505., 510.]),
                spectra={'winner': np.array([.74, .75, .76]), 'alternative': np.array([.73, .75, .77])},
                designs={'winner': dict(geometry=0, substrate=0, outer_nm=100., inner_nm=0.),
                         'alternative': dict(geometry=1, substrate=1, outer_nm=120., inner_nm=0.)})


def test_exact_alternative_and_unverified_dimensions():
    predictions = [dict(geometry='disk', substrate='air', outer_nm=100., inner_nm=0.),
                   dict(geometry='square', substrate='SiO₂', outer_nm=120., inner_nm=0.),
                   dict(geometry='disk', substrate='air', outer_nm=100.00001, inner_nm=0.)]
    records = evaluate_predictions(predictions, np.array([[500, 510, .75]] * 3), catalogue())
    assert [row['status'] for row in records] == ['verified_catalogue', 'verified_catalogue', 'requires_simulation']
    assert records[0]['worst_error'] == pytest.approx(.01)
    assert records[1]['worst_error'] == pytest.approx(.02)
    assert records[1]['excess_worst_error'] == pytest.approx(.01)
    assert records[2]['worst_error'] is None
    summary = summarize_evaluation(records)
    assert summary['verified_count'] == 2
    assert summary['unverified_count'] == 1
    assert summary['mean_worst_error'] == pytest.approx(.015)
    assert summarize_evaluation(records[2:])['mean_worst_error'] is None


def test_prediction_count_mismatch():
    with pytest.raises(ValueError):
        evaluate_predictions([], np.array([[500, 510, .75]]), catalogue())
