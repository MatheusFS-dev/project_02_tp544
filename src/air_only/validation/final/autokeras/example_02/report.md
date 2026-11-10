# Final geometry: actual HFSS validation

2026-11-10T13:08:35-03:00

Family: F12
Substrate: air
Tracks: yes
R_d: 29.652643203735352 nm
Rout_c: 86.984519958496094 nm
w_c: 40.734500885009766 nm
w_t: 27.400218963623047 nm
Circular dimensions are radii. Square dimensions are side lengths.

Target: 30% absorption over 600–620 nm.

Actual absorption in band: 27.514–28.745%.
Actual worst target error: 2.486 pp. Mean error: 2.014 pp.
Predicted worst target error: 0.351 pp.
Mesh converged: True. Sweep converged and passive: True.

[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)

HFSS project: [geometry_fe5f60fb9bfb106a.aedt](hfss/geometry_fe5f60fb9bfb106a.aedt). [Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.
