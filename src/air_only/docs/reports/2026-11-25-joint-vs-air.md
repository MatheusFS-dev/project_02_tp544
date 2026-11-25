# Air-only vs joint air + silica models

Date: 2026-11-25T14:36:33-03:00

Joint models reuse the four presentation topologies with a substrate input, trained from scratch on 1926 air and 1839 silica unique geometries. Validation: 385 air and 366 silica geometries. Every geometry keeps its air final partition for both substrates. Single seed (42).

## Spectrum fit on validation (absorption error, pp)

| Case | Air: air-only MAE | Air: joint MAE | Air: air-only worst | Air: joint worst | Silica: joint MAE | Silica: joint worst | Silica: air-only zero-shot MAE |
|---|---|---|---|---|---|---|---|
| baseline | 2.01 | 1.56 | 8.30 | 7.16 | 1.47 | 7.00 | 8.07 |
| optuna | 1.47 | 1.47 | 6.48 | 6.47 | 1.35 | 6.38 | 8.13 |
| ray | 1.47 | 1.47 | 6.48 | 6.47 | 1.35 | 6.38 | 8.13 |
| autokeras | 1.51 | 1.39 | 6.64 | 6.11 | 1.37 | 6.05 | 8.18 |

"Worst" is the mean over spectra of the per-spectrum maximum absorption error. The zero-shot column applies the air-only model to silica geometries. It is a reference for how far silica spectra are from air, not a model.

## Inverse design on the five presentation requests (worst in-band error, pp)

Air-only HFSS values come from `validation/final/summary.json`. Joint values are surrogate predictions, not HFSS-verified.

| Case | Request | Air-only family | Air-only predicted | Air-only HFSS | Joint best | Joint predicted | Joint best air | Joint air predicted |
|---|---|---|---|---|---|---|---|---|
| baseline | 500-510 nm, 40% | F11 | 0.30 | 0.23 | F09 air | 0.26 | F09 | 0.26 |
| baseline | 600-620 nm, 30% | F12 | 0.56 | 1.05 | F08 silica | 0.54 | F07 | 0.72 |
| baseline | 750-780 nm, 25% | F12 | 0.88 | 12.98 | F12 air | 0.31 | F12 | 0.31 |
| baseline | 1000-1040 nm, 20% | F10 | 0.63 | 2.99 | F08 air | 0.37 | F08 | 0.37 |
| baseline | 1250-1300 nm, 15% | F06 | 0.63 | 1.90 | F05 air | 0.50 | F05 | 0.50 |
| optuna | 500-510 nm, 40% | F07 | 0.20 | 0.14 | F09 air | 0.38 | F09 | 0.38 |
| optuna | 600-620 nm, 30% | F06 | 0.34 | 3.08 | F06 air | 0.23 | F06 | 0.23 |
| optuna | 750-780 nm, 25% | F06 | 0.38 | 3.22 | F06 air | 0.36 | F06 | 0.36 |
| optuna | 1000-1040 nm, 20% | F07 | 0.36 | 0.61 | F10 silica | 0.29 | F05 | 0.40 |
| optuna | 1250-1300 nm, 15% | F09 | 0.55 | 2.94 | F06 silica | 0.33 | F07 | 0.34 |
| ray | 500-510 nm, 40% | F07 | 0.20 | 0.14 | F09 air | 0.38 | F09 | 0.38 |
| ray | 600-620 nm, 30% | F06 | 0.34 | 3.08 | F06 air | 0.23 | F06 | 0.23 |
| ray | 750-780 nm, 25% | F06 | 0.38 | 3.22 | F06 air | 0.36 | F06 | 0.36 |
| ray | 1000-1040 nm, 20% | F07 | 0.36 | 0.61 | F10 silica | 0.29 | F05 | 0.40 |
| ray | 1250-1300 nm, 15% | F09 | 0.55 | 2.94 | F06 silica | 0.33 | F07 | 0.34 |
| autokeras | 500-510 nm, 40% | F09 | 0.26 | 0.30 | F09 air | 0.22 | F09 | 0.22 |
| autokeras | 600-620 nm, 30% | F12 | 0.35 | 2.49 | F12 silica | 0.31 | F06 | 0.34 |
| autokeras | 750-780 nm, 25% | F12 | 0.46 | 11.44 | F05 silica | 0.40 | F05 | 0.51 |
| autokeras | 1000-1040 nm, 20% | F09 | 0.43 | 2.61 | F12 silica | 0.35 | F11 | 0.36 |
| autokeras | 1250-1300 nm, 15% | F09 | 0.71 | 0.63 | F08 silica | 0.28 | F10 | 0.35 |
