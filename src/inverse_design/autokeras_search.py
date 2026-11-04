"""Independent AutoKeras AutoModel search using the PyTorch Keras backend."""
import json
from pathlib import Path
from .training import load_config, device_for, prepare
from .search import export_winner
from . import storage


def run(config):
    """Resume a retained tuner project and export its selected candidate.

    Args:
        config: Shared training, device, output and search-budget settings.

    Returns:
        Selected winner architecture, validation loss and held-out metrics."""
    import os
    os.environ['KERAS_BACKEND'] = 'torch'
    from .autokeras_adapter import make_automodel, search
    import keras
    print(f'Starting AutoKeras search: {config.candidates} candidates', flush=True)
    with storage.ownership(Path(config.output) / 'autokeras') as root:
        prepare(root, config)
        if (root / 'complete.json').exists():
            return json.loads((root / 'complete.json').read_text())
        with keras.device(str(device_for(config))):
            auto = make_automodel(root, config)
            search(auto)
        best = auto.tuner.oracle.get_best_trials(1)[0]
        candidate = root / f'trial-{best.trial_id}'
        print('Exporting AutoKeras winner', flush=True)
        return export_winner(root, candidate, config, best.score, best.trial_id, extra_artifacts=('best.keras',))


def main():
    """Execute the AutoKeras module entry point."""
    print(json.dumps(run(load_config('autokeras')), indent=2))


if __name__ == '__main__':
    main()
