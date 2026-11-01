"""Synthetic educational vital-sign signal analysis; not original experimental data."""
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, sosfiltfilt

def estimate_rate(signal, fs, low, high):
    sos = butter(3, [low, high], btype='bandpass', fs=fs, output='sos')
    filtered = sosfiltfilt(sos, signal)
    freq = np.fft.rfftfreq(len(filtered), 1/fs)
    power = np.abs(np.fft.rfft(filtered * np.hanning(len(filtered)))) ** 2
    valid = (freq >= low) & (freq <= high)
    return float(freq[valid][np.argmax(power[valid])] * 60), filtered

def main():
    fs, duration = 20, 120
    t = np.arange(0, duration, 1/fs)
    rng = np.random.default_rng(42)
    displacement = 1.2*np.sin(2*np.pi*0.25*t) + 0.13*np.sin(2*np.pi*1.2*t) + rng.normal(0, .08, len(t))
    rr, respiration = estimate_rate(displacement, fs, .1, .5)
    hr, heartbeat = estimate_rate(displacement, fs, .8, 2.2)
    print(f'Synthetic demonstration: respiratory rate {rr:.1f} breaths/min; heart rate {hr:.1f} bpm')
    fig, axes = plt.subplots(3, 1, figsize=(11, 8), sharex=True)
    for ax, y, title in zip(axes, [displacement, respiration, heartbeat], ['Synthetic composite displacement', 'Respiration-band signal', 'Heartbeat-band signal']):
        ax.plot(t, y, linewidth=.8); ax.set_ylabel('Relative amplitude'); ax.set_title(title); ax.grid(alpha=.2)
    axes[-1].set_xlabel('Time (s)')
    fig.tight_layout(); Path('figures').mkdir(exist_ok=True); fig.savefig('figures/synthetic_demo.png', dpi=150)
    plt.close(fig)
if __name__ == '__main__': main()
