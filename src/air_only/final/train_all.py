"""Train all four selected flat topologies independently on final data."""
from air_only.final.workflow import configuration, final_data, train_case, CASES
from tqdm import tqdm


def main():
    """Resume four final trainings without repeating architecture searches."""
    config, sources, _ = configuration()
    final_data(config)
    for case in tqdm(CASES, desc='Final model training', unit='model'):
        train_case(case, config, sources[case])
    print('All four final models are available under '+config.output, flush=True)


if __name__ == '__main__':
    main()
