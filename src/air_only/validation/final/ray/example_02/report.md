# Final geometry: actual HFSS validation

2026-11-10T13:08:31-03:00

Family: F06
Substrate: air
Tracks: yes
Lout_q: 237.63124084472656 nm
Rout_c: 58.963108062744141 nm
w_c: 24.013736724853516 nm
w_q: 36.88525390625 nm
w_t: 20.5 nm
Circular dimensions are radii. Square dimensions are side lengths.

Target: 30% absorption over 600–620 nm.

Actual absorption in band: 30.627–33.080%.
Actual worst target error: 3.080 pp. Mean error: 2.406 pp.
Predicted worst target error: 0.335 pp.
Mesh converged: True. Sweep converged and passive: True.

[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)

HFSS project: [geometry_33fb23079d585a71.aedt](hfss/geometry_33fb23079d585a71.aedt). [Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.
