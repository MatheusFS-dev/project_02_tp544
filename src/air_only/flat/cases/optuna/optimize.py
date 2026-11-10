"""Design flat absorption using only the optuna final surrogate."""
from air_only.flat.optimize import run_case


def main():
    """Load the optuna final model and ask only for the absorption request."""
    run_case('optuna')


if __name__ == '__main__':
    main()
