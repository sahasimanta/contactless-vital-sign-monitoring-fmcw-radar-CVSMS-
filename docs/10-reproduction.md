# 10 · Build, run and reproduce

[← Home](../README.md) · [← Results](09-results.md) · [Team →](11-team-and-publication.md)

## A. MATLAB demonstration
1. Open MATLAB and navigate to `matlab/`.
2. Run `fmcw_corrected_demo.m`.
3. Inspect the estimated synthetic target range and generated FFT plot.
4. Read `fmcw_original_from_capstone.m` as a **historical source transcription**. Its plots and algorithm have not been independently validated.

## B. Python educational signal-processing demo

```bash
python -m venv .venv
# Activate the virtual environment, then:
python -m pip install -r requirements.txt
python -m src.demo
python -m pytest -q
```

The Python code synthesizes displacement components and is **not original radar data**.

## C. ESP8266 hardware
1. Obtain compatible MR60BHA1, ESP8266, AMG88xx, LCD, regulated supply and wiring.
2. Review the book's connection table as documented in [Circuit](04-circuit-and-wiring.md).
3. Resolve UART-sharing issues, voltage compatibility and I²C pull-ups before powering.
4. Install compatible board support and libraries in Arduino IDE.
5. Create `firmware/esp8266/secrets.h` from `secrets.example.h`.
6. Open `firmware/esp8266/CVSMS_ESP8266.ino` and compile for the **specific** ESP8266 board.
7. Validate readings with reference equipment; check ThingSpeak fields and timestamps.

## Reproducibility matrix
| Component | Included? | Verification |
|---|---|---|
| Original MATLAB appendix transcription | Yes | Transcribed; not MATLAB-tested |
| Modernized synthetic MATLAB example | Yes | Not MATLAB-tested |
| Reconstructed ESP8266 firmware | Yes | Not compiled on hardware |
| Synthetic Python signal demo | Yes | Previously executed and tested |
| Original App Inventor `.aia` | No | Needs team archive |
| Original circuit image / photographs | No | Needs book image extraction |
| Raw experimental measurements | No | Not supplied / privacy review needed |

**Do not claim that the entire hardware system is plug-and-play from this ZIP.**
