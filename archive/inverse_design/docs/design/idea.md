The network will automatically select both the substrate and geometry to achieve the requested absorption behavior.

## Updated model formulation

$$
\boxed{ [A,B,X]\xrightarrow{\text{Residual MLP}} [t,s,D_{\mathrm{out}},D_{\mathrm{in}}] }
$$

| Parameter               | Description                                                   |
| ----------------------- | ------------------------------------------------------------- |
| $A$                 | Starting wavelength (nm)                                      |
| $B$                 | Ending wavelength (nm)                                        |
| $X$                 | Desired constant absorption level                                    |
| $t$                 | Geometry type: disk, square, circular ring, square ring       |
| $s$                 | Substrate: air or SiO₂                                        |
| $D_{\mathrm{out}}$ | Outer diameter or side length (nm)                            |
| $D_{\mathrm{in}}$  | Inner diameter or side length (nm), zero for solid structures |

## Network architecture

One residual MLP with a shared feature extractor and three output heads.

Input: [A, B, X]

3 normalized values

Shared Residual MLP

3 residual blocks, 256 hidden units

Geometry

4 classes

Softmax

Substrate

2 classes

Softmax

Dimensions

2 values

Regression

The training loss combines geometry classification, substrate classification, and dimension regression:

$$
\mathcal L = \mathcal L_{\mathrm{geometry}} +\mathcal L_{\mathrm{substrate}} +\mathcal L_{\mathrm{dimensions}}
$$

The dimensions will be constrained to valid configurations within 0–320 nm.

## Important training decision

Because multiple geometries and substrates may satisfy the same absorption target, we need consistent supervised labels.

Evaluate the received HFSS spectra offline for each request [A,B,X]. Select
the geometry/substrate combination minimizing the largest absolute deviation
from X across sampled wavelengths in [A,B]. Break ties using average absolute
error and then a stable simulation ID. Train the existing inverse network on
that selected design, while retaining scored alternatives separately.

The goal is a response close to a horizontal line at X. Values above and
below X both count as error. A flat response at the wrong level is not the
preferred answer. The neural loss remains the sum of classification losses
and coordinate regression loss.
This approach also allows air and SiO₂ to compete fairly instead of assuming one substrate is preferable.

The main limitation remains that the initial 400 simulated configurations provide sparse coverage of the design space. We will need to evaluate the predicted geometries in HFSS to establish their actual accuracy.

The objective is absorption as flat and close to X as possible throughout
[A,B]. Report worst and average absolute target error and band ripple.
Sampled spectra do not certify behavior between wavelengths. Newly predicted
dimensions need their own physical evaluation.
