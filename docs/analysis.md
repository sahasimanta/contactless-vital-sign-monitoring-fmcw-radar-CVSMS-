# Analysis and reproducibility
The original book contains MATLAB simulations, hardware results and comparisons in Chapters 4–5. The provided Python demonstration uses a sum of two synthetic sinusoidal displacement components (0.25 Hz respiration = 15 breaths/min; 1.2 Hz cardiac = 72 beats/min) with deterministic Gaussian noise. Third-order Butterworth bandpass filters isolate respiration (0.1–0.5 Hz) and cardiac motion (0.8–2.2 Hz). An FFT identifies each dominant spectral peak and multiplies its frequency by 60.

This example does not model the full FMCW transmit/receive chirp chain, range FFT, phase unwrapping, target selection, body motion compensation, or sensor hardware outputs. It is not evidence of performance on humans.

The reported study percentages are MAPE-derived summary figures, not measured by this demonstration. Independent validation would require ethically shareable paired reference and radar readings, the original evaluation protocol and code.
