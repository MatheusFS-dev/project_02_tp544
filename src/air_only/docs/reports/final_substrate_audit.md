# Final-model substrate audit

Date: 2026-11-10T09:38:19-03:00

The initial requested substrate choices were air and SiO₂. The existing flat models cannot make this choice: they have no substrate input, and geometry optimization explicitly returns air. After reviewing the air-only data, the user explicitly approved an air-only final implementation. The dual-substrate requirements below describe the deferred extension, not the scope of `src/air_only/final/`.

## Received evidence

The received HFSS generator sets `CASO = "A"`. Its geometry constructor returns an air domain and no substrate. `H_SUB = 1.000` µm is declared but never used by that constructor. The two received projects contain gold and vacuum geometry materials, with no SiO₂ material or substrate keyword. The original geometry and spectrum tables do not identify substrates. No verified SiO₂ spectra were found in the received Treinar catalogue.

- `Amostras_simuladas_10_por_familia.aedt`: materials "", "Au_JC", "vacuum". SHA-256: `843daeed0bf128f6a3396e7551d11e185b0172ebb176eefaa8b4a1d119a1d1e4`.
- `Geometrias_Trabalho3.aedt`: materials "", "Au_JC", "vacuum". SHA-256: `bff34ac9fe1ec48cbbd2b14ce315107aef4c0256c7ebd9a6282b127a51ad6be5`.

## Required final workflow

- Preserve the four selected flat architectures and previous results. Retrain from scratch on new substrate-aware data, without another architecture search.
- Use every received geometry and real spectra for both substrates. Preserve duplicate-source provenance. Require both substrates in every geometry family before training.
- Split geometry groups into approximately 80% training and 20% validation, stratified by family. Keep both substrate variants of a geometry in the same partition. Do not create a test partition.
- Include substrate as an explicit model input. Inference optimizes the 12 families for both substrates and ranks the resulting 24 combinations by worst in-band absorption error, then mean error.
- Provide one resumable training runner for all four final models and one interactive inference runner per model. Print geometry dimensions in nm, family, tracks and selected substrate as plain text. Predicted absorption remains separate from HFSS verification.
- The HFSS runner changes geometry and the selected substrate while retaining the original periodic cell, gold dispersion, illumination and sweep. SiO₂ requires a physically defined substrate domain and appropriate lower Floquet port.

## Missing physical input

The SiO₂ thickness and optical material/dispersion definition must be confirmed, or supplied by an existing SiO₂ project. Then genuine SiO₂ spectra can be imported or generated. Air spectra must never be relabeled as SiO₂, and missing spectra must never be replaced with fabricated values. No final model has been retrained by this audit.
