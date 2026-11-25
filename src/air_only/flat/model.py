"""Family-conditioned, power-conserving forward spectrum networks."""
import torch
from torch import nn
from air_only.shared.families import MASK


class SpectrumModel(nn.Module):
    """Predict T/R/A spectra from a family and seven normalized parameters."""

    def __init__(self, points, width=256, depth=3, dropout=.1, trunk='residual', substrates=1):
        """Initialize the forward surrogate.

        Args:
            points: Number of wavelength samples.
            width: Hidden layer width.
            depth: Number of hidden blocks.
            dropout: Training dropout probability.
            trunk: Either residual or plain hidden blocks.
            substrates: Number of substrate classes. One keeps the air-only 30-input network.
        """
        super().__init__()
        if trunk not in ('residual', 'plain'):
            raise ValueError('trunk must be residual or plain')
        if substrates < 1:
            raise ValueError('substrates must be positive')
        self.architecture = dict(points=points, width=width, depth=depth, dropout=dropout, trunk=trunk)
        if substrates > 1:
            self.architecture['substrates'] = substrates
        self.register_buffer('mask', torch.tensor(MASK))
        self.embedding = nn.Embedding(12, 16)
        self.input = nn.Sequential(nn.Linear(30+(substrates if substrates > 1 else 0), width), nn.SiLU())
        self.blocks = nn.ModuleList([
            nn.Sequential(nn.Linear(width, width), nn.LayerNorm(width), nn.SiLU(), nn.Dropout(dropout))
            for _ in range(depth)
        ])
        self.output = nn.Linear(width, points*3)

    def forward(self, families, parameters, substrates=None):
        """Predict spectra while ignoring inactive geometry coordinates.

        Args:
            families: Integer family indices with shape (batch,).
            parameters: Normalized coordinates with shape (batch, 7).
            substrates: Integer substrate indices, required only by multi-substrate models.

        Returns:
            Nonnegative (batch, wavelength, T/R/A) fractions summing to one.
        """
        mask = self.mask[families]
        features = [self.embedding(families), parameters*mask, mask]
        count = self.architecture.get('substrates', 1)
        if count > 1:
            if substrates is None:
                raise ValueError('multi-substrate model requires substrate indices')
            features.append(nn.functional.one_hot(substrates.long(), count).to(parameters.dtype))
        value = self.input(torch.cat(features, -1))
        for block in self.blocks:
            value = value+block(value) if self.architecture['trunk'] == 'residual' else block(value)
        return self.output(value).reshape(-1, self.architecture['points'], 3).softmax(-1)
