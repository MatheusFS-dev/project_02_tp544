# Flat Optuna HFSS validation

Date: 2026-11-09T17:15:13-03:00

5/5 optimized geometries have actual 401-point HFSS spectra. Original project and builder hashes were verified. The same five target requests as the earlier inverse baseline are used for paired comparison. Each new geometry was optimized with the trained flat-spectrum Optuna winner, using only training starts and bounds.

| Project | Family | Predicted worst (pp) | HFSS worst (pp) | HFSS mean (pp) | Earlier inverse worst (pp) | Mesh / sweep converged |
|---|---|---:|---:|---:|---:|---|
| [flat_optuna_01](flat_optuna_01/flat_optuna_01.aedt) | F12 | 20.51 | 28.18 | 19.89 | 31.17 | True / True |
| [flat_optuna_02](flat_optuna_02/flat_optuna_02.aedt) | F10 | 51.09 | 68.66 | 58.07 | 64.69 | True / True |
| [flat_optuna_03](flat_optuna_03/flat_optuna_03.aedt) | F11 | 0.80 | 1.75 | 0.83 | 11.30 | True / True |
| [flat_optuna_04](flat_optuna_04/flat_optuna_04.aedt) | F05 | 68.05 | 82.95 | 72.70 | 78.26 | True / True |
| [flat_optuna_05](flat_optuna_05/flat_optuna_05.aedt) | F08 | 2.35 | 1.72 | 1.03 | 5.18 | True / True |

Errors measure deviation from the requested constant absorption inside its band. “pp” means percentage points. Mean errors are wavelength-weighted. Geometry values are used as optimized, without catalogue snapping. The original 320 nm cell, 30 nm gold, air, material dispersion, normal incidence, four Floquet modes per port and original adaptive/interpolating sweep settings are preserved. Spectra average the two incident polarizations.

![Actual versus predicted absorption](absorption_comparison.png)

2/5 cases meet ±5 pp across the full requested band. 3/5 have lower worst target error than the earlier inverse baseline on the identical request. These are five fixed examples, not a test-set-wide success estimate.

The largest two-polarization transmission difference is 22.65 pp. Converged solver status does not remove the need for mesh/port convergence studies before final physical acceptance.

High absorption objectives can remain far from the spectra available in the received catalogue. Low forward-spectrum test MAE does not guarantee that optimized geometries satisfy the requested target. Native solver convergence and surrogate optimism are recorded per case.

![flat_optuna_01 T/R/A](flat_optuna_01_spectrum.png)

![flat_optuna_02 T/R/A](flat_optuna_02_spectrum.png)

![flat_optuna_03 T/R/A](flat_optuna_03_spectrum.png)

![flat_optuna_04 T/R/A](flat_optuna_04_spectrum.png)

![flat_optuna_05 T/R/A](flat_optuna_05_spectrum.png)

Full metrics and checkpoint hashes: [optuna_validation.md](optuna_validation.md). Solver status: [hfss_status.json](hfss_status.json). Physical comparison: [physical_summary.json](physical_summary.json).
