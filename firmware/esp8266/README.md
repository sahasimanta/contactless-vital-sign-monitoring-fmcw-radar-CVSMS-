# ESP8266 firmware

Open `CVSMS_ESP8266/CVSMS_ESP8266.ino` in Arduino IDE. Copy `CVSMS_ESP8266/secrets.example.h` to `CVSMS_ESP8266/secrets.h` and supply your own Wi-Fi and ThingSpeak credentials. `secrets.h` is excluded by `.gitignore`. Install the ESP8266 board package and the libraries required by the sketch.

**Hardware verification required:** The original radar interface shares `Serial` with the ESP8266 UART, and voltage levels/pin connections must be checked before wiring or flashing. The firmware has not been bench-tested as part of this repository packaging. HTTP transmission is unencrypted; do not use it for sensitive patient data.
