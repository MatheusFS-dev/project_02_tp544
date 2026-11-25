"""Design a geometry and substrate using only the autokeras joint model."""
from air_only.joint.workflow import interactive_infer


def main():
    """Run interactive joint inference for the autokeras case."""
    interactive_infer('autokeras')


if __name__ == '__main__':
    main()
