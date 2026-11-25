"""Design a geometry and substrate using only the ray joint model."""
from air_only.joint.workflow import interactive_infer


def main():
    """Run interactive joint inference for the ray case."""
    interactive_infer('ray')


if __name__ == '__main__':
    main()
