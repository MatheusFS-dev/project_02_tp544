# Final models: five narrow-band HFSS validations

2026-11-10T13:10:00-03:00

Completed 20/20 model/request validations. Air substrate only. The original gold material, periodic boundaries, ports and 401-point sweep were retained.

Targets were fixed using real training spectra before new model inference. This is a dataset-supported demonstration, not an unseen test set. Each case uses its own final retrained model and searches all twelve families.

| Example | Band (nm) | Target A | Training spectra within ±2 pp |
|---|---|---:|---:|
| example_01 | 500–510 | 40% | 101 |
| example_02 | 600–620 | 30% | 38 |
| example_03 | 750–780 | 25% | 26 |
| example_04 | 1000–1040 | 20% | 51 |
| example_05 | 1250–1300 | 15% | 39 |

| Model | Example | Family | Predicted worst error (pp) | HFSS worst error (pp) | HFSS mean error (pp) | Plots/report |
|---|---|---|---:|---:|---:|---|
| baseline | example_01 | F11 | 0.303 | 0.232 | 0.107 | [T/R/A](baseline/example_01/TRA.png), [band](baseline/example_01/absorption_band.png), [report](baseline/example_01/report.md) |
| baseline | example_02 | F12 | 0.565 | 1.048 | 0.764 | [T/R/A](baseline/example_02/TRA.png), [band](baseline/example_02/absorption_band.png), [report](baseline/example_02/report.md) |
| baseline | example_03 | F12 | 0.883 | 12.982 | 11.761 | [T/R/A](baseline/example_03/TRA.png), [band](baseline/example_03/absorption_band.png), [report](baseline/example_03/report.md) |
| baseline | example_04 | F10 | 0.632 | 2.986 | 2.491 | [T/R/A](baseline/example_04/TRA.png), [band](baseline/example_04/absorption_band.png), [report](baseline/example_04/report.md) |
| baseline | example_05 | F06 | 0.634 | 1.896 | 1.186 | [T/R/A](baseline/example_05/TRA.png), [band](baseline/example_05/absorption_band.png), [report](baseline/example_05/report.md) |
| optuna | example_01 | F07 | 0.198 | 0.137 | 0.051 | [T/R/A](optuna/example_01/TRA.png), [band](optuna/example_01/absorption_band.png), [report](optuna/example_01/report.md) |
| optuna | example_02 | F06 | 0.335 | 3.080 | 2.406 | [T/R/A](optuna/example_02/TRA.png), [band](optuna/example_02/absorption_band.png), [report](optuna/example_02/report.md) |
| optuna | example_03 | F06 | 0.377 | 3.222 | 2.557 | [T/R/A](optuna/example_03/TRA.png), [band](optuna/example_03/absorption_band.png), [report](optuna/example_03/report.md) |
| optuna | example_04 | F07 | 0.364 | 0.611 | 0.277 | [T/R/A](optuna/example_04/TRA.png), [band](optuna/example_04/absorption_band.png), [report](optuna/example_04/report.md) |
| optuna | example_05 | F09 | 0.552 | 2.945 | 2.196 | [T/R/A](optuna/example_05/TRA.png), [band](optuna/example_05/absorption_band.png), [report](optuna/example_05/report.md) |
| ray | example_01 | F07 | 0.198 | 0.137 | 0.051 | [T/R/A](ray/example_01/TRA.png), [band](ray/example_01/absorption_band.png), [report](ray/example_01/report.md) |
| ray | example_02 | F06 | 0.335 | 3.080 | 2.406 | [T/R/A](ray/example_02/TRA.png), [band](ray/example_02/absorption_band.png), [report](ray/example_02/report.md) |
| ray | example_03 | F06 | 0.377 | 3.222 | 2.557 | [T/R/A](ray/example_03/TRA.png), [band](ray/example_03/absorption_band.png), [report](ray/example_03/report.md) |
| ray | example_04 | F07 | 0.364 | 0.611 | 0.277 | [T/R/A](ray/example_04/TRA.png), [band](ray/example_04/absorption_band.png), [report](ray/example_04/report.md) |
| ray | example_05 | F09 | 0.552 | 2.945 | 2.196 | [T/R/A](ray/example_05/TRA.png), [band](ray/example_05/absorption_band.png), [report](ray/example_05/report.md) |
| autokeras | example_01 | F09 | 0.257 | 0.296 | 0.200 | [T/R/A](autokeras/example_01/TRA.png), [band](autokeras/example_01/absorption_band.png), [report](autokeras/example_01/report.md) |
| autokeras | example_02 | F12 | 0.351 | 2.486 | 2.014 | [T/R/A](autokeras/example_02/TRA.png), [band](autokeras/example_02/absorption_band.png), [report](autokeras/example_02/report.md) |
| autokeras | example_03 | F12 | 0.459 | 11.440 | 11.336 | [T/R/A](autokeras/example_03/TRA.png), [band](autokeras/example_03/absorption_band.png), [report](autokeras/example_03/report.md) |
| autokeras | example_04 | F09 | 0.429 | 2.615 | 2.480 | [T/R/A](autokeras/example_04/TRA.png), [band](autokeras/example_04/absorption_band.png), [report](autokeras/example_04/report.md) |
| autokeras | example_05 | F09 | 0.709 | 0.631 | 0.272 | [T/R/A](autokeras/example_05/TRA.png), [band](autokeras/example_05/absorption_band.png), [report](autokeras/example_05/report.md) |

| Model | Mean HFSS worst target error (pp) | Cases within ±5 pp |
|---|---:|---:|
| optuna | 1.999 | 5/5 |
| ray | 1.999 | 5/5 |
| autokeras | 3.493 | 4/5 |
| baseline | 3.829 | 4/5 |

Best mean physical target matching on these five examples: **optuna, ray**. This small demonstration does not establish general superiority.

All mesh and sweep checks converged: True.
Unique physical solves: 15. Exactly identical geometry/request inputs share a real HFSS solution, with a link in each example. Optuna and Ray final model tensors are identical, despite different checkpoint-file hashes.

Every example contains native geometry JSON/text, twelve candidate spectra, T/R/A and band-detail PNG/PDF plots, a solver-status summary and an HFSS directory link. Raw solved spectra and AEDT projects are under `hfss/`.

