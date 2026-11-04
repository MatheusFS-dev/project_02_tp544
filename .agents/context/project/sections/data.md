# Data and simulation budget

Source-derived from both data/examples CSVs and docs/reference/Dataset_Geometry_and_14_Day_Steps.pdf pp. 1–2.

geometries_50_each_integers.csv: 200 rows, 50 per family (circular_disk, square, circular_ring, square_ring). Columns geometry_id, geometry_type, outer_dimension_nm, inner_dimension_nm. IDs G0001…G0200. Integer dimensions are examples, not validated simulated designs.

hfss_results_template.csv: 92,400 rows, 400 geometry/environment combinations, air and SiO2 each 46,200 rows. Columns simulation_id, geometry_id, substrate, wavelength_nm,T,R,A. 231 wavelengths from 450 to 1600 nm inclusive at 5 nm. All T/R/A cells are empty, verified during ingestion. This is a template, not physical evidence or a training-ready dataset.

Grid document: four Au families, full 0–320 nm with no imposed minimum. Solids 0≤D≤320, rings 0≤inner≤outer≤320. Uniform n-value grid Δ=320/(n−1). Each solid has n settings, each ring n(n+1)/2, total n(n+3). Boundary settings include zero sizes and equal inner/outer and may be physically redundant.

Budget assumption, not measured runtime: one sequential HFSS worker, 75 min/case, 80% effective availability, two cases per geometry. For n=5,6,7,8,9,10,11,17,33, geometry totals are 40,54,70,88,108,130,154,340,1188 and day estimates 5.21,7.03,9.11,11.46,14.06,16.93,20.05,44.27,154.69. Recommended n=8 gives Δ≈45.71 nm and 176 results in 11.46 days, leaving 2.54 days buffer. One case permits n=13, Δ≈26.67 nm, 208 settings, 13.54 days. At two cases n=8 takes 9.17/11.46/13.75 days for 60/75/90 min per result. Confirm runtime before choosing campaign size. Counts are pre-deduplication.

These complete-grid counts differ from the 200-row CSV sampling and the technical model note's 80-geometry campaign. No implementation currently reconciles them.
