"""Design flat absorption using only the ray final surrogate."""
from air_only.flat.optimize import run_case


def main():
    """Load the ray final model and ask only for the absorption request."""
    run_case('ray')


if __name__ == '__main__':
    main()
