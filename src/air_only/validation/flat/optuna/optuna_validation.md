# Flat Optuna validation

Date: 2026-11-10T10:41:58-03:00

Optuna selected trial 16 by validation loss. The selected trial completed 299 epochs on 1348 training geometries. Lowest recorded validation loss occurred at epoch 269. The selected checkpoint was verified against its retained dataset.

On all 289 held-out geometries, absorption MAE is **1.548 pp**. Mean worst spectrum error is **6.923 pp**, and the 95th percentile is **12.954 pp**. These describe forward-spectrum fidelity, not flat-target success.

![Training history](training_history.png)

![Held-out spectrum errors](test_spectrum_errors.png)

![Five held-out examples](held_out_spectra.png)

Five design requests preserve the exact wavelength bands and absorption levels used in the previous inverse baseline. Each is optimized with training-only starts/bounds, and the best predicted candidate is selected by worst target error. These fixed cases are not a representative physical test estimate. The observed catalogue reference is selected only from training geometries.

| Case | Band (nm) | Target A | Chosen family | Predicted worst error (pp) |
|---|---|---:|---|---:|
| flat_optuna_01 | 531.1–687.0 | 60.84% | F12 | 20.509 |
| flat_optuna_02 | 631.6–889.5 | 86.62% | F10 | 51.092 |
| flat_optuna_03 | 475.6–558.4 | 30.12% | F11 | 0.800 |
| flat_optuna_04 | 514.7–1049.9 | 93.57% | F05 | 68.053 |
| flat_optuna_05 | 607.1–742.0 | 9.86% | F08 | 2.347 |

The geometric designs and their absorption values above are surrogate predictions. Actual HFSS spectra and target errors are reported separately after simulation in [optuna_hfss.md](optuna_hfss.md). Detailed metrics: [spectrum_metrics.json](spectrum_metrics.json). Cases and hashes: [predictions.json](predictions.json). Per-test-geometry errors: [test_geometry_errors.csv](test_geometry_errors.csv).
