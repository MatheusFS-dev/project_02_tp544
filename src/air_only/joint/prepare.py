"""Prepare the joint air + silica dataset before any joint training."""
from air_only.joint.workflow import configuration, prepare, logging


def main():
    """Explicitly build or verify the joint dataset."""
    config, _, extras = configuration()
    with logging(config, 'prepare'):
        prepare(config, extras)


if __name__ == '__main__':
    main()
