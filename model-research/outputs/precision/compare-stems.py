"""Compare paired, sample-aligned rendered stems. Requires numpy, ffmpeg, ffprobe.
Usage: python compare-stems.py pairs.json result-directory
Manifest: {"pairs":[{"stem":"vocals","reference":"original.wav","candidate":"candidate.wav"}]}
Paths resolve relative to the manifest. No resampling, alignment, or gain correction.
Numerical thresholds are provisional screening limits, never proof of inaudibility.
"""
import hashlib
import json
import math
from pathlib import Path
import subprocess
import sys
import numpy as np


def read(path):
    info = json.loads(subprocess.check_output(['ffprobe', '-v', 'error', '-select_streams', 'a:0',
        '-show_entries', 'stream=sample_rate,channels', '-of', 'json', str(path)]))['streams'][0]
    rate, channels = int(info['sample_rate']), int(info['channels'])
    raw = subprocess.check_output(['ffmpeg', '-v', 'error', '-i', str(path), '-map', '0:a:0',
        '-f', 'f64le', '-acodec', 'pcm_f64le', '-'])
    x = np.frombuffer(raw, dtype='<f8').reshape(-1, channels)
    if not len(x) or not np.isfinite(x).all():
        raise ValueError('Empty or nonfinite audio: ' + str(path))
    return rate, x


def db(value):
    return 10 * math.log10(max(float(value), 1e-30))


def measure(ref, candidate, rate):
    if ref.shape != candidate.shape:
        raise ValueError('Frame/channel mismatch; do not silently align or truncate')
    windows = []
    # Per-channel gates prevent one stereo channel masking damage to the other.
    for start in range(0, len(ref), rate):
        for channel in range(ref.shape[1]):
            a = ref[start:start + rate, channel]
            b = candidate[start:start + rate, channel]
            signal = float(np.mean(a * a)); error = float(np.mean((b-a)**2))
            peak_error = float(np.max(np.abs(b-a)))
            quiet = db(signal) < -60
            snr = db(signal) - db(error)
            # Quiet windows: absolute residual peak; active windows: relative error.
            failed = peak_error > 10**(-90/20) if quiet else snr < 40
            windows.append(dict(start_seconds=start/rate, channel=channel,
                reference_rms_dbfs=db(signal), error_rms_dbfs=db(error),
                error_peak_dbfs=20*math.log10(max(peak_error, 1e-15)),
                snr_db=snr, quiet=quiet, failed=failed))
    worst = sorted(windows, key=lambda w: (not w['failed'],
        -(w['error_peak_dbfs'] + 90) if w['quiet'] else w['snr_db'] - 40))
    return dict(exact=bool(np.array_equal(ref, candidate)),
        provisional_screen='FAIL' if any(w['failed'] for w in windows) else 'PASS_REQUIRES_LISTENING',
        max_absolute_error=float(np.max(np.abs(candidate-ref))),
        reference_peak=float(np.max(np.abs(ref))), candidate_peak=float(np.max(np.abs(candidate))),
        worst_windows=worst[:10], windows=windows)


def wav(path, x, rate):
    subprocess.run(['ffmpeg', '-v', 'error', '-y', '-f', 'f32le', '-ar', str(rate),
        '-ac', str(x.shape[1]), '-i', '-', '-c:a', 'pcm_f32le', str(path)],
        input=x.astype('<f4').tobytes(), check=True)


def main():
    manifest = Path(sys.argv[1]).resolve(); out = Path(sys.argv[2]).resolve()
    pairs = json.loads(manifest.read_text())['pairs']
    if not pairs: raise ValueError('No paired stems: quality evaluation BLOCKED')
    out.mkdir(parents=True, exist_ok=True)
    result = {'quality_verdict':'NOT_ESTABLISHED', 'alignment':'Caller must provide identical timeline and channel order; no correction applied',
        'thresholds':'Provisional: active reference >= -60 dBFS RMS needs >=40 dB SNR per one-second channel window; quieter windows need residual peak <= -90 dBFS. Listening still required.', 'pairs':[]}
    for i, pair in enumerate(pairs):
        a_path = (manifest.parent / pair['reference']).resolve()
        b_path = (manifest.parent / pair['candidate']).resolve()
        rate, a = read(a_path); other_rate, b = read(b_path)
        if rate != other_rate: raise ValueError('Sample rate mismatch')
        stats = measure(a, b, rate)
        start = max(0, int(stats['worst_windows'][0]['start_seconds']*rate)-rate)
        stop = min(len(a), start+3*rate)
        for label, values in [('reference', a), ('candidate', b), ('difference', b-a)]:
            wav(out / f'{i:02d}-{label}.wav', values[start:stop], rate)
        result['pairs'].append(dict(stem=pair['stem'], sample_rate=rate, frames=len(a),
            reference_sha256=hashlib.sha256(a_path.read_bytes()).hexdigest(),
            candidate_sha256=hashlib.sha256(b_path.read_bytes()).hexdigest(),
            clip_start_seconds=start/rate, **stats))
    result['provisional_screen'] = 'FAIL' if any(p['provisional_screen']=='FAIL' for p in result['pairs']) else 'PASS_REQUIRES_LISTENING'
    (out/'comparison.json').write_text(json.dumps(result, indent=2, allow_nan=False))
    print(result['provisional_screen'] + '; audio quality remains subject to listening and representative material')


if __name__ == '__main__':
    main()
