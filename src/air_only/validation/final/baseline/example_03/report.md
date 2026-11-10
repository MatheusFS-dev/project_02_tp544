# Final geometry: actual HFSS validation

2026-11-10T13:08:24-03:00

Family: F12
Substrate: air
Tracks: yes
R_d: 56.256904602050781 nm
Rout_c: 111.39514923095703 nm
w_c: 45 nm
w_t: 27.061122894287109 nm
Circular dimensions are radii. Square dimensions are side lengths.

Target: 25% absorption over 750–780 nm.

Actual absorption in band: 35.513–37.982%.
Actual worst target error: 12.982 pp. Mean error: 11.761 pp.
Predicted worst target error: 0.883 pp.
Mesh converged: True. Sweep converged and passive: True.

[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)

HFSS project: [geometry_305795dff98cd517.aedt](hfss/geometry_305795dff98cd517.aedt). [Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.
