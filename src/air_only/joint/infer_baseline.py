"""Design a geometry and substrate using only the baseline joint model."""
from air_only.joint.workflow import interactive_infer


def main():
    """Run interactive joint inference for the baseline case."""
    interactive_infer('baseline')


if __name__ == '__main__':
    main()
