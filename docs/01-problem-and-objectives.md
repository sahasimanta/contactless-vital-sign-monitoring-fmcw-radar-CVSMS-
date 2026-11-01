# 01 · Problem statement and engineering objectives

[← Home](../README.md) · [Next: Methodology →](02-methodology.md)

## Motivation
Conventional heart-rate and respiration monitoring often uses electrodes, straps or other body-contact sensors. Our capstone explored whether millimeter-wave sensing could enable **contactless** monitoring in a research setting, with local and remote viewing of measurements.

## Objectives
1. Investigate FMCW radar principles and their relationship to tiny periodic chest movements.
2. Integrate an MR60BHA1 radar module with an ESP8266 NodeMCU.
3. Read an AMG88xx sensor's thermistor temperature and display readings locally.
4. Send sensor values to ThingSpeak and visualize them in an Android application made with MIT App Inventor.
5. Assess the prototype using reference readings and discuss its limitations.

## Engineering constraints
Sensor alignment, chest distance, motion artefacts, interference, power supply quality, serial timing, cloud connectivity and measurement interpretation all influence the prototype. A thermistor measurement should **not** be labelled as clinically accurate human body temperature without appropriate validation.

## Scope boundary
The work is an academic engineering prototype. It does not establish clinical diagnostic performance, patient safety certification or reliable measurements in all postures and environments.
