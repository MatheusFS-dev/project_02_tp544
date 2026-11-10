# Final geometry: actual HFSS validation

2026-11-10T13:08:24-03:00

Family: F12
Substrate: air
Tracks: yes
R_d: 42.386810302734375 nm
Rout_c: 118.95023345947266 nm
w_c: 35.928989410400391 nm
w_t: 15.633726119995117 nm
Circular dimensions are radii. Square dimensions are side lengths.

Target: 30% absorption over 600–620 nm.

Actual absorption in band: 30.085–31.048%.
Actual worst target error: 1.048 pp. Mean error: 0.764 pp.
Predicted worst target error: 0.565 pp.
Mesh converged: True. Sweep converged and passive: True.

[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)

HFSS project: [geometry_2a9d70cfde9cc3d0.aedt](hfss/geometry_2a9d70cfde9cc3d0.aedt). [Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.
