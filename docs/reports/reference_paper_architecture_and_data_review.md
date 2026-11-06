# Should we adopt the paper’s approach?

Date and timestamp: 2026-11-06T14:11:41-03:00

**Recommendation: keep the current inverse-model approach. The paper does not demonstrate that replacing it would be better. Its simpler neural network is worth comparing, but its peak-based data representation does not fit our band-absorption objective.**

The real data has not arrived yet. This comparison assumes it will follow the existing geometry and HFSS CSV examples. No change to that delivery format is proposed.

## Today versus the paper

| Part | How our project works today | What adopting the paper would change | Is it better for us? |
| --- | --- | --- | --- |
| Prediction direction | Requested wavelength band and absorption → geometry, substrate and dimensions. | Geometry and wavelength → optical response. Finding a geometry would then require an additional search. | **Keep ours** for direct geometry prediction. The paper solves a different prediction task. |
| Data representation | The expected CSVs contain geometry information and wavelength-by-wavelength T, R and absorption. Training currently accepts prepared NPZ examples containing band requests and design labels. | The paper reduces each simulated angular response to its largest absolute TMOKE value and the angle where it occurs. It predicts those values for two refractive indices. | **Do not copy peak-only labels.** A high peak does not mean absorption stays high across a band. |
| Input scaling | Continuous inputs are normalized to `[0,1]`. | Normalize to `[−1,1]`. | **No demonstrated advantage. Keep ours.** Both approaches already scale the inputs. |
| Neural network | Three residual blocks of width 256, followed by geometry, substrate and dimension heads. | Three ordinary dense layers with widths 256, 128 and 64. | **Worth comparing.** It is simpler, but the paper does not show it would outperform our network on our task. Keep our task-specific heads in that comparison. |
| Training | AdamW, up to 50 epochs, with early stopping. | The paper reports Adam and 500 epochs per architecture-search trial. | **Keep ours initially.** More epochs are not evidence of better results. |
| Dataset split | The loader accepts separate training, validation and test indices. | The paper reports approximately 80% training and 20% validation, plus a separate demonstration structure. | **Keep our separate test split.** If many rows come from one geometry, keep those related rows together when testing unseen geometries. |
| Output handling | Classification selects geometry and substrate. Dimension outputs enforce outer/inner bounds and zero inner size for solid shapes. | Four continuous outputs with linear activation and no architectural bounds. | **Keep ours.** The constraints prevent invalid size combinations. |
| Model comparison | Residual baseline and neural searches using Optuna, AutoKeras and Ray. | Add polynomial regression as a different model family. | **Optional.** Useful for a broader comparison, but it needs adaptation to our mixed classification/regression task. Do not assume their seventh-degree polynomial is the right choice. |

## The data-handling decision that matters

The paper’s useful idea is to train on compact quantities extracted from response curves. **We should use that idea, but extract quantities that describe our requested band.**

For our proposed requirement, “absorption at least X throughout [A,B]”, the relevant quantity is the **minimum sampled absorption inside the band**, rather than the largest peak.

Example: absorption values `[0.90, 0.92, 0.55]` have a peak of 0.92, but fail a throughout-band requirement of 0.75. This is why the paper’s exact peak extraction would be unsuitable.

The incoming CSV format can stay as described in the examples. What still needs deciding is how those curves become training labels when several designs satisfy the same request. Use one consistent selection rule. That is a consequence of our inverse formulation, not a reason to change the received data format.

## What I would change

1. **Keep the current inputs, output heads, scaling and dimension constraints.**
2. **Compare a simpler 256 → 128 → 64 dense network against the residual baseline**, using the same data and output heads. Treat it as an experiment, not an upgrade already justified by the paper.
3. **Use band-based labels rather than peak-only labels.** For the proposed throughout-band objective, evaluate the sampled minimum absorption.
4. **Keep related examples from the same geometry together in the split** when evaluating generalization to unseen geometries.

**Is their approach better? There is no evidence that it is better for our inverse-design task. Keep our formulation. Borrow the simpler network for comparison and adapt their curve-summary idea to the band objective.**

## Sources and limits

[Reference paper](../reference/reference_paper.pdf): preprocessing and model direction on pp. 42829–42830, selected network and training on pp. 42831–42832. Their network takes five inputs: four geometry parameters and wavelength. It predicts two peak amplitudes and two resonance angles. AutoKeras selects the architecture using mean squared error.

Current behavior: [implementation reference](../implementation.md), [model and data loader](../../src/inverse_design/core.py), and [training](../../src/inverse_design/training.py). Expected delivery: [geometry example](../../data/examples/geometries_50_each_integers.csv) and [HFSS example](../../data/examples/hfss_results_template.csv).

These recommendations compare the documented methods. No experiment has established which network performs better on the forthcoming data.
