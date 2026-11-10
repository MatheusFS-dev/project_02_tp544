# Full-family implementation and validation report

Date: 2026-11-09 08:27:10 -03.

## Work completed

Implemented a shared backbone, F01–F12 classifier, substrate classifier and
12 small family-specific parameter heads. Training routes regression through
the true-family head and masks inactive dimensions. Inference selects the
predicted family's head and returns named dimensions in native HFSS units.

Updated PyTorch training, AutoKeras heads and weight export, inference metrics,
checkpoint architecture identification and physical evaluation. Legacy
four-family checkpoint loading remains supported. Updated runner configurations,
README, AGENTS.md and related agent context.

## Dataset preparation

Preserved all 2,000 received samples. Grouped 74 repetitions with identical
spectra, leaving 1,926 unique parameterized designs. Each spectrum contains
401 wavelengths between 450.004 and 1599.746 nm. The received setup uses air,
normal incidence, 30 nm gold thickness and a 320 nm periodic cell.

Seed 42 stratification by source family produced:

| Partition | Unique designs | Target requests |
| --- | ---: | ---: |
| Training | 1,348 | 5,392 |
| Validation | 289 | 1,156 |
| Test | 289 | 1,156 |

The split is approximately 70/15/15%, with integer rounding. Duplicate source
IDs stay in the same partition. No geometry IDs cross partitions.

Generated 7,704 distinct desired-band/target requests using received wavelength
endpoints and absorption targets uniform in [0,1]. These requests are objectives,
not fabricated response spectra. Labels minimize worst absorption error using
only the request's partition catalogue, followed by average error and source-ID
tie breaks. All twelve families appear among winning labels in every partition,
with unequal frequencies. Sampled labels matched the reference minimax selector.

## Short validation results

Baseline, Optuna, AutoKeras and Ray completed on the RTX 4070 with three epochs
and two candidates per search. All four saved expert checkpoints were reloaded
and used for inference. No full training was performed.

| Runner | Test family accuracy | Oracle parameter MAE (nm) |
| --- | ---: | ---: |
| Baseline | 55.4% | 11.27 |
| Optuna | 60.4% | 11.70 |
| AutoKeras | 57.2% | 11.57 |
| Ray | 61.8% | 13.81 |

Oracle MAE uses the true-family parameter head. It does not include the effect
of selecting the wrong family. These short runs verify execution and do not
establish final model quality or a reliable ranking between search methods.

The suite passed 59 tests, including routing, masked loss, stratification and
AutoKeras/PyTorch export equivalence. Python compilation and whitespace checks
passed. Eight upstream KerasTuner deprecation warnings remain.

Baseline physical evaluation found no exact catalogue matches among 1,156
predictions. Their optical responses remain unverified and require simulation.

## Implementation artifacts

- Original received files: `data/raw/treinar/`.
- Prepared arrays and split/hash provenance: `data/processed/treinar_families_v2/`.
- Checkpoints, metrics, logs and baseline physical evaluation: `runs/treinar_families_v2/`.
- Model and loss definitions: `src/inverse_design/core.py` and `families.py`.
- Full-family preparation and evaluation: `family_data.py` and `family_evaluation.py`.
- Runner settings: `src/configs/`, retaining the short training budgets.

The root `PROBLEM_ARCHITECTURE.md` now describes only the proposed problem,
supervision, geometry options, architecture and outputs. Results and execution
details are recorded here.
