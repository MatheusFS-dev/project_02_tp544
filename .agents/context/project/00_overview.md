# Project context

Generated interpretation of local sources. Original document ingestion: 2026-11-03. Repository architecture refresh: 2026-11-09. Canonical root: `/media/matheus.f@local.inatel.br/ssd01/src/temp/project_02_tp544`. Git HEAD at refresh: `e50d270415be53dd55d1b880cde2913956fcaf6b`. Working tree was clean before this context refresh. Source documents remain authoritative. Read this overview, then 00_map.md, then only the relevant unit.

Scope: executable Python 3.12 inverse-design package, four runner TOMLs, tests, documentation, and previously ingested reference documents. PyTorch baseline plus independent Optuna, AutoKeras and Ray searches now exist. See sections/implementation.md for current behavior. Earlier sections describe source proposals and must not override executable code. Received HFSS spectra and explicit CSV preparation now exist. See the current architecture reference at root PROBLEM_ARCHITECTURE.md and sections/implementation.md. Architecture schema 2 supports all twelve received families with shared features and small expert heads. Older four-family source proposals below are historical. Synthetic examples do not establish physical performance.
Terminology: Au = gold, SiO2 = silica, HFSS = electromagnetic solver used in the design proposal, TM = p polarization, outer/inner dimensions are diameters for circles and side lengths for squares. A = absorption in spectra, but A/B in idea.md denote band endpoints.

Can answer: current architecture, runners, configuration, data validation, recovery, exports and validation commands, as well as assignment requirements and source-proposal conflicts. Cannot establish feasibility, achieved accuracy, runtime or which conflicting proposal has been approved. No external references were retrieved.

Material conflicts: professor asks at least two models, while the technical PDF mandates one. CSV examples contain 200 geometries / 400 environmental configurations, the technical note assumes 80 / 160 plus 8 checks, and the grid-planning PDF recommends 88 / 176. idea.md uses separate geometry/substrate heads, while the PDF combines them into eight classes. CSV wavelength spacing is 5 nm, versus the PDF's proposed 1 nm export. Do not silently resolve these differences. Some cited companion PDFs and problem.pdf are absent.

## Original document provenance

Hashes below describe the original ingestion, not a fresh verification of every document. Current implementation provenance is recorded in sections/implementation.md.

## Exact source provenance

- `.gitignore` SHA-256 `96b3be0556e8378f942f4611098dfaca1de40d201a95503effc4534b1f41508a`
- `AGENTS.md` SHA-256 `437f714e569209c08ebe94cd61b6131f31f18c81080bfa531c8480e24e3edf0f`
- `CLAUDE.md` SHA-256 `d631d88045f74623d568adfb4783b72e3d1b732330d749bc6c72e6648d4581d3`
- `data/examples/geometries_50_each_integers.csv` SHA-256 `f08455deac0f64dc4bcba35d51e63b69596e1c80cdc5352a91aea726e9009f46`
- `data/examples/hfss_results_template.csv` SHA-256 `de7ea66f6bc3f2958654c42da24f0840c67c4782eac008cef1ef9feec91be646`
- `docs/reference/Dataset_Geometry_and_14_Day_Steps.pdf` SHA-256 `fdc086867f43a3c7b2aa87424edb973d596f40496cea5e7fcc2908412aa1352b`
- `docs/reference/Single_Model_Inverse_Design_Full_320nm.pdf` SHA-256 `eaa5f42efefaf194a7565886a2ced8262f5923a9741b0a3a5b86a5b1c79c7f7c`
- `docs/reference/geometries/batende.pdf` SHA-256 `09370016e60eff18813c7318ebf1d6bfee2db4373b5733852853b83f885e64c1`
- `docs/reference/geometries/ivan.pdf` SHA-256 `958b9a84cb5f5967ce46144013e6372aefe7950f5aa7f137c90f591c71c6777f`
- `docs/reference/geometries/matheus.pdf` SHA-256 `c0b888b51705b5a78ffe06e58c571269d3556dd0cc2815f83d610fb7fe755e6f`
- `docs/reference/geometries/yaislin.pdf` SHA-256 `e2673b1b89c5cb94952c810cff2dc08208ab423e35803dee813b9dd5ba399937`
- `docs/design/idea.md` SHA-256 `40b9f46c53f1012073277f182bb6fc46e69394a83c38d7c144b04ab1a72605ae`
- `docs/design/professor_instructions.md` SHA-256 `13e747f402902c72cf0e24d688f4af48b948bff92ddfca820a458706578c9871`
