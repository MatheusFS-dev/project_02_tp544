"""Design a geometry and substrate using only the optuna joint model."""
from air_only.joint.workflow import interactive_infer


def main():
    """Run interactive joint inference for the optuna case."""
    interactive_infer('optuna')


if __name__ == '__main__':
    main()
