# 14 — Limitations, lessons learned and future work

[← Home](../README.md) · [← Engineering decisions](13-design-decisions-and-management.md)

Our CVSMS capstone demonstrated a contactless radar monitoring workflow, but it also showed me why a working prototype is only one stage of engineering research. Understanding its limitations is as important as presenting its successful results.

## Limitations we identified

**Single-person observation:** Our system was designed to monitor one person at a time. It did not implement multi-target separation or identification of overlapping vital-sign signals.

**Motion and positioning:** Radar vital-sign sensing is most useful when the target is relatively still and properly aligned with the sensor. Large movements can overwhelm the small periodic displacement we want to measure.

**Signal and environmental interference:** The measured return depends on the surrounding environment, reflections and sensor placement. Our capstone discussed possible interference and the need for more robust signal evaluation.

**Experimental scope:** We tested a limited number of volunteers and reported aggregate comparison scores. Without raw participant-level data and an independently validated measurement protocol, these results should not be treated as clinical performance metrics.

**Software and communication:** The original firmware and mobile interface demonstrated basic IoMT connectivity, but a deployment would need secure communication, handling of disconnections, access control and robust fault detection.

**Temperature interpretation:** The recovered sketch reads the sensor's thermistor output, not a calibrated core-body temperature value.

## How I would develop the project further

1. **Improve repeatable measurement:** Establish a controlled target-distance, posture and activity protocol; synchronize the radar and reference measurements.
2. **Expand radar signal analysis:** Work with sensors that expose raw I/Q or phase data, then investigate respiration/heartbeat separation, motion artifacts and frequency estimation in MATLAB or Python.
3. **Study more complex scenes:** Explore multi-person detection and target association rather than assuming only one quasi-static subject.
4. **Strengthen embedded reliability:** Address UART contention, improve reconnection, response checking, measurement validity flags and data buffering.
5. **Secure the IoMT pipeline:** Introduce encrypted transport and appropriate authentication, particularly when any personal health-related data could be involved.
6. **Evaluate agreement, not only percentage error:** Collect a larger dataset and include bias, variability, limits of agreement, repeatability and uncertainty.
7. **Rebuild the mobile application source:** Preserve the editable MIT App Inventor project, version the interface and automate reproducible application builds.

## What I gained from this capstone

Leading CVSMS taught me how to connect a research question to a practical engineering system: understanding the physics, selecting components, writing interface code, communicating measurements and testing the resulting prototype. It also showed me the value of distinguishing **what a model predicts**, **what a sensor module reports** and **what an experiment actually demonstrates**.

I continue to approach engineering projects with that separation in mind.

[← Return to the project homepage](../README.md)
