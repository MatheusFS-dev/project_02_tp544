"""Create an example dataset explicitly, independently of all training runners."""
from pathlib import Path
import numpy as np


def generate():
    """Generate the standalone fake example with fixed stratified splits.

    Returns:
        Arrays for 400 examples and disjoint 280/60/60 split indices.
    """
    rng = np.random.default_rng(42)
    rows, geometry, substrate, coordinates = [], [], [], []
    splits = {k: [] for k in ('train', 'validation', 'test')}
    for g in range(4):
        for s in range(2):
            start = len(rows)
            for _ in range(50):
                u = (g + rng.uniform(.08, .92)) / 4
                v = rng.uniform(.08, .92)
                x = (s + rng.uniform(.08, .92)) / 2
                a = 450 + 650 * u
                b = a + 100 + (1500 - a - 100) * v
                rows.append([a, b, x])
                geometry.append(g)
                substrate.append(s)
                coordinates.append([.15 + .65 * (b - 450) / 1150 + .15 * x, 0 if g < 2 else .1 + .7 * u])
            indices = rng.permutation(np.arange(start, start + 50))
            # Alternate 7/8 validation samples per stratum, preserving 60 total.
            nval = 7 + ((g * 2 + s) % 2)
            splits['train'].extend(indices[:35])
            splits['validation'].extend(indices[35:35+nval])
            splits['test'].extend(indices[35+nval:])
    return dict(x=np.array(rows, np.float32), geometry=np.array(geometry),
                substrate=np.array(substrate), coordinates=np.array(coordinates, np.float32),
                **{k: np.array(v) for k, v in splits.items()})


if __name__ == '__main__':
    destination = Path(__file__).with_name('example.npz')
    print('Generating fake example data', flush=True)
    arrays = generate()
    print(f'Saving fake example data to {destination}', flush=True)
    np.savez(destination, **arrays)
    print(f'Saved fake example data to {destination}')
