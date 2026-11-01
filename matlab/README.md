# MATLAB — FMCW radar signal analysis

This folder contains the MATLAB part of our CVSMS project and a separate synthetic example for studying range-FFT estimation.

| File | Source and purpose |
|---|---|
| [`fmcw_original_from_capstone.m`](fmcw_original_from_capstone.m) | The FMCW simulation in our capstone Appendix Z (pp. 73–75), transcribed with formatting normalized |
| [`fmcw_corrected_demo.m`](fmcw_corrected_demo.m) | Additional synthetic baseband range-estimation example, not the original participant pipeline |

To understand how the transmitted chirp, delayed return, IF signal and FFT relate to the hardware, I explain the derivation in [FMCW principles](../docs/05-fmcw-radar-theory.md) and the signal plots in [MATLAB analysis](../docs/06-matlab-analysis.md).

The physical MR60BHA1 used in CVSMS provided heart-rate and respiration reports through UART. Neither MATLAB script represents the commercial module's proprietary vital-sign estimator.
