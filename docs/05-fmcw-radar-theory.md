# 05 — Understanding the 60 GHz FMCW radar principle

[← Home](../README.md) · [← Circuit](04-circuit-and-wiring.md) · [Next: MATLAB →](06-matlab-analysis.md)

FMCW radar was one of the most interesting parts of our capstone for me. It connects electromagnetic-wave propagation with signal processing, and it provides a way to observe very small movements without making physical contact with the target.

## 1. Transmitting a chirp

An FMCW radar transmits a waveform whose instantaneous frequency changes during a sweep (chirp). For an ideal linear sweep,

$$ f_{\mathrm{Tx}}(t)=f_c+St,\qquad S=\frac{B}{T_c} $$

where $f_c$ is the carrier frequency, $S$ is the chirp slope, $B$ is the chirp bandwidth, and $T_c$ is the chirp duration. One mathematical representation of the transmitted signal is

$$ s_{\mathrm{Tx}}(t)=\cos\left[2\pi\left(f_ct+\frac{St^2}{2}\right)\right]. $$

We used a **60 GHz** carrier assumption in our MATLAB proof of concept. Its free-space wavelength is roughly **5 mm**, which helps explain why movement on the scale of a small fraction of a wavelength can affect the phase of a radar return.

## 2. The reflected signal

The transmitted wave reflects from objects within the antenna's field of view. For a stationary target at distance $R$, the ideal round-trip propagation delay is

$$ \tau=\frac{2R}{c}, $$

where $c$ is the speed of light. A simplified reflected signal is

$$ s_{\mathrm{Rx}}(t)=A\cos\left[2\pi\left(f_c(t-\tau)+\frac{S(t-\tau)^2}{2}\right)\right]. $$

The reflected wave arrives later than the transmitted chirp. Motion introduces additional time-varying phase and, depending on the observation interval, Doppler effects.

## 3. Mixing and the IF/beat frequency

Comparing the transmitted and received chirps produces a lower-frequency intermediate-frequency (IF) or beat component. For the ideal stationary-target case,

$$ f_b=S\tau=\frac{2SR}{c},\qquad R=\frac{cf_b}{2S}. $$

The corresponding ideal range resolution is approximately

$$ \Delta R=\frac{c}{2B}. $$

In our MATLAB appendix, we used a nominal **1 m range-resolution parameter** and a **200 m simulated maximum range**. Those are assumptions for the **illustrative simulation**, not claims about the actual MR60BHA1 vital-sign sensor's detection distance.

## 4. Why chest motion matters

Breathing and heartbeat introduce small motion at the chest surface. If $x(t)$ is displacement along the radar line of sight, a simplified monostatic phase-change model is

$$ \Delta\phi(t)=\frac{4\pi x(t)}{\lambda},\qquad\lambda=\frac{c}{f_c}. $$

Breathing usually produces a relatively slow and strong mechanical component, whereas the heartbeat-related displacement is smaller and faster. A radar system with access to sufficiently clean phase data may estimate these different rhythms using filtering, spectral analysis and motion-artifact suppression.

## 5. How the principle relates to our device

Our project has two distinct processing levels:

1. **MATLAB proof of concept:** we generated synthetic chirps, simulated propagation delay, and examined the IF waveform, FFT and spectrogram.
2. **Embedded prototype:** we used an **MR60BHA1 with built-in vital-sign estimation**. The radar sent rate reports over UART to the ESP8266, which displayed and uploaded the readings.

We did **not** implement a raw radar phase-extraction algorithm on the ESP8266, and we did not validate our MATLAB script as a replacement for the radar module's internal processing. This distinction is central to understanding our architecture.

## 6. What the FFT shows—and what it does not

An FFT transforms the sampled time-domain IF waveform into frequency-domain components. A peak in a beat spectrum can be associated with range through the chirp slope under the ideal assumptions. By itself, that is **not** the same calculation as deriving heart rate or respiratory rate from a sequence of slow-time chest displacements.

[Next: Our MATLAB model and plots →](06-matlab-analysis.md)
