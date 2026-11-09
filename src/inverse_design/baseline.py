"""Run the baseline: python3 src/inverse_design/baseline.py."""
import json
from pathlib import Path
from inverse_design.training import load_config, train


from inverse_design.run_logging import logged_runner


@logged_runner('baseline')
def main():
    """Execute the independently resumable baseline."""
    config = load_config('baseline')
    print('Starting baseline training', flush=True)
    print(json.dumps(train(Path(config.output) / 'baseline', config), indent=2))


if __name__ == '__main__':
    main()
