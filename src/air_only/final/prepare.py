"""Prepare every received spectrum for final 80/20 training."""
from air_only.final.workflow import configuration, prepare, logging


def main():
    """Explicitly prepare real data before starting any final training."""
    config, _, _ = configuration()
    with logging(config, 'prepare'):
        prepare(config)


if __name__ == '__main__':
    main()
