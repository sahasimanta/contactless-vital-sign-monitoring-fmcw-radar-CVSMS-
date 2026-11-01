// CVSMS team project, ESP8266 firmware reconstructed from capstone Appendix Z.
// Network credentials are loaded from a local untracked secrets.h file.
// HTTP framing and ThingSpeak upload timing have been adjusted.
// Hardware required: ESP8266 NodeMCU, MR60BHA1, AMG88xx, 20x4 I2C LCD.
#include <Arduino.h>
#include <Wire.h>
#include <60ghzbreathheart.h>
#include <Adafruit_AMG88xx.h>
#include <LiquidCrystal_I2C.h>
#include <ESP8266WiFi.h>
#include "secrets.h"

BreathHeart_60GHz radar = BreathHeart_60GHz(&Serial);
Adafruit_AMG88xx amg;
LiquidCrystal_I2C lcd(0x3F, 20, 4);
WiFiClient client;
unsigned long lastUpload = 0;
const unsigned long uploadIntervalMs = 20000;

void setup() {
  Serial.begin(115200);
  Wire.begin();
  lcd.init(); lcd.backlight(); lcd.print("CVSMS starting");
  if (!amg.begin()) { lcd.clear(); lcd.print("AMG88xx not found"); while (true) delay(1000); }
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  unsigned long start = millis();
  while (WiFi.status() != WL_CONNECTED && millis() - start < 15000) delay(500);
  lcd.clear(); lcd.print("CVSMS ready");
}

void loop() {
  const float temperature = amg.readThermistor();
  radar.Breath_Heart();
  lcd.setCursor(0, 0); lcd.print("Temp: "); lcd.print(temperature, 1); lcd.print(" C   ");
  if (radar.sensor_report == HEARTRATEVAL) {
    lcd.setCursor(0, 1); lcd.print("HR: "); lcd.print(radar.heart_rate); lcd.print(" bpm   ");
  } else if (radar.sensor_report == BREATHVAL) {
    lcd.setCursor(0, 2); lcd.print("RR: "); lcd.print(radar.breath_rate); lcd.print(" brpm  ");
  }
  if (millis() - lastUpload >= uploadIntervalMs) {
    lastUpload = millis();
    if (WiFi.status() == WL_CONNECTED && client.connect("api.thingspeak.com", 80)) {
      String body = "api_key=" + String(THINGSPEAK_WRITE_KEY) + "&field1=" + String(radar.heart_rate)
        + "&field2=" + String(radar.breath_rate) + "&field3=" + String(temperature, 2);
      client.print("POST /update HTTP/1.1\r\n");
      client.print("Host: api.thingspeak.com\r\nConnection: close\r\n");
      client.print("Content-Type: application/x-www-form-urlencoded\r\nContent-Length: ");
      client.print(body.length()); client.print("\r\n\r\n"); client.print(body);
      client.stop();
    }
  }
  delay(200);
}
