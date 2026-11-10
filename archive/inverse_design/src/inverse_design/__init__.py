"""Synthetic inverse-design APIs with GPU configuration set before framework imports."""
import os

os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
os.environ.setdefault('CUDA_VISIBLE_DEVICES', '0')
os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] = 'true'
os.environ['CUBLAS_WORKSPACE_CONFIG'] = ':4096:8'

from .core import Architecture, Model, decode, normalize
from .training import Config, load_model, predict, train

__all__ = ['Architecture', 'Model', 'Config', 'decode', 'normalize', 'train', 'load_model', 'predict']
