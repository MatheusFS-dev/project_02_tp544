"""Rebuild presentation plots from retained measurements and real predictions."""
import os
os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
os.environ.setdefault('CUDA_VISIBLE_DEVICES', '1')
os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] = 'true'

import json
import hashlib
from pathlib import Path
import sqlite3
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import torch
from air_only.flat.common import load_data
from air_only.flat.training import load_model
from air_only.shared import storage

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
ASSETS = ROOT/'docs/presentation/assets'
CASES = ('baseline', 'optuna', 'ray', 'autokeras')
COLORS = ('#52758b', '#9b6f58', '#73876b', '#897792')
plt.rcParams.update({'font.family': 'serif', 'font.size': 11, 'axes.spines.top': False,
                     'axes.spines.right': False, 'axes.linewidth': .6, 'legend.frameon': False})


def read(path):
    """Read a retained JSON artifact.

    Args:
        path: JSON file path.

    Returns:
        Decoded artifact.
    """
    return json.loads(Path(path).read_text())


def save(fig, name):
    """Save a vector plot with a tight bounding box.

    Args:
        fig: Matplotlib figure.
        name: Output basename.
    """
    ASSETS.mkdir(parents=True, exist_ok=True)
    fig.tight_layout()
    fig.savefig(ASSETS/f'{name}.pdf', bbox_inches='tight')
    plt.close(fig)


def training_plots():
    """Plot retained histories, search incumbents and held-out aggregate errors."""
    print('Plotting retained training, searches and test metrics', flush=True)
    fig, axes = plt.subplots(1, 2, figsize=(6.4, 2.3))
    for case, color in zip(CASES, COLORS):
        history = read(ROOT/f'results/flat/{case}/final/metrics.json')['history']
        for ax, key, title in zip(axes, ('train_loss', 'validation_loss'), ('Training', 'Validation')):
            ax.plot([r['epoch'] for r in history], [r[key] for r in history], label=case, color=color)
            ax.set(xlabel='Epoch', ylabel='Spectrum loss', title=title, yscale='log')
    axes[1].legend(ncol=2, fontsize=8, handlelength=1.2, columnspacing=.8)
    save(fig, 'training')
    fig, ax = plt.subplots(figsize=(6.4, 2.2))
    with sqlite3.connect(f'file:{ROOT}/results/flat/optuna/study.sqlite3?mode=ro', uri=True) as db:
        rows = db.execute("SELECT t.number,v.value FROM trials t JOIN trial_values v ON t.trial_id=v.trial_id WHERE t.state='COMPLETE' ORDER BY t.number").fetchall()
    ax.step([r[0]+1 for r in rows], np.minimum.accumulate([r[1] for r in rows]), where='post', label='Optuna (completed)', color=COLORS[1])
    for case, color, key in [('ray', COLORS[2], 'validation_loss'), ('autokeras', COLORS[3], 'score')]:
        rows = sorted(read(ROOT/f'results/flat/{case}/search_summary.json')['trials'], key=lambda r: int(r['trial_id'].split('_')[-1]))
        points = [(int(r['trial_id'].split('_')[-1])+1, r[key]) for r in rows if r.get(key) is not None]
        ax.step([r[0] for r in points], np.minimum.accumulate([r[1] for r in points]), where='post', label=case, color=color)
    ax.set(xlabel='Candidate number (recorded order)', ylabel='Best validation loss')
    ax.legend(fontsize=9)
    save(fig, 'search')
    metrics = [read(ROOT/f'validation/flat/{c}/spectrum_metrics.json') for c in CASES]
    fig, axes = plt.subplots(1, 3, figsize=(9, 2.8))
    for ax, key, title in zip(axes, ('absorption_mae_pp', 'mean_worst_spectrum_error_pp', 'p95_worst_spectrum_error_pp'), ('Absorption MAE', 'Mean maximum error', 'P95 maximum error')):
        ax.bar(range(4), [m['test'][key] for m in metrics], color=COLORS)
        ax.set(xticks=range(4), xticklabels=['Base', 'Optuna', 'Ray', 'AutoK'], ylabel='Error (pp)', title=title)
    save(fig, 'test')
    fig, ax = plt.subplots(figsize=(6.4, 2.4))
    for case, color, metric in zip(CASES, COLORS, metrics):
        ax.plot(range(1,13), [metric['per_family'][f'F{i:02d}']['absorption_mae_pp'] for i in range(1,13)], marker='o', markersize=3, color=color, label=case)
    ax.set(xticks=range(1,13), xticklabels=[f'F{i:02d}' for i in range(1,13)], ylabel='Absorption MAE (pp)')
    ax.legend(ncol=4, fontsize=9, loc='upper center', bbox_to_anchor=(.5, 1.22))
    save(fig, 'families_error')


def held_out():
    """Select best, median and P95 examples by baseline maximum absorption error."""
    print('Predicting all 289 baseline test rows for fixed quantile examples', flush=True)
    data, metadata = load_data(ROOT/'results/flat/baseline/dataset.npz')
    rows = data['test']
    model = load_model(ROOT/'results/flat/baseline/final')
    with torch.no_grad():
        prediction = model(torch.as_tensor(data['family'][rows], device='cuda:0'), torch.as_tensor(data['parameters'][rows], device='cuda:0')).cpu().numpy()
    errors = np.abs(prediction[:,:,2]-data['tra'][rows,:,2]).max(1)
    order = np.argsort(errors, kind='stable')
    positions = [int(order[round(q*(len(rows)-1))]) for q in (0, .5, .95)]
    fig, axes = plt.subplots(2, 3, figsize=(7.2, 4.4))
    selected = []
    for column, (position, label) in enumerate(zip(positions, ('Best', 'Median', 'P95'))):
        row = rows[position]
        peak = int(np.argmax(np.abs(prediction[position,:,2]-data['tra'][row,:,2])))
        wave = data['wavelengths']
        for ax in axes[:,column]:
            for channel, (name, color) in enumerate(zip(('T','R','A'), COLORS)):
                ax.plot(wave, 100*data['tra'][row,:,channel], color=color, label=f'{name} HFSS')
                ax.plot(wave, 100*prediction[position,:,channel], '--', color=color, label=f'{name} predicted')
            ax.set(xlabel='Wavelength (nm)', ylabel='Power (%)')
        axes[0,column].set_title(f'{label}: F{data["family"][row]+1:02d}', fontsize=10)
        axes[1,column].set_xlim(max(wave[0],wave[peak]-40), min(wave[-1],wave[peak]+40))
        selected.append(dict(quantile=label, original_row=int(row), source_id=str(data['source_ids'][row]), worst_error_pp=float(errors[position]*100), zoom_center_nm=float(wave[peak])))
    fig.legend(*axes[0,0].get_legend_handles_labels(), loc='upper center', bbox_to_anchor=(.5, 1.10), ncol=3, fontsize=9)
    save(fig, 'held_out')
    storage.save_json(HERE/'held_out_selection.json', dict(case='baseline', ranking='maximum absorption error, stable nearest rank', dataset_sha256=metadata['dataset_sha256'], checkpoint_sha256=hashlib.sha256((ROOT/'results/flat/baseline/final/best.ckpt').read_bytes()).hexdigest(), examples=selected))


def physical():
    """Plot verified HFSS errors and full/zoomed spectra for good and hard cases."""
    print('Plotting actual HFSS verification for five fixed requests', flush=True)
    fig, ax = plt.subplots(figsize=(6.4, 2.5))
    for offset, (case, color, label) in enumerate(zip(('baseline','optuna','autokeras'), (COLORS[0],COLORS[1],COLORS[3]), ('Baseline','Optuna = Ray','AutoKeras'))):
        summaries = [read(ROOT/f'validation/final/{case}/example_{i:02d}/summary.json') for i in range(1,6)]
        ax.bar(np.arange(5)+(offset-1)*.24, [s['worst_error_pp'] for s in summaries], width=.23, label=label, color=color)
    ax.axhline(5, color='gray', linestyle='--', linewidth=.8, label='5 pp tolerance')
    ax.set(xticks=range(5), xticklabels=[f'Example {i}' for i in range(1,6)], ylabel='Worst HFSS error (pp)')
    ax.legend(fontsize=9, ncol=4, loc='upper center', bbox_to_anchor=(.5, 1.25), columnspacing=.9, handlelength=1.4)
    save(fig, 'hfss_errors')
    fig, axes = plt.subplots(2, 2, figsize=(7.0, 4.4))
    for column, (case, example) in enumerate((('optuna',1),('baseline',3))):
        folder = ROOT/f'validation/final/{case}/example_{example:02d}'
        summary = read(folder/'summary.json')
        actual = np.genfromtxt(summary['solver']['spectrum'], delimiter=',', names=True)
        predicted = np.genfromtxt(folder/f'design/{summary["family"]}_predicted.csv', delimiter=',', names=True)
        for ax in axes[:,column]:
            for name, color in zip(('T','R','A'), COLORS):
                ax.plot(actual['lambda_nm'], 100*actual[name], color=color, label=f'{name} HFSS')
                ax.plot(predicted[predicted.dtype.names[0]], 100*predicted[name], '--', color=color, label=f'{name} predicted')
            low, high = summary['band_start_nm'], summary['band_end_nm']
            target = summary['target_absorption_percent']
            ax.fill_between([low,high], target-5,target+5,color='gray',alpha=.18)
            ax.plot([low,high],[target,target],color='black',linewidth=.8)
            ax.set(xlabel='Wavelength (nm)', ylabel='Power (%)')
        axes[0,column].set_title(f'{case}, example {example}: {summary["worst_error_pp"]:.2f} pp')
        axes[1,column].set_xlim(low,high)
        axes[1,column].set_ylim(max(0,target-10), min(100,max(target+10,summary['band_max_absorption_percent']+3)))
    fig.legend(*axes[0,0].get_legend_handles_labels(), loc='upper center', bbox_to_anchor=(.5, 1.10), ncol=3, fontsize=9)
    save(fig, 'hfss_spectra')


def all_physical_spectra():
    """Save full and band-zoom T/R/A plots for all twenty verified designs."""
    print('Replotting all 20 HFSS designs with target and tolerance', flush=True)
    for case in CASES:
        folder_out = HERE/'hfss'/case
        folder_out.mkdir(parents=True, exist_ok=True)
        for example in range(1, 6):
            folder = ROOT/f'validation/final/{case}/example_{example:02d}'
            summary = read(folder/'summary.json')
            actual = np.genfromtxt(summary['solver']['spectrum'], delimiter=',', names=True)
            prediction = np.genfromtxt(folder/f'design/{summary["family"]}_predicted.csv', delimiter=',', names=True)
            fig, axes = plt.subplots(1, 2, figsize=(9, 3))
            low, high, target = summary['band_start_nm'], summary['band_end_nm'], summary['target_absorption_percent']
            for ax in axes:
                for name, color in zip(('T', 'R', 'A'), COLORS):
                    ax.plot(actual['lambda_nm'], actual[name]*100, color=color, label=f'{name} HFSS')
                    ax.plot(prediction[prediction.dtype.names[0]], prediction[name]*100, '--', color=color, label=f'{name} predicted')
                ax.fill_between([low, high], target-5, target+5, color='gray', alpha=.18)
                ax.plot([low, high], [target, target], color='black', linewidth=.8)
                ax.set(xlabel='Wavelength (nm)', ylabel='Power (%)')
            axes[0].set_title(f'{case}, example {example}: {summary["family"]}')
            axes[1].set(xlim=(low, high), title=f'Worst HFSS error: {summary["worst_error_pp"]:.2f} pp')
            fig.legend(*axes[0].get_legend_handles_labels(), loc='upper center', bbox_to_anchor=(.5, 1.08), ncol=6, fontsize=8)
            fig.tight_layout()
            fig.savefig(folder_out/f'example_{example:02d}.pdf', bbox_inches='tight')
            plt.close(fig)


def learning_curve():
    """Plot measured means and sample deviations over three seeds only when complete."""
    artifact = read(HERE/'learning_curve.json')
    if len(artifact['results']) != 45:
        raise ValueError('learning curve is incomplete, refusing to plot partial results')
    fig, axes = plt.subplots(1, 2, figsize=(6.6, 2.7))
    for case, color, label in zip(('baseline','optuna','autokeras'), (COLORS[0],COLORS[1],COLORS[3]), ('Baseline','Optuna/Ray topology','AutoKeras topology')):
        for ax, key, title in zip(axes, ('absorption_mae_pp','mean_worst_spectrum_error_pp','p95_worst_spectrum_error_pp'), ('Absorption MAE','Mean maximum error','P95 maximum error')):
            groups = [[r for r in artifact['results'] if r['case']==case and r['fraction']==f] for f in (.1,.25,.5,.75,1.)]
            ax.errorbar([g[0]['train_count'] for g in groups], [np.mean([r['test'][key] for r in g]) for g in groups], yerr=[np.std([r['test'][key] for r in g],ddof=1) for g in groups], marker='o', markersize=3, capsize=2, color=color, label=label)
            ax.set(xlabel='Training geometries', ylabel='Error (pp)', title=title, xticks=[135,337,674,1011,1348])
            ax.axvline(1348, color='gray',linestyle=':',linewidth=.7)
    axes[0].legend(fontsize=8)
    save(fig,'learning_curve')


def main():
    """Regenerate all source-backed figures, including the completed learning curve."""
    training_plots()
    held_out()
    physical()
    all_physical_spectra()
    learning_curve()
    sources = list((ROOT/'results/flat').glob('*/final/metrics.json')) + list((ROOT/'validation/flat').glob('*/spectrum_metrics.json')) + list((ROOT/'validation/final').glob('*/example_*/summary.json'))
    for summary_path in (ROOT/'validation/final').glob('*/example_*/summary.json'):
        summary = read(summary_path)
        sources.extend([Path(summary['solver']['spectrum']), summary_path.parent/f'design/{summary["family"]}_predicted.csv'])
    sources += [HERE/'learning_curve.json', HERE/'held_out_selection.json', ROOT/'results/flat/optuna/study.sqlite3', ROOT/'results/flat/ray/search_summary.json', ROOT/'results/flat/autokeras/search_summary.json']
    storage.save_json(HERE/'plot_sources.json', {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources})
    print('All presentation plots saved', flush=True)


if __name__ == '__main__':
    main()
