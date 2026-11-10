"""Recover all RNG state used by the AutoKeras trainer."""
import random
import numpy as np
import torch


def random_state():
    """Capture all random generators used by the trainers."""
    return dict(python=random.getstate(), numpy=np.random.get_state(), torch=torch.get_rng_state(),
                cuda=torch.cuda.get_rng_state_all() if torch.cuda.is_available() else [])


def restore_random(state):
    """Restore random generators after model and optimizer construction.

    Args:
        state: Python, NumPy, PyTorch and optional CUDA generator states."""
    random.setstate(state['python'])
    np.random.set_state(state['numpy'])
    torch.set_rng_state(state['torch'])
    if state['cuda'] and torch.cuda.is_available():
        torch.cuda.set_rng_state_all(state['cuda'])
