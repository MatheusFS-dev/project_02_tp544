"""Infer a geometry using only the final baseline model."""
from air_only.final.workflow import interactive_infer


def main():
    """Ask for band and target, then print and save native geometry values."""
    interactive_infer('baseline')


if __name__ == '__main__':
    main()
