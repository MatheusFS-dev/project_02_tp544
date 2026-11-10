# Flat Ray validation

Date: 2026-11-09T17:18:20-03:00

Ray selected trial candidate_3793e_00046_46_depth=3,dropout=0.0000,trunk=plain,width=256_2026-11-09_15-46-40 by validation loss. The selected trial completed 300 epochs on 1348 training geometries. Lowest recorded validation loss occurred at epoch 299. The selected checkpoint was verified against its retained dataset.

On all 289 held-out geometries, absorption MAE is **1.501 pp**. Mean worst spectrum error is **6.867 pp**, and the 95th percentile is **13.285 pp**. These describe forward-spectrum fidelity, not flat-target success.

![Training history](training_history.png)

![Held-out spectrum errors](test_spectrum_errors.png)

![Five held-out examples](held_out_spectra.png)

Five design requests preserve the exact wavelength bands and absorption levels used in the previous inverse baseline. Each is optimized with training-only starts/bounds, and the best predicted candidate is selected by worst target error. These fixed cases are not a representative physical test estimate. The observed catalogue reference is selected only from training geometries.

| Case | Band (nm) | Target A | Chosen family | Predicted worst error (pp) |
|---|---|---:|---|---:|
| flat_ray_01 | 531.1–687.0 | 60.84% | F07 | 21.167 |
| flat_ray_02 | 631.6–889.5 | 86.62% | F10 | 51.917 |
| flat_ray_03 | 475.6–558.4 | 30.12% | F09 | 0.812 |
| flat_ray_04 | 514.7–1049.9 | 93.57% | F05 | 67.791 |
| flat_ray_05 | 607.1–742.0 | 9.86% | F03 | 1.620 |

The geometric designs and their absorption values above are surrogate predictions. Actual HFSS spectra and target errors are reported separately after simulation in [ray_hfss.md](ray_hfss.md). Detailed metrics: [spectrum_metrics.json](spectrum_metrics.json). Cases and hashes: [predictions.json](predictions.json). Per-test-geometry errors: [test_geometry_errors.csv](test_geometry_errors.csv).
