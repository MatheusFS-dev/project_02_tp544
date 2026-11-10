"""Version-two family definitions and expert regression semantics."""
import numpy as np
import torch
from torch.nn import functional as F

NAMES = tuple(f'F{i:02d}' for i in range(1, 13))
PARAMETERS = ('Lout_q', 'w_q', 'Rout_c', 'w_c', 'R_d', 'L_s', 'w_t')
ACTIVE = ((4,), (5,), (2, 3), (0, 1), (0, 1, 2, 3), (0, 1, 2, 3, 6),
          (0, 1, 4), (0, 1, 4, 6), (0, 1, 5), (0, 1, 5, 6), (2, 3, 4), (2, 3, 4, 6))
SCALES = np.array([320, 160, 160, 160, 160, 320, 160], dtype=np.float32)
MASK = np.array([[int(j in active) for j in range(7)] for active in ACTIVE], dtype=np.float32)


def expert_loss(outputs, targets):
    """Compute classification and true-family routed parameter loss.

    Args:
        outputs: Family logits, substrate logits and padded expert predictions.
        targets: True family, substrate and normalized parameter tensors.

    Returns:
        Scalar cross-entropies plus per-sample active-parameter Huber loss.
    """
    family, substrate, coordinates = targets
    values = outputs[2][torch.arange(len(family), device=family.device), family]
    mask = torch.as_tensor(MASK, device=family.device)[family]
    regression = (F.huber_loss(values, coordinates, reduction='none') * mask).sum(-1) / mask.sum(-1)
    return F.cross_entropy(outputs[0], family) + F.cross_entropy(outputs[1], substrate) + regression.mean()


def decode_parameters(coordinates):
    """Convert normalized parameter rows to native nanometer units.

    Args:
        coordinates: Array ending in seven normalized parameter values.

    Returns:
        Native radii, side lengths and widths in nanometers.
    """
    return np.asarray(coordinates) * SCALES


def expert_metrics(outputs, data, indices):
    """Evaluate routing separately from true-family parameter regression.

    Args:
        outputs: NumPy family logits, substrate logits and expert arrays.
        data: Validated dataset dictionary.
        indices: Rows corresponding to outputs.

    Returns:
        Family accuracies and active-parameter errors in nanometers.
    """
    g, s, c = outputs
    truth = data['geometry'][indices]
    predicted = g.argmax(-1)
    rows = np.arange(len(truth))
    mask = MASK[truth]
    error = np.abs(decode_parameters(c[rows, truth]) - decode_parameters(data['coordinates'][indices]))
    correct = predicted == truth
    result = dict(geometry_accuracy=float(correct.mean()), substrate_accuracy=float((s.argmax(-1) == data['substrate'][indices]).mean()),
                  joint_accuracy=float((correct & (s.argmax(-1) == data['substrate'][indices])).mean()),
                  oracle_parameter_mae_nm=float((error * mask).sum() / mask.sum()),
                  correctly_routed_parameter_mae_nm=float((error[correct] * mask[correct]).sum() / mask[correct].sum()) if correct.any() else None)
    result['per_family_accuracy'] = {name: float(correct[truth == i].mean()) if (truth == i).any() else None for i, name in enumerate(NAMES)}
    return result
