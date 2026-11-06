"""Score sampled absorption against a constant target level."""
import numpy as np
from .core import normalize


def score_band(wavelengths: np.ndarray, absorption: np.ndarray, request: np.ndarray) -> dict:
    """Calculate worst error, wavelength-averaged error and ripple.

    Args:
        wavelengths: Strictly increasing wavelength grid in nanometers.
        absorption: Finite absorption values in [0, 1] on that grid.
        request: Physical band start, band end and desired absorption level.

    Returns:
        Worst absolute error, trapezoidal average absolute error and ripple.

    Raises:
        ValueError: Values are invalid or endpoints are absent from the grid.
    """
    request = np.asarray(request, dtype=np.float64)
    normalize(request.reshape(1, -1))
    grid = np.asarray(wavelengths, dtype=np.float64)
    values = np.asarray(absorption, dtype=np.float64)
    if (grid.ndim != 1 or len(grid) < 2 or not np.isfinite(grid).all()
            or not (np.diff(grid) > 0).all() or values.shape != grid.shape
            or not np.isfinite(values).all() or not ((0 <= values) & (values <= 1)).all()):
        raise ValueError('require increasing finite wavelengths and absorption in [0, 1]')
    a, b, target = request
    if a not in grid or b not in grid:
        raise ValueError('band endpoints must be present on the received wavelength grid')
    mask = (grid >= a) & (grid <= b)
    band = values[mask]
    errors = np.abs(band - target)
    return dict(worst_error=float(errors.max()),
                average_error=float(np.trapz(errors, grid[mask]) / (b - a)),
                ripple=float(np.ptp(band)))


def select_design(wavelengths: np.ndarray, spectra: dict, request: np.ndarray) -> tuple:
    """Rank catalogue designs by target error and deterministic tie-breaking.

    Args:
        wavelengths: Shared wavelength grid.
        spectra: Mapping from simulation ID to absorption samples.
        request: Physical band start, band end and target level.

    Returns:
        Winning simulation ID and all score records in ranking order.

    Raises:
        ValueError: Catalogue is empty or a spectrum/request is invalid.
    """
    if not spectra:
        raise ValueError('catalogue must contain at least one spectrum')
    scores = [dict(simulation_id=key, **score_band(wavelengths, values, request))
              for key, values in spectra.items()]
    scores.sort(key=lambda row: (row['worst_error'], row['average_error'], row['simulation_id']))
    return scores[0]['simulation_id'], scores
