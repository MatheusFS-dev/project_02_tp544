"""Infer a geometry using only the final ray model."""
from air_only.final.workflow import interactive_infer


def main():
    """Ask for band and target, then print and save native geometry values."""
    interactive_infer('ray')


if __name__ == '__main__':
    main()
