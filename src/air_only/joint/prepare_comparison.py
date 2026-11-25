"""Prepare the joint air + silica 70/15/15 comparison dataset."""
from air_only.joint.workflow import configuration, prepare, logging


def main():
    """Explicitly build or verify the joint comparison dataset."""
    config, _, extras = configuration('joint_comparison')
    with logging(config, 'prepare'):
        prepare(config, extras)


if __name__ == '__main__':
    main()
