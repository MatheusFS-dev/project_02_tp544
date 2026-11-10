"""Analyze bandwidth effects using retained test data and existing HFSS spectra."""
import csv
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path

os.environ.setdefault('CUDA_VISIBLE_DEVICES', '0')
os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] = 'true'

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import torch
from tqdm import tqdm
from inverse_design.core import dataset, normalize
from inverse_design.families import MASK, SCALES
from inverse_design.training import load_model

ROOT = Path(__file__).resolve().parents[3]
OUTPUT = Path(__file__).resolve().parent
CASE = OUTPUT.name
RUN = ROOT / 'results' / CASE
MODEL = RUN if CASE == 'baseline' else RUN / 'winner'
RAW = ROOT / 'data/raw/treinar'
FRACTIONS = np.array([.1, .25, .5, .75, 1.])
plt.rcParams.update({'font.family': 'serif', 'font.size': 10,
                     'axes.spines.top': False, 'axes.spines.right': False,
                     'axes.linewidth': .6, 'savefig.dpi': 250})


def save_plot(figure, name):
    """Save and close an analysis figure.

    Args:
        figure: Matplotlib figure.
        name: Basename within this case directory.
    """
    for extension in ('png', 'pdf'):
        figure.savefig(OUTPUT / f'{name}.{extension}', bbox_inches='tight')
    plt.close(figure)


def summarize(selected, correct, error, dimensions, catalogue, truth):
    """Aggregate routing, active parameter error and catalogue feasibility.

    Args:
        selected: Boolean request selection.
        correct: Boolean family correctness per request.
        error: Sum of active true-family parameter errors per request.
        dimensions: Number of active parameters per request.
        catalogue: Best held-out catalogue worst absorption error per request.
        truth: Catalogue-label family index per request.

    Returns:
        JSON-compatible metrics with explicit counts and undefined empty values.
    """
    routed = selected & correct
    counts = np.bincount(truth[selected], minlength=12)
    recalls = [correct[selected & (truth == family)].mean() for family in range(12) if counts[family]]
    return dict(majority_family_share=float(counts.max()/counts.sum()) if selected.any() else None,
                supported_family_macro_recall=float(np.mean(recalls)) if recalls else None,
                label_family_counts=counts.tolist(), count=int(selected.sum()), correct_count=int(routed.sum()),
                accuracy=float(correct[selected].mean()) if selected.any() else None,
                routed_mae_nm=float(error[routed].sum()/dimensions[routed].sum()) if routed.any() else None,
                oracle_mae_nm=float(error[selected].sum()/dimensions[selected].sum()) if selected.any() else None,
                catalogue_median_worst_pp=float(np.median(catalogue[selected])*100) if selected.any() else None)


def main():
    """Execute full-test stratification and paired nested-band spectrum analyses."""
    print(f'{CASE}: loading retained checkpoint and test requests', flush=True)
    data = dataset(RUN / 'data.npz')
    indices = data['test']
    requests = data['x'][indices]
    widths = requests[:, 1]-requests[:, 0]
    model = load_model(MODEL)
    with torch.no_grad():
        logits, _, heads = model(torch.tensor(normalize(requests), device='cuda:0'))
    predicted = logits.argmax(-1).cpu().numpy()
    truth = data['geometry'][indices]
    correct = predicted == truth
    mask = MASK[truth]
    dimensions = mask.sum(-1)
    error = (np.abs(heads.cpu().numpy()[np.arange(len(indices)), truth]-data['coordinates'][indices])*SCALES*mask).sum(-1)
    retained = json.loads((OUTPUT / 'predictions.json').read_text())
    assert np.isclose(correct.mean(), retained['metrics']['geometry_accuracy'])
    assert hashlib.sha256((MODEL / 'best.ckpt').read_bytes()).hexdigest() == retained['checkpoint_sha256']
    preparation = json.loads((ROOT / 'data/processed/treinar_families_v2/preparation.json').read_text())
    original = np.load(ROOT / 'data/processed/treinar_families_v2/dataset.npz')
    for key in ('x', 'geometry', 'coordinates', 'test', 'source_ids'):
        assert np.array_equal(data[key], original[key]), f'Dataset provenance mismatch: {key}'
    source_ids = sorted(preparation['splits']['test']['source_ids'])
    spectra = []
    print(f'Loading {len(source_ids)} received test-catalogue spectra with source hash checks', flush=True)
    for source_id in tqdm(source_ids, desc='Catalogue spectra', unit='spectrum'):
        path = RAW / 'Espectros_TRA' / f'{source_id}.csv'
        assert hashlib.sha256(path.read_bytes()).hexdigest() == preparation['source_hashes'][path.name]
        values = np.genfromtxt(path, delimiter=',', names=True)
        if spectra:
            assert np.array_equal(grid, values['lambda_nm'])
        grid = values['lambda_nm']
        spectra.append(values['A'])
    spectra = np.array(spectra)
    positions = {source_id: i for i, source_id in enumerate(source_ids)}
    nested = np.empty((len(indices), len(FRACTIONS)))
    catalogue = np.empty(len(indices))
    print('Scoring nested bands against the complete held-out catalogue, fixed target per request', flush=True)
    for i, (low, high, target) in enumerate(tqdm(requests, desc='Paired catalogue bandwidth', unit='request')):
        a, b = np.searchsorted(grid, [low, high])
        assert grid[a] == low and grid[b] == high
        for j, fraction in enumerate(FRACTIONS):
            center = (low+high)/2
            left, right = center-(high-low)*fraction/2, center+(high-low)*fraction/2
            start, stop = np.searchsorted(grid, [left, right], side='right')
            peak = np.abs(spectra[:, start:stop]-target).max(-1, initial=0)
            for endpoint in (left, right):
                upper = int(np.clip(np.searchsorted(grid, endpoint, side='right'), 1, len(grid)-1))
                weight = (endpoint-grid[upper-1])/(grid[upper]-grid[upper-1])
                interpolated = spectra[:, upper-1]*(1-weight)+spectra[:, upper]*weight
                peak = np.maximum(peak, np.abs(interpolated-target))
            nested[i, j] = peak.min()
        reference = spectra[positions[str(data['source_ids'][indices[i]])], a:b+1]
        catalogue[i] = np.abs(reference-target).max()
    assert np.all(np.diff(nested, axis=1) >= -1e-12)
    assert np.allclose(nested[:, -1], catalogue, atol=1e-12, rtol=0)
    edges = np.quantile(widths, [0, .25, .5, .75, 1])
    bins = np.searchsorted(edges[1:-1], widths, side='right')
    targets = np.minimum((requests[:, 2]*4).astype(int), 3)
    bands = []
    cells = []
    for band in range(4):
        record = summarize(bins == band, correct, error, dimensions, catalogue, truth)
        record.update(width_min_nm=float(edges[band]), width_max_nm=float(edges[band+1]))
        bands.append(record)
        cells.append([summarize((bins == band) & (targets == target), correct, error, dimensions, catalogue, truth) for target in range(4)])
    rows = []
    for i, row in enumerate(indices):
        rows.append(dict(dataset_row=int(row), width_nm=float(widths[i]), center_nm=float(requests[i,:2].mean()),
                         target_absorption=float(requests[i,2]), labelled_family=f'F{truth[i]+1:02d}',
                         predicted_family=f'F{predicted[i]+1:02d}', family_correct=bool(correct[i]),
                         oracle_parameter_error_sum_nm=float(error[i]), active_parameters=int(dimensions[i]),
                         catalogue_worst_error_pp=float(catalogue[i]*100)))
    with (OUTPUT / 'bandwidth_requests.csv').open('w') as stream:
        writer = csv.DictWriter(stream, fieldnames=rows[0].keys())
        writer.writeheader()
        writer.writerows(rows)
    print('Scoring existing HFSS spectra on nested bands, fixed geometry, center and target', flush=True)
    physical = []
    for case in retained['cases']:
        key = case['case']
        spectrum = np.genfromtxt(OUTPUT/key/'spectrum.csv', delimiter=',', names=True)
        low, high, target = case['request']
        center = (low+high)/2
        scores = []
        for fraction in FRACTIONS:
            a, b = center-(high-low)*fraction/2, center+(high-low)*fraction/2
            points = np.r_[a, spectrum['lambda_nm'][(spectrum['lambda_nm']>a)&(spectrum['lambda_nm']<b)], b]
            values = np.interp(points, spectrum['lambda_nm'], spectrum['A'])
            scores.append(float(np.abs(values-target).max()))
        assert np.all(np.diff(scores)>=-1e-12)
        physical.append(dict(case=key, full_width_nm=high-low, target_absorption=target, worst_error_pp=(np.array(scores)*100).tolist()))
    result = dict(case=CASE, checkpoint_sha256=retained['checkpoint_sha256'], dataset_sha256=retained['dataset_sha256'],
                  test_requests=len(indices), width_edges_nm=edges.tolist(), width_quartiles=bands,
                  target_edges=[0,.25,.5,.75,1], width_target_cells=cells,
                  fractions=FRACTIONS.tolist(), catalogue_nested_mean_worst_pp=(nested.mean(0)*100).tolist(),
                  catalogue_nested_median_worst_pp=(np.median(nested,axis=0)*100).tolist(),
                  catalogue_nested_fraction_within_5pp=(nested<=.05).mean(0).tolist(),
                  physical_nested=physical)
    (OUTPUT/'bandwidth_analysis.json').write_text(json.dumps(result,indent=2))
    print('Plotting bandwidth metrics, target stratification and paired physical effects', flush=True)
    labels = [f'{edge[0]:.0f}–{edge[1]:.0f}' for edge in zip(edges[:-1],edges[1:])]
    fig, axes = plt.subplots(1,3,figsize=(12,3.5))
    axes[0].bar(labels,[row['accuracy']*100 for row in bands],color='#53758c')
    axes[0].plot(range(4),[row['majority_family_share']*100 for row in bands],color='#555555',linestyle='--',marker='o',label='Most common label share')
    axes[0].legend(frameon=False,fontsize=8)
    axes[0].set(ylabel='Family accuracy (%)',ylim=(0,100))
    axes[1].bar(labels,[row['routed_mae_nm'] for row in bands],color='#718c80')
    axes[1].set(ylabel='Parameter MAE, correct family (nm)')
    axes[2].bar(labels,[row['catalogue_median_worst_pp'] for row in bands],color='#9b8270')
    axes[2].set(ylabel='Median best catalogue target error (pp)')
    for ax in axes:
        ax.set_xlabel('Requested width quartile (nm)')
        ax.tick_params(axis='x',rotation=30)
    fig.tight_layout()
    save_plot(fig,'bandwidth_metrics')
    fig,axes=plt.subplots(1,2,figsize=(10,4))
    for ax, metric, title, limit in zip(axes,['accuracy','catalogue_median_worst_pp'],['Family accuracy (%)','Median best catalogue target error (pp)'],[100,100]):
        matrix=np.array([[cell[metric] for cell in row] for row in cells],dtype=float)
        if metric=='accuracy':
            matrix*=100
        image=ax.imshow(matrix,vmin=0,vmax=limit,cmap='Blues',aspect='auto')
        ax.set(xticks=range(4),xticklabels=['0–25','25–50','50–75','75–100'],yticks=range(4),yticklabels=labels,
               xlabel='Requested absorption (%)',ylabel='Width quartile (nm)',title=title)
        for i in range(4):
            for j in range(4):
                ax.text(j,i,f'{matrix[i,j]:.1f}\nn={cells[i][j]["count"]}',ha='center',va='center',fontsize=8,color='white' if matrix[i,j]>50 else 'black')
        fig.colorbar(image,ax=ax)
    fig.tight_layout()
    save_plot(fig,'bandwidth_target_strata')
    fig,axes=plt.subplots(1,2,figsize=(10,3.8))
    axes[0].plot(FRACTIONS*100,nested.mean(0)*100,marker='o',color='#53758c')
    axes[0].set(xlabel='Fraction of original band width (%)',ylabel='Mean best catalogue target error (pp)')
    for row in physical:
        axes[1].plot(FRACTIONS*row['full_width_nm'],row['worst_error_pp'],marker='o',label=row['case'])
    axes[1].set(xlabel='Nested band width (nm)',ylabel='HFSS worst target error (pp)')
    axes[1].legend(frameon=False,fontsize=8)
    fig.tight_layout()
    save_plot(fig,'bandwidth_nested')
    lines=[f'# {CASE.capitalize()} bandwidth analysis','',f'Date: {datetime.now().astimezone().isoformat(timespec="seconds")}','',
           'Analyzed all 1,156 retained test requests. Width means band end minus band start. Width quartile groups retain equal widths together, so counts can differ slightly. Parameter MAE uses active parameters only, among correct family predictions. Catalogue error is the best received test-catalogue spectrum error, not simulated model output.','',
           '| Width (nm) | Requests | Family accuracy | Majority-label share | Correct-family MAE (nm) | Median best catalogue error (pp) |',
           '|---|---:|---:|---:|---:|---:|']
    for label,row in zip(labels,bands):
        lines.append(f'| {label} | {row["count"]} | {row["accuracy"]:.2%} | {row["majority_family_share"]:.2%} | {row["routed_mae_nm"]:.2f} | {row["catalogue_median_worst_pp"]:.2f} |')
    lines+=['','![Width groups](bandwidth_metrics.png)','','![Width and absorption level](bandwidth_target_strata.png)','',
            'The two-dimensional plot separates requested absorption into four levels, with counts shown. These are descriptive associations. Band center, family mix and parameter difficulty also differ between groups, so wider-band classification accuracy does not measure physical feasibility.','',
            'A paired catalogue check shrank each original test band to 10%, 25%, 50%, 75% and 100% of its wavelength span, keeping the exact wavelength center and target fixed. Spectrum endpoints were linearly interpolated. Each band was optimized over all received test-partition spectra. Across nested bands, the best achievable catalogue worst error cannot decrease with width. Mean best error rose from '+f'{nested[:,0].mean()*100:.2f} to {nested[:,-1].mean()*100:.2f} pp'+'. This is catalogue-limited evidence, not a bound over all possible geometries. No model was evaluated on synthetic relabeled requests.','',
            'For each of the five existing HFSS spectra, the nested-band check kept geometry, band center and absorption target fixed. The error curves use the already solved spectra, with linear endpoint interpolation. No new solver run or retraining was performed. Five diversity-selected cases do not estimate physical accuracy over the entire test split.','',
            '![Paired bandwidth checks](bandwidth_nested.png)','',
            'A wider nested band adds constraints, so its worst absolute target error cannot improve for a fixed geometry. Higher absorption targets can still dominate the difficulty, even on narrow bands. This monotonic statement applies to worst error, not necessarily wavelength-averaged error.','',
            'Detailed numbers: [bandwidth_analysis.json](bandwidth_analysis.json). All test-request diagnostics: [bandwidth_requests.csv](bandwidth_requests.csv). Source hashes, retained arrays and the full-band catalogue optimum were checked. No predicted geometry was replaced by a nearby catalogue geometry.','']
    lines += ['| HFSS case | Full width (nm) | Target A | Worst error at 10% width (pp) | Worst error at full width (pp) |', '|---|---:|---:|---:|---:|']
    for row in physical:
        lines.append(f'| {row["case"]} | {row["full_width_nm"]:.1f} | {row["target_absorption"]:.2%} | {row["worst_error_pp"][0]:.2f} | {row["worst_error_pp"][-1]:.2f} |')
    lines += ['', f'Family accuracy changes from {bands[0]["accuracy"]:.2%} in the narrowest group to {bands[-1]["accuracy"]:.2%} in the widest, while median best catalogue target error rises from {bands[0]["catalogue_median_worst_pp"]:.2f} to {bands[-1]["catalogue_median_worst_pp"]:.2f} pp. Broad-band label prediction is easier here despite worse physical target matching. The majority-label shares and absorption strata help interpret this distinction.', '']
    (OUTPUT/'bandwidth_analysis.md').write_text('\n'.join(lines))
    print(json.dumps(dict(case=CASE,width_quartiles=bands,catalogue_nested_mean_worst_pp=result['catalogue_nested_mean_worst_pp']),indent=2),flush=True)


if __name__ == '__main__':
    main()
