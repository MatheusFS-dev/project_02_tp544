# Final geometry: actual HFSS validation

2026-11-10T13:08:28-03:00

Family: F06
Substrate: air
Tracks: yes
Lout_q: 180.52603149414062 nm
Rout_c: 41.754753112792969 nm
w_c: 15 nm
w_q: 42.5 nm
w_t: 19.5 nm
Circular dimensions are radii. Square dimensions are side lengths.

Target: 25% absorption over 750–780 nm.

Actual absorption in band: 21.778–23.371%.
Actual worst target error: 3.222 pp. Mean error: 2.557 pp.
Predicted worst target error: 0.377 pp.
Mesh converged: True. Sweep converged and passive: True.

[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)

HFSS project: [geometry_946b8f06efcb9868.aedt](hfss/geometry_946b8f06efcb9868.aedt). [Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.
