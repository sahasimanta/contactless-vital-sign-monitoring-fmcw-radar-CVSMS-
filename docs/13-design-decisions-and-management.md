# 13 — Engineering decisions and project management

[← Home](../README.md) · [← Technical record](12-source-provenance.md) · [Next: Lessons and future work →](14-limitations-and-next-steps.md)

CVSMS was not only a radar experiment. It required us to make engineering trade-offs, plan the hardware build and divide a broad idea into tasks that could be tested within an undergraduate capstone.

## The main design choices

### Why a 60 GHz radar module?

Our starting requirement was non-contact monitoring of heartbeat- and breathing-related movement. A 60 GHz radar offers a compact sensing approach with a short wavelength that is useful for observing small displacement. Rather than implement our own radar RF front end, we selected the **MR60BHA1**, which provides vital-sign output reports directly. That allowed us to spend more time integrating the complete monitoring system and comparing its performance.

### Why ESP8266?

We needed one inexpensive microcontroller to communicate with the radar, support I²C peripherals and connect to Wi-Fi. The ESP8266 NodeMCU provided those functions in a readily accessible development board. It did, however, introduce an important constraint: a limited UART arrangement when both radar traffic and debugging are required.

### Why ThingSpeak and MIT App Inventor?

ThingSpeak allowed us to demonstrate remote recording and visualization with a straightforward field-based interface. MIT App Inventor allowed us to assemble a project-specific Android application using visual blocks. Our goal at this stage was a demonstrable end-to-end IoMT workflow, not a production healthcare platform.

### Why a separate MATLAB simulation?

MATLAB made the waveform and signal-processing principles easier to examine and present. We used it to study FMCW fundamentals independently of the commercial radar module's internal processing. This separation is useful for teaching and analysis, although it means the original MATLAB script cannot be described as the exact signal-processing code running on our hardware.

## Planning and implementation

Our capstone book includes a project-management chapter with a **Gantt chart, SWOT analysis, cost estimates, and engineering considerations**. During the project we had to balance sensing performance, portability, cost, component availability and the reliability of the cloud interface.

We followed a practical build sequence: study the concept, select components, investigate the simulation, develop the wiring, prepare the enclosure, implement the embedded interface, develop cloud/mobile monitoring and perform comparisons.

## Cost considerations

Our original project included a bill of components in Bangladeshi taka. Some figures in the manuscript refer to individual component prices while a later comparison table gives a different device-level figure. Because those totals cannot be reconciled reliably from the recovered pages, I have not repeated a single unverified **"total build cost"** as if it were audited.

The main cost drivers in our design were the radar and thermal sensing modules, followed by the display, embedded controller, battery/power circuitry and enclosure. A modern reproduction should request current local prices and separately account for laboratory equipment, assembly, replacements and testing.

## Engineering practice and risk

We checked the prototype in different observation conditions and compared it with reference readings. The work also made us consider battery handling, voltage compatibility, participant privacy, target positioning and the difference between a successful academic demonstration and reliable patient monitoring.

The most important trade-off I learned from was **integrating a sensor module that already contains part of the signal-processing intelligence**. This made the end-to-end system practical, but also means that the internal radar algorithm was not our own code.

[Next: Limitations and research direction →](14-limitations-and-next-steps.md)
