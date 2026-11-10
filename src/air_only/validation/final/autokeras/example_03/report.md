# Final geometry: actual HFSS validation

2026-11-10T13:08:36-03:00

Family: F12
Substrate: air
Tracks: yes
R_d: 76.586624145507812 nm
Rout_c: 118.74917602539062 nm
w_c: 33.25396728515625 nm
w_t: 27.542270660400391 nm
Circular dimensions are radii. Square dimensions are side lengths.

Target: 25% absorption over 750–780 nm.

Actual absorption in band: 13.560–13.974%.
Actual worst target error: 11.440 pp. Mean error: 11.336 pp.
Predicted worst target error: 0.459 pp.
Mesh converged: True. Sweep converged and passive: True.

[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)

HFSS project: [geometry_3985e04b0c0e691c.aedt](hfss/geometry_3985e04b0c0e691c.aedt). [Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.
