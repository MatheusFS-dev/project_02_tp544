"""Train the fixed forward-spectrum baseline."""
from flat.common import load_config, logging
from pathlib import Path
import json
from flat.training import train, export_winner
from inverse_design import storage


def run(config):
    """Train and export the baseline's independent final model.

    Args:
        config: Complete baseline settings.

    Returns:
        Baseline final-model spectrum metrics.
    """
    with storage.ownership(Path(config.output)/'baseline') as root:
        train(root/'training', config)
        return export_winner(root, root/'training', config, 'baseline')


def main():
    """Train or resume the baseline using flat_baseline.toml."""
    config = load_config('baseline')
    with logging(config, 'train', case='baseline'):
        print(json.dumps(run(config), indent=2), flush=True)


if __name__ == '__main__':
    main()
