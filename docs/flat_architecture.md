# Architecture for flat absorption matching

The objective is a spectrum as close as possible to a constant absorption level
throughout a specified wavelength interval. A constant spectrum at the wrong
level does not satisfy that objective.

## Forward model

The model receives one F01–F12 geometry family and its seven native normalized
parameters. Inactive parameters are masked out. A learned family embedding,
active parameter mask and geometry parameters feed a shared multilayer network.
The fixed baseline uses residual blocks. Optuna, AutoKeras and Ray independently select plain or residual
blocks, layer width, depth and dropout using validation spectrum loss.

The output contains transmission, reflection and absorption at every received
wavelength. A three-channel softmax at each wavelength makes all fractions
nonnegative and enforces transmission plus reflection plus absorption equal to
one. It does not guarantee that an arbitrary predicted spectrum is physically
realizable. Actual electromagnetic simulation remains the final check.

## Received data and training

All 2,000 received HFSS spectra contribute source provenance. Identical
geometries with identical spectra are grouped into 1,926 unique examples before
family-stratified 70/15/15 training, validation and test partitioning. Duplicate
source IDs stay together. The full wavelength grid and all T/R/A samples remain
available, rather than converting a spectrum into an inverse family label.

Training combines absorption mean squared error, per-spectrum maximum absorption
error and an auxiliary T/R/A mean squared error. Validation uses the same spectrum
loss. Architecture searches do not use test metrics for selection. The selected
checkpoint is evaluated on held-out spectra using absorption MAE and mean/p95
maximum spectral error. These measure surrogate fidelity, not flat-target success.

## Independent cases

Baseline, Optuna, AutoKeras and Ray each train and export one final model in
their own case directory. Each has a dedicated training and geometry-design
entry point. No model or training state is shared between cases. The prepared
real dataset and numerical utilities are shared to keep the objective and
partitions consistent. AutoKeras trains its own AutoModel graph and exports an
equivalent PyTorch representation after checking prediction parity.

## Geometry optimization

For a requested band and target, enumerate all twelve families. For each family,
initialize several starts from its best matching training geometries. Use the
surrogate's gradients to adjust active dimensions inside training-only empirical
bounds and a local trust region around each start. Preserve positive square and
circular ring holes. Inactive dimensions remain zero.

The primary objective is the largest absolute difference between predicted
absorption and the target anywhere in the band. A small average-error term helps
optimization, while final candidates are ranked by worst error followed by
average error. Include both exact band endpoints with differentiable linear
interpolation. Mean error is weighted by wavelength. The best received training
spectrum is reported separately as an observed reference.

## Outputs and interpretation

Export one best candidate per family, its native parameters, training seed ID,
local bounds, full predicted T/R/A spectrum and worst/average target error. A
tolerance such as ±5 percentage points means every wavelength in the requested
band must remain inside that tolerance. Passing the surrogate tolerance is not
proof of passing HFSS.

Wider bands add constraints to the worst-error objective. Some requested levels
may be infeasible over a large interval. The workflow returns the closest
surrogate candidate found, not a guarantee of global optimality or feasibility.
Run HFSS on promising candidates and compare the simulated absorption with the
same band, target and tolerance before accepting a geometry.
