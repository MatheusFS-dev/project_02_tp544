# Optuna best-trial HFSS results

Date: 2026-11-09T11:08:29-03:00

5/5 predicted geometries have exported 401-point HFSS spectra. The five separate AEDT projects remain open in the graphical desktop. Original received project and builder hashes were checked and are unchanged.

Cases are the first five distinct predicted families in a seed-42 shuffle of the test split. Predictions are used without clipping, rounding or catalogue snapping. The original 320 nm period, 30 nm gold, air, normal incidence, four Floquet modes per port, material dispersion, adaptive settings and frequency sweep are preserved. T/R/A are averaged over the two incident polarizations.

| Case | Family (predicted / label) | Worst error (pp) | Mean error (pp) | Catalogue worst (pp) | Mesh / sweep converged |
|---|---|---:|---:|---:|---|
| [optuna_01](optuna_01/optuna_01.aedt) | F07 / F07 | 32.94 | 18.14 | 21.93 | True / True |
| [optuna_02](optuna_02/optuna_02.aedt) | F10 / F10 | 71.74 | 62.17 | 61.86 | True / True |
| [optuna_03](optuna_03/optuna_03.aedt) | F05 / F10 | 75.34 | 67.52 | 73.71 | True / True |
| [optuna_04](optuna_04/optuna_04.aedt) | F09 / F10 | 24.92 | 23.82 | 26.31 | True / True |
| [optuna_05](optuna_05/optuna_05.aedt) | F08 / F05 | 2.91 | 1.97 | 0.67 | True / True |

Errors compare simulated absorption with the requested constant level inside its wavelength band. “pp” means percentage points. Mean error is weighted by wavelength. Catalogue error uses the original held-out label spectrum, not the predicted geometry. Small endpoint differences from the rounded dataset grid are interpolated within 0.002 nm. Five diverse cases do not establish performance across the entire test split, and no acceptance tolerance was specified.

Requests are objectives, not guarantees of physical feasibility. The catalogue reference also has target error, so the prediction error must be interpreted alongside that reference.

![Predicted versus catalogue absorption](absorption_comparison.png)

The largest difference between the two polarization transmission curves is 11.17 percentage points. Although the spectra are averaged as in the received generator, this discrepancy should be checked with a mesh/port convergence study before treating the curves as final physical validation.

![optuna_01 T/R/A](optuna_01_spectrum.png)

![optuna_02 T/R/A](optuna_02_spectrum.png)

![optuna_03 T/R/A](optuna_03_spectrum.png)

![optuna_04 T/R/A](optuna_04_spectrum.png)

![optuna_05 T/R/A](optuna_05_spectrum.png)

Projects, spectra and native diagnostics: `src/validation/optuna/optuna_01/` through `optuna_05/`. Selection and checkpoint hashes: `predictions.json`. Full numerical comparison: `physical_summary.json`. Detailed runtime status: `hfss_status.json`.
