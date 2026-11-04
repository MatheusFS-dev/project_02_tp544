"""Run the baseline: python3 -m inverse_design.baseline."""
import json
from pathlib import Path
from .training import load_config, train


def main():
    """Execute the independently resumable baseline."""
    config = load_config('baseline')
    print('Starting baseline training', flush=True)
    print(json.dumps(train(Path(config.output) / 'baseline', config), indent=2))


if __name__ == '__main__':
    main()
