"""Score received comparison spectra against constant absorption targets."""
import numpy as np


def normalize(values):
    """Validate physical inputs and return normalized float32 rows.

    Args:
        values: Finite physical input rows ordered as A, B, X.

    Returns:
        A float32 array with normalized wavelength columns and unchanged X.

    Raises:
        ValueError: Inputs violate the shape, finiteness or physical bounds."""
    x = np.asarray(values, dtype=np.float64)
    if x.ndim != 2 or x.shape[1] != 3 or not np.isfinite(x).all():
        raise ValueError('inputs must be finite rows of [A, B, X]')
    a, b, absorption = x.T
    if not ((450 <= a) & (a < b) & (b <= 1600) & (0 <= absorption) & (absorption <= 1)).all():
        raise ValueError('require 450 ≤ A < B ≤ 1600 and 0 ≤ X ≤ 1')
    return ((x - [450, 450, 0]) / [1150, 1150, 1]).astype(np.float32)


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
