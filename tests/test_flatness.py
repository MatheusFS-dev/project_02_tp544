"""Physical target matching on sampled spectra."""
import numpy as np
import pytest
from inverse_design.flatness import score_band, select_design


def test_target_matching_and_level_changes():
    grid = np.array([500., 505., 510.])
    spectra = {'close': np.array([.74, .75, .76]), 'flat': np.array([.9, .9, .9])}
    score = score_band(grid, spectra['close'], np.array([500, 510, .75]))
    assert score['worst_error'] == pytest.approx(.01)
    assert score['ripple'] == pytest.approx(.02)
    assert select_design(grid, spectra, [500, 510, .75])[0] == 'close'
    assert select_design(grid, spectra, [500, 510, .9])[0] == 'flat'


def test_ties_and_nonuniform_average():
    grid = np.array([500., 501., 510.])
    score = score_band(grid, [.5, .6, .7], [500, 510, .5])
    assert score['average_error'] == pytest.approx(.14)
    spectra = {'z': [.5, .6, .7], 'a': [.5, .6, .7]}
    assert select_design(grid, spectra, [500, 510, .5])[0] == 'a'


@pytest.mark.parametrize('grid,values,band_request', [
    ([500, 505, 510], [.5, .6, .7], [501, 510, .5]),
    ([500, 500, 510], [.5, .6, .7], [500, 510, .5]),
    ([500, 505, 510], [.5, float('nan'), .7], [500, 510, .5]),
    ([500, 505, 510], [.5, 1.1, .7], [500, 510, .5]),
])
def test_reject_invalid_spectra(grid, values, band_request):
    with pytest.raises(ValueError):
        score_band(grid, values, band_request)
