# ESP8266 firmware — CVSMS

Our microcontroller code connects the **MR60BHA1 radar reports**, the **AMG88xx thermistor**, the **I²C LCD** and the **ThingSpeak** cloud channel.

- [Arduino sketch](CVSMS_ESP8266/CVSMS_ESP8266.ino)
- [Local credentials template](CVSMS_ESP8266/secrets.example.h)
- [Embedded integration walkthrough](../../docs/07-firmware.md)
- [Hardware wiring table](../../docs/04-circuit-and-wiring.md)

The sketch was **reconstructed from Appendix Z, pp. 75–77**, with changes to protect configuration credentials and adjust the ThingSpeak request and upload interval. It is not a byte-identical copy of the original development-machine sketch and has not been independently bench-verified.

Before running it on a physical ESP8266, verify compatible radar/display libraries, 3.3 V logic levels, shared UART operation and the actual I²C addresses. Copy `secrets.example.h` to `secrets.h` in the sketch folder and enter your own credentials. The local `secrets.h` file is ignored by Git.

The transmitted HTTP data is **not encrypted** in this reconstruction. I would use secure communications and a more robust protocol for any future field deployment.
