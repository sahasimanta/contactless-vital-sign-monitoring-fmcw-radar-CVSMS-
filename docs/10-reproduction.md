# 10 — Running the software and reconstructing the hardware

[← Home](../README.md) · [← Results](09-results.md) · [Next: Team and publication →](11-team-and-publication.md)

I have kept the executable material in separate areas because our capstone included a MATLAB proof of concept, a physical embedded prototype and a mobile monitoring interface. They are related, but they do not share one interchangeable source-code pipeline.

## 1. MATLAB: exploring the FMCW model

**Required:** MATLAB; the archived code's spectrogram may require Signal Processing Toolbox.

```matlab
cd matlab
fmcw_original_from_capstone   % Our capstone appendix transcription
fmcw_corrected_demo          % Additional synthetic baseband range FFT
```

The first script reproduces the form of the code printed in our capstone appendix. The second is a distinct synthetic demonstration that estimates range from the beat spectrum. The files are not instrumented to read the MR60BHA1's raw radar data.

## 2. ESP8266: understanding the firmware

**Hardware:** an appropriate ESP8266 NodeMCU board, MR60BHA1 radar, compatible AMG88xx module, I²C LCD, wiring, and a correctly regulated power supply.

**Software:** Arduino IDE, ESP8266 board package, compatible `60ghzbreathheart`, `Adafruit_AMG88xx` and `LiquidCrystal_I2C` libraries.

1. Read our [connection table and circuit notes](04-circuit-and-wiring.md).
2. Check all supply voltages, radar UART signal levels and I²C pull-ups against the actual component datasheets.
3. Open `firmware/esp8266/CVSMS_ESP8266/`.
4. Copy `secrets.example.h` to `secrets.h`, then enter your own Wi-Fi SSID, password and ThingSpeak write key.
5. Open `CVSMS_ESP8266.ino`, choose the correct ESP8266 board and verify library compatibility.
6. Review the **shared hardware UART** issue explained in the [firmware chapter](07-firmware.md) before connecting the radar and using serial debugging.
7. Test the sensors, display and cloud upload individually before combining them.

The reconstructed firmware is an engineering study artifact; it has not been independently bench-verified on our original prototype since the capstone.

## 3. Python: supplementary signal illustration

```bash
python -m venv .venv
# Activate the environment for your OS
python -m pip install -r requirements.txt
python -m src.demo
python -m pytest -q
```

The Python program creates **synthetic respiration and heartbeat signals**, separates the frequency bands and estimates their dominant rates. It does not contain measured participant data or readings from our MR60BHA1 prototype.

## 4. ThingSpeak and Android

Our firmware example uses three ThingSpeak fields for heart rate, respiration and thermistor temperature. You will need your own ThingSpeak channel and credentials to transmit new readings. The original MIT App Inventor interface is documented in screenshots, but no editable `.aia` project is included to rebuild the app directly.

## 5. What is reproducible from this archive?

| Item | Included | Reproduction boundary |
|---|---|---|
| Original MATLAB appendix transcription | Yes | Source available; MATLAB execution not independently verified for release |
| Supplementary MATLAB range model | Yes | Synthetic example; MATLAB execution not independently verified for release |
| ESP8266 sketch | Yes | Reconstructed from printed code; requires hardware-specific verification |
| Python synthetic demonstration | Yes | Automated Python tests supplied |
| Original circuit and prototype photographs | Yes | Illustrate our build; not a manufacturing package |
| Experimental comparison graphs | Yes | Summary plots; raw participant data not supplied |
| App Inventor screenshots | Yes | Editable `.aia` project not supplied |

**Responsible use:** Our original objective was to develop and evaluate a research prototype. These files are not validated software for medical diagnosis or patient monitoring.

[Next: Our team and publication →](11-team-and-publication.md)
