# AutoKeras best-trial HFSS results

Date: 2026-11-09T13:39:42-03:00

5/5 predicted geometries have exported 401-point HFSS spectra. The five separate AEDT projects remain open in the graphical desktop. Original received project and builder hashes were checked and are unchanged.

Cases are the first five distinct predicted families in a seed-42 shuffle of the test split. Predictions are used without clipping, rounding or catalogue snapping. The original 320 nm period, 30 nm gold, air, normal incidence, four Floquet modes per port, material dispersion, adaptive settings and frequency sweep are preserved. T/R/A are averaged over the two incident polarizations.

| Case | Family (predicted / label) | Worst error (pp) | Mean error (pp) | Catalogue worst (pp) | Mesh / sweep converged |
|---|---|---:|---:|---:|---|
| [autokeras_01](autokeras_01/autokeras_01.aedt) | F12 / F07 | 22.10 | 17.22 | 21.93 | True / True |
| [autokeras_02](autokeras_02/autokeras_02.aedt) | F10 / F10 | 61.58 | 53.72 | 61.86 | True / True |
| [autokeras_03](autokeras_03/autokeras_03.aedt) | F09 / F09 | 8.23 | 7.61 | 0.53 | True / True |
| [autokeras_04](autokeras_04/autokeras_04.aedt) | F05 / F10 | 75.30 | 69.32 | 73.71 | True / True |
| [autokeras_05](autokeras_05/autokeras_05.aedt) | F06 / F05 | 4.52 | 2.46 | 0.67 | True / True |

Errors compare simulated absorption with the requested constant level inside its wavelength band. “pp” means percentage points. Mean error is weighted by wavelength. Catalogue error uses the original held-out label spectrum, not the predicted geometry. Small endpoint differences from the rounded dataset grid are interpolated within 0.002 nm. Five diverse cases do not establish performance across the entire test split, and no acceptance tolerance was specified.

Requests are objectives, not guarantees of physical feasibility. The catalogue reference also has target error, so the prediction error must be interpreted alongside that reference.

![Predicted versus catalogue absorption](absorption_comparison.png)

The largest difference between the two polarization transmission curves is 11.34 percentage points. Although the spectra are averaged as in the received generator, this discrepancy should be checked with a mesh/port convergence study before treating the curves as final physical validation.

![autokeras_01 T/R/A](autokeras_01_spectrum.png)

![autokeras_02 T/R/A](autokeras_02_spectrum.png)

![autokeras_03 T/R/A](autokeras_03_spectrum.png)

![autokeras_04 T/R/A](autokeras_04_spectrum.png)

![autokeras_05 T/R/A](autokeras_05_spectrum.png)

Projects, spectra and native diagnostics: `src/validation/inverse_design/autokeras/autokeras_01/` through `autokeras_05/`. Selection and checkpoint hashes: `predictions.json`. Full numerical comparison: `physical_summary.json`. Detailed runtime status: `hfss_status.json`.
