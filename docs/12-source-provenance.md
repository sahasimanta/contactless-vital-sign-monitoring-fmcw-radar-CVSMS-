# 12 — Source files, attribution and technical record

[← Home](../README.md) · [← Team and awards](11-team-and-publication.md) · [Next: Engineering decisions →](13-design-decisions-and-management.md)

For me, a useful engineering project should make it possible to distinguish the **work completed during the capstone** from **examples added to explain a technique more clearly**. I have preserved that distinction in our CVSMS project record.

## Original academic source

**Capstone project book:** *Contactless Human Vital Sign Monitoring System Using Millimeter Wave FMCW Radar for Healthcare Applications*, Department of Electrical and Electronic Engineering, **American International University–Bangladesh**. Capstone approval: **6 June 2024**.

The material for this presentation was drawn principally from:

- **Chapter 2:** project planning, SWOT and cost considerations;
- **Chapter 3:** methodology, block diagram, flowchart, Android/ThingSpeak views and enclosure models;
- **Chapter 4:** component selection, MATLAB model, hardware assembly and **Table 4.3.2** wiring;
- **Chapter 5:** MATLAB figures, reference measurements and experimental comparisons;
- **Chapter 6:** project conclusions, limitations and future directions;
- **Appendix Z, pp. 73–77:** printed MATLAB and ESP8266 source code.

## What each file represents

| Repository material | Provenance |
|---|---|
| [`matlab/fmcw_original_from_capstone.m`](../matlab/fmcw_original_from_capstone.m) | Transcription of the team’s Appendix Z MATLAB simulation; formatting normalized |
| [`firmware/esp8266/CVSMS_ESP8266/CVSMS_ESP8266.ino`](../firmware/esp8266/CVSMS_ESP8266/CVSMS_ESP8266.ino) | Reconstruction of printed ESP8266 code; credentials separated, HTTP framing and pacing adapted |
| [`assets/project-images/`](../assets/project-images/) | Project figures and photographs supplied from the capstone materials and related award/publication records |
| [`matlab/fmcw_corrected_demo.m`](../matlab/fmcw_corrected_demo.m) | Additional synthetic baseband example to illustrate an ideal range FFT |
| [`src/demo.py`](../src/demo.py) and [`figures/synthetic_demo.png`](../figures/synthetic_demo.png) | Additional synthetic signal-processing illustration, not experimental participant data |
| The Mermaid diagrams in the chapters | Text-based representations of our documented system architecture |

## Technical distinctions

**Radar firmware versus MATLAB:** The MR60BHA1 module generates its own heart-rate and respiratory-rate reports. Our MATLAB model is a proof-of-concept for FMCW signal behaviour, not the sensor's internal algorithm.

**Thermal measurement:** The available Arduino code reads the AMG88xx **thermistor**. It should not be claimed as a calibrated measurement of core-body temperature.

**Experimental figures:** The comparison plots document the project results. Synthetic MATLAB/Python demonstrations are not a substitute for those measurements.

**Published source:** Our original team’s MATLAB code is included as an archive transcription. The Arduino file is reconstructed and adapted, not an untouched firmware export. The original MIT App Inventor `.aia` source and participant-level dataset are not available in this package.

**Publication image:** The included image is an online research listing, not the PDF's first page. The conference DOI is provided for the authoritative research citation.

## Credits and rights

The capstone was developed by four students under the supervision named in our [team chapter](11-team-and-publication.md). Maintaining this repository does not imply sole authorship of the original team work.

I have not applied an open-source license to the entire archive, because the rights to collaborative university material, individual photographs and publication-related content may differ. If those permissions are established, an appropriate license can be chosen for the code and documentation separately.

[Next: Project planning and design decisions →](13-design-decisions-and-management.md)
