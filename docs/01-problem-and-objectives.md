# 01 — Problem statement and objectives

[← Home](../README.md) · [Next: Our methodology →](02-methodology.md)

## The problem I wanted to work on

When we began our capstone, I was interested in the potential of radar as a sensing technology beyond traditional communication and ranging applications. Monitoring heart rate and respiratory rate offered an interesting engineering challenge because these vital signs produce mechanical movement, yet the signals can be small and difficult to observe in the presence of ordinary body motion.

We identified a practical motivation: **conventional monitoring often relies on sensors attached directly to the body**. Contact monitoring remains essential in many clinical applications, but for certain observation and research scenarios it is worth investigating a complementary, non-contact approach. We were particularly interested in the possible applications to bedside and elderly-care monitoring.

Our project asked a specific engineering question: **Could we connect a 60 GHz radar sensor to a small, network-enabled controller and build a usable end-to-end demonstration—from sensing to display and remote access?**

## Our objectives

| Objective | How we approached it |
|---|---|
| Detect breathing and heartbeat without electrodes | Used an MR60BHA1 60 GHz radar module with built-in vital-sign reporting |
| Understand the radar principle | Studied FMCW waveform generation, propagation delay, IF signals, and FFT in MATLAB |
| Create a portable monitoring prototype | Integrated the radar, ESP8266, thermal sensor, LCD and battery-based power components |
| Monitor results locally | Presented readings using an I²C LCD |
| Make the readings accessible remotely | Uploaded values through Wi-Fi to ThingSpeak and built a CVSMS Android interface |
| Evaluate performance | Compared radar readings with reference measurements and summarized percentage errors |

Our capstone also discussed potential extensions such as sleep-state monitoring, abnormality detection and automated decision-making. I regard those as **research goals and future opportunities**, not functions that we established as clinically validated in the completed prototype.

## Design requirements and constraints

We needed a compact sensor arrangement, real-time reporting, simple on-device feedback, wireless data transfer, and a way to evaluate the resulting measurements. Cost and component availability were relevant to the prototype we developed in Bangladesh. We also had to address electrical integration, radar alignment, motion sensitivity, and basic data handling.

One important limitation shaped the project from the beginning: this was **a single-person, quasi-static monitoring demonstration**. We did not develop a verified multi-person radar tracking or medical diagnostic system.

## My engineering focus

Leading this project required me to connect different engineering disciplines rather than treating the radar, controller, simulation and mobile application as unrelated tasks. Our final design therefore follows a traceable path: physical movement → radar report → controller → local/cloud display → experimental comparison.

[Next: Our methodology →](02-methodology.md)
