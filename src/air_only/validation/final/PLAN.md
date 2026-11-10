# Final narrow-band validation plan

2026-11-10T11:35:39-03:00

1. Remove the three previous inference examples and their generated HFSS projects. Preserve trained models, raw projects and earlier comparison experiments.
2. Fix five targets from received training-spectrum support before inspecting new model predictions: 500–510 nm at 40%, 600–620 nm at 30%, 750–780 nm at 25%, 1000–1040 nm at 20%, and 1250–1300 nm at 15% absorption.
3. Run the existing 500-step, eight-start, twelve-family inference separately for baseline, Optuna, Ray and AutoKeras. Store full parameter precision, all family candidates, spectra and checkpoint hashes.
4. Generate visible HFSS projects from the original template and solve both incident polarizations with the unchanged 401-point sweep. Identical physical geometries and requests may share a clearly identified actual solve. Model labels never enter physical identity.
5. Verify passivity, power balance, mesh and sweep convergence. Score interpolated band endpoints. Export full T/R/A and band-detail PNG/PDF plots, per-example reports, a comparison CSV and a short summary.

All new artifacts stay in this directory. The experiment is resumable and rejects changed inputs. These targets are dataset-supported demonstrations, not unseen test-set measurements. Tests verify physical-cache identity and actual-spectrum scoring before execution.
