"""Native F01–F12 geometry definitions for received air-only spectra."""
import numpy as np

NAMES = tuple(f'F{i:02d}' for i in range(1, 13))
PARAMETERS = ('Lout_q', 'w_q', 'Rout_c', 'w_c', 'R_d', 'L_s', 'w_t')
ACTIVE = ((4,), (5,), (2, 3), (0, 1), (0, 1, 2, 3), (0, 1, 2, 3, 6),
          (0, 1, 4), (0, 1, 4, 6), (0, 1, 5), (0, 1, 5, 6), (2, 3, 4), (2, 3, 4, 6))
SCALES = np.array([320, 160, 160, 160, 160, 320, 160], dtype=np.float32)
MASK = np.array([[int(j in active) for j in range(7)] for active in ACTIVE], dtype=np.float32)
