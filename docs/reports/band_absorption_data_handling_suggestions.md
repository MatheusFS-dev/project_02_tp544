# Data handling for flat absorption near X

Date and timestamp: 2026-11-06T14:48:21-03:00

## How it is today

The model receives `[band start, band end, X]` and predicts geometry, substrate and outer/inner dimensions.

Training loads prepared NPZ examples, each with one target design. The incoming data will follow the geometry and wavelength-by-wavelength HFSS CSV examples. The conversion from those spectra to training labels is not implemented yet.

Evaluation currently measures geometry/substrate accuracy and dimension errors. It does not measure how flat or close to X the predicted absorption is across the band.

## How I recommend doing it

**Keep the CSV format, model inputs, architecture and output constraints. Select training labels according to closeness to a constant absorption of X across the entire requested band.**

For each request `[A,B,X]`:

1. Evaluate every catalogue design’s spectrum within `[A,B]`, requiring complete sampled coverage of the band.
2. Calculate `worst_error = max(abs(absorption − X))` over those wavelengths.
3. Select the design with the smallest worst error. Break ties using average absolute error, then a stable simulation ID.
4. Save its geometry, substrate and dimensions as the training label. Keep the scores and alternative designs in a companion table.

For example, at X = 0.75, `[0.74, 0.75, 0.76]` is preferable to `[0.90, 0.90, 0.90]`. The second curve is perfectly flat, but at the wrong level.

Use **worst error as the main physical evaluation metric**, with average absolute error and ripple as supporting metrics. If a success/failure decision is needed, define an allowed deviation from X. The best available design can still be a poor match.

Catalogue designs can be evaluated from their received spectra. Newly predicted dimensions require simulation or a validated forward model. Sampled performance does not guarantee the response between wavelength samples.

**Implement this label-selection rule first. Change the network only if evaluation shows it is necessary.** This applies target-matching and worst-case broadband objective principles discussed in [Su et al., SPINS, Section 2.4 and Appendix B.3](https://arxiv.org/html/1910.04829v2). The specific selection rule is a recommendation for this project and has not been tested on its forthcoming data.
