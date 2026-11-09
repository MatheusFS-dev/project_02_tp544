# Proposed inverse-design architecture

## Problem

The proposed model receives a wavelength interval and a desired constant
absorption level. It predicts a gold geometry family, the dimensions needed to
construct that geometry, and its substrate.

The goal is absorption as close as possible to the requested level throughout
the interval. The objective minimizes the largest absolute deviation, considering
both values above and below the target. Matching only the average absorption
would not guarantee a flat response.

Inputs cover wavelengths from 450 to 1,600 nanometers and absorption levels from
zero to one. Normalizing these inputs provides a common scale for learning.

## Dataset and supervision

The source data consist of geometry descriptions paired with simulated optical
spectra. Each spectrum contains wavelength-dependent transmission, reflection
and absorption. Geometry descriptions identify the family and its active
physical dimensions.

The physical setup uses gold structures in a periodic cell, with fixed thickness
and illumination conditions. The available simulations describe air. Supporting
other substrates requires corresponding simulation data.

Training examples are desired wavelength intervals and absorption levels. Their
labels are selected from the simulated catalogue by minimizing the worst
in-band absorption error. Ties are resolved by the wavelength-averaged absolute
error and a stable design identifier. Requested targets can be unattainable.
The selected label is the best available catalogue candidate, not proof that
the requested response is achievable.

Before constructing labels, unique geometries are partitioned by family into
approximately 70% training, 15% validation and 15% testing. Repeated versions
of the same design stay together. Each partition uses only its own catalogue
when selecting labels, preventing geometry leakage between partitions.
Stratification preserves source-family coverage but does not force every family
to win the same number of requests.

## Geometry options

All dimensions use nanometers. Circular dimensions are radii, while square
dimensions are side lengths. Each family determines which parameters apply.

| Family | Geometry | Expert outputs |
| --- | --- | --- |
| F01 | Disk | R_d |
| F02 | Square | L_s |
| F03 | Circular ring | Rout_c, w_c |
| F04 | Square ring | Lout_q, w_q |
| F05 | Square ring + circular ring | Lout_q, w_q, Rout_c, w_c |
| F06 | F05 + tracks | Lout_q, w_q, Rout_c, w_c, w_t |
| F07 | Square ring + disk | Lout_q, w_q, R_d |
| F08 | F07 + tracks | Lout_q, w_q, R_d, w_t |
| F09 | Square ring + square | Lout_q, w_q, L_s |
| F10 | F09 + tracks | Lout_q, w_q, L_s, w_t |
| F11 | Circular ring + disk | Rout_c, w_c, R_d |
| F12 | F11 + tracks | Rout_c, w_c, R_d, w_t |

`Lout_q` is the square ring's outer side, `w_q` its wall width, `Rout_c` the
circular ring's outer radius, `w_c` its wall width, `R_d` the disk radius,
`L_s` the solid square's side, and `w_t` the track width. Four connecting tracks
are determined by F06/F08/F10/F12. Their positions and lengths are determined by the component dimensions.
There is no separate track classification task.

## Shared backbone and specialized heads

A shared neural-network backbone processes the wavelength interval and target
absorption. It learns a representation used by three output branches:

- A family classifier assigns probabilities to F01 through F12.
- A substrate classifier assigns probabilities to the supported substrates.
- Twelve small parameter heads specialize in the dimensions of their
  respective families.

The proposed backbone uses a feature projection followed by residual blocks.
Residual connections allow successive blocks to refine the shared representation.
Each parameter head contains a small hidden layer and a bounded output layer,
with one output for each active dimension of that family.

This structure combines shared learning with specialization. Related families
can benefit from common features without requiring a separate complete network
for every family. Heads for simple geometries predict fewer dimensions than
heads for composite geometries.

## Training and routing

During training, the known family label selects the parameter head used for
regression. Only that head receives the sample's parameter-regression signal,
while the shared backbone learns across all families.

The training objective combines family classification, substrate classification
and Huber regression loss. Regression is averaged over the active dimensions
of each sample, so families with more parameters do not automatically receive
more weight. Inactive dimensions do not contribute to regression loss.

During inference, the predicted family selects its parameter head. A wrong
family prediction can therefore affect both the selected geometry and its
parameter estimates. Evaluation should distinguish classification errors from
parameter errors when the correct family is supplied.

## Outputs and physical interpretation

The proposed output includes the selected family and its probabilities, the
substrate and its probabilities, and the family's named dimensions in
nanometers. Parameters belonging to other families are marked as not applicable.
The presence of connecting tracks follows from the selected family.

These predictions describe a candidate geometry. Bounded dimensions do not
alone guarantee valid construction, manufacturability or the desired optical
response. The substrate branch also requires representative training data for
each substrate it is expected to predict.

Optical verification requires a spectrum corresponding to the predicted
geometry. An exact match to a simulated catalogue entry can use that entry's
spectrum. A newly predicted geometry requires independent simulation rather
than substitution of a nearby design's response.
