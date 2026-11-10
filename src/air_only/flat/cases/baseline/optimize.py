"""Design flat absorption using only the baseline final surrogate."""
from air_only.flat.optimize import run_case


def main():
    """Load the baseline final model and ask only for the absorption request."""
    run_case('baseline')


if __name__ == '__main__':
    main()
