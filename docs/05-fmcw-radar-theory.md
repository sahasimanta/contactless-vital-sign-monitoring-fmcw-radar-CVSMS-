# 05 · FMCW radar and contactless vital-sign theory

[← Home](../README.md) · [← Circuit](04-circuit-and-wiring.md) · [MATLAB →](06-matlab-analysis.md)

## 1. Frequency-modulated chirp
An ideal linear FMCW chirp sweeps its frequency from a starting carrier at slope \(S=B/T_c\), where \(B\) is bandwidth and \(T_c\) is chirp duration:

\[ f_{Tx}(t)=f_c+St \]

The corresponding transmitted waveform is

\[ s_{Tx}(t)=\cos\left(2\pi\left[f_ct+\frac{S}{2}t^2\right]\right). \]

## 2. Reflection and delay
For a stationary target at range \(R\), the round-trip propagation delay is approximately

\[ \tau=\frac{2R}{c}. \]

A simplified delayed return is \(s_{Rx}(t)=A\,s_{Tx}(t-\tau)\). Mixing transmit and receive signals yields a **beat frequency** approximately

\[ f_b=S\tau=\frac{2SR}{c}. \]

Thus the range estimate is

\[ R=\frac{cf_b}{2S}. \]

For an ideal chirp, nominal range resolution is \(\Delta R=c/(2B)\).

## 3. Why breathing and heartbeat affect the radar phase
Small chest displacement \(x(t)\) changes the round-trip path. The approximate phase change is

\[ \Delta\phi(t)=\frac{4\pi x(t)}{\lambda},\quad \lambda=\frac{c}{f_c}. \]

Respiration generally produces slower, larger displacement, while heartbeat-related motion is faster and smaller. In a research-grade raw-I/Q processing chain, phase unwrapping, clutter suppression, motion-artifact handling, filtering and spectral estimation can be used to separate these components.

**Crucial implementation distinction:** Our MR60BHA1 module **already reports heart-rate and respiratory-rate values** over UART. The ESP8266 firmware reads those reports; it does not implement the above phase-unwrapping pipeline. The MATLAB appendix investigates FMCW concepts separately.

## 4. MATLAB proof of concept
The appendix uses \(f_c=60\,\mathrm{GHz}\), maximum simulated range 200 m, nominal range resolution 1 m, 128 chirps and 1,024 samples per chirp. These parameters demonstrate radar waveforms and FFT operations. The **200 m simulation range must not be interpreted as the MR60BHA1's real-world vital-sign detection range**.

## 5. Spectral interpretation
An FFT of an IF beat signal can identify frequency peaks and map them to range. A spectrogram illustrates frequency content over time. **A range FFT is not automatically a heart-rate/respiration estimator**; vital-sign estimation needs a different slow-time/phase-analysis pipeline or a radar module with built-in estimation.

## 6. Sources and caveats
Equations are standard ideal FMCW relations, restated for project documentation. Real performance depends on modulation design, sampling, motion, clutter, antenna pattern and calibration. See [MATLAB analysis](06-matlab-analysis.md) and [limitations](09-results.md).
