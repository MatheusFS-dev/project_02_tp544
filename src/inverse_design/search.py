"""Search-space and winner export helpers without optional framework imports."""
from dataclasses import asdict
from pathlib import Path
import torch
from .core import dataset, metrics, normalize
from .training import device_for, load_model
from . import storage


def export_winner(directory, candidate, config, validation_loss, identity, extra_artifacts=()):
    """Export the selected candidate and evaluate the held-out test set once.

    Args:
        directory: Owned search root whose completion marker is published last.
        candidate: Candidate directory containing its best checkpoint.
        config: Settings to export with the selected architecture.
        validation_loss: Winning validation objective.
        identity: Framework-specific winning trial identity.
        extra_artifacts: Additional candidate filenames to copy atomically.

    Returns:
        JSON-compatible winner identity, architecture and held-out metrics."""
    directory, candidate = Path(directory), Path(candidate)
    winner = directory / 'winner'
    winner.mkdir(exist_ok=True)
    for name in ('best.ckpt', *extra_artifacts):
        storage.atomic(winner / name, (candidate / name).read_bytes())
    device = device_for(config)
    model = load_model(winner, device=device)
    data = dataset(config.data)
    with torch.no_grad():
        outputs = model(torch.tensor(normalize(data['x'][data['test']]), device=device))
    result = dict(identity=str(identity), best_validation_loss=float(validation_loss),
                  architecture=asdict(model.architecture),
                  test=metrics([t.cpu().numpy() for t in outputs], data, data['test']))
    storage.save_json(winner / 'architecture.json', asdict(model.architecture))
    storage.save_json(winner / 'config.json', asdict(config))
    storage.save_json(winner / 'metrics.json', result)
    storage.save_json(directory / 'complete.json', result)
    return result
