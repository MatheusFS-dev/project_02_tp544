# Flat-absorption GPU smoke test

Date: 2026-11-09T13:36:51-03:00

GPU: NVIDIA GeForce RTX 4070. All 2000 received spectra were validated and grouped into 1926 unique geometries. Full split: {'train': 1348, 'validation': 289, 'test': 289}.

Training used only 120 training and 36 validation/test geometries, balanced across all twelve families, for two epochs. These are pipeline checks, not production accuracy results.

| Method | Smoke test absorption MAE (pp) | Mean worst spectrum error (pp) |
|---|---:|---:|
| baseline | 15.123 | 44.734 |
| optuna | 10.241 | 32.163 |
| autokeras | 8.348 | 27.901 |
| ray | 10.045 | 35.996 |

Passed: epoch checkpoint resume from 1 to 2, recovery of a stale best-model file, two actual Optuna trials, two genuine AutoKeras trials, two actual Ray trials, four independent final-model exports, test evaluation after winner selection, and twelve-family minimax optimization for each method. T/R/A predictions conserve power. Optimized candidates are surrogate predictions requiring HFSS verification. Temporary smoke checkpoints and logs were removed. Prepared real training data remain available.

Detailed evidence: [smoke.json](smoke.json).
