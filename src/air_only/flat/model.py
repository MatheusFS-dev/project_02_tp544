"""Family-conditioned, power-conserving forward spectrum networks."""
import torch
from torch import nn
from air_only.shared.families import MASK


class SpectrumModel(nn.Module):
    """Predict T/R/A spectra from a family and seven normalized parameters."""

    def __init__(self, points, width=256, depth=3, dropout=.1, trunk='residual'):
        """Initialize the forward surrogate.

        Args:
            points: Number of wavelength samples.
            width: Hidden layer width.
            depth: Number of hidden blocks.
            dropout: Training dropout probability.
            trunk: Either residual or plain hidden blocks.
        """
        super().__init__()
        if trunk not in ('residual', 'plain'):
            raise ValueError('trunk must be residual or plain')
        self.architecture = dict(points=points, width=width, depth=depth, dropout=dropout, trunk=trunk)
        self.register_buffer('mask', torch.tensor(MASK))
        self.embedding = nn.Embedding(12, 16)
        self.input = nn.Sequential(nn.Linear(30, width), nn.SiLU())
        self.blocks = nn.ModuleList([
            nn.Sequential(nn.Linear(width, width), nn.LayerNorm(width), nn.SiLU(), nn.Dropout(dropout))
            for _ in range(depth)
        ])
        self.output = nn.Linear(width, points*3)

    def forward(self, families, parameters):
        """Predict spectra while ignoring inactive geometry coordinates.

        Args:
            families: Integer family indices with shape (batch,).
            parameters: Normalized coordinates with shape (batch, 7).

        Returns:
            Nonnegative (batch, wavelength, T/R/A) fractions summing to one.
        """
        mask = self.mask[families]
        value = self.input(torch.cat((self.embedding(families), parameters*mask, mask), -1))
        for block in self.blocks:
            value = value+block(value) if self.architecture['trunk'] == 'residual' else block(value)
        return self.output(value).reshape(-1, self.architecture['points'], 3).softmax(-1)
