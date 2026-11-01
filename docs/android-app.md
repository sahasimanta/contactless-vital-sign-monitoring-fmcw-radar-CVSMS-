# Android application — MIT App Inventor
The capstone's mobile interface was developed with **MIT App Inventor**, a visual block-based Android development environment (not MIT OpenAI). The documented IoMT workflow uses ThingSpeak for cloud-side monitoring.

## Functional workflow
1. Sensor readings are collected by the embedded controller.
2. Data are uploaded to the configured ThingSpeak channel.
3. The Android application retrieves and presents readings.

The original `.aia` source export, `.apk` and block screenshots were **not recovered** for this release. No substitute block code is presented as original. Add authorized exports to `app/` when available. Remove API keys, private channel credentials and any identifying readings first.

## Rebuilding in App Inventor
Use a `Web` component for ThingSpeak's read API, a `Clock` for periodic refresh, and `Label` components for heart-rate and respiratory-rate values. Parse the returned JSON with the built-in dictionary/JSON decoding blocks. Set a reasonable refresh interval, check HTTP status and handle empty feeds. This is a **reimplementation guide**, not an exact transcription of our original blocks.
