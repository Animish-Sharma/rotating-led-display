#include <Arduino.h>
#include <string.h>
#include <ESP8266WiFi.h>
#include <FirebaseClient.h>
#include <WiFiClientSecure.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

#define WIFI_SSID "eclipse"
#define WIFI_PASSWORD "helloworld"
#define DATABASE_SECRET "" // DATABASE SECRET
#define DATABASE_URL "ew-project-iiith-default-rtdb.firebaseio.com/" // DATABASE URL



const int pins[] = {13,12,14,2,0,4,5,16};//define LED pins
int rows = 8;//number of rows
const int charHeight = 8;
const int charWidth = 5;
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org");
String months[12]={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"};
const unsigned char font[95][5] = {//font array
  {0x00, 0x00, 0x00, 0x00, 0x00}, //   0x20 32
  {0x00, 0x00, 0x6f, 0x00, 0x00}, // ! 0x21 33
  {0x00, 0x07, 0x00, 0x07, 0x00}, // " 0x22 34
  {0x14, 0x7f, 0x14, 0x7f, 0x14}, // # 0x23 35
  {0x00, 0x07, 0x04, 0x1e, 0x00}, // $ 0x24 36
  {0x23, 0x13, 0x08, 0x64, 0x62}, // % 0x25 37
  {0x36, 0x49, 0x56, 0x20, 0x50}, // & 0x26 38
  {0x00, 0x00, 0x07, 0x00, 0x00}, // ' 0x27 39
  {0x00, 0x1c, 0x22, 0x41, 0x00}, // ( 0x28 40
  {0x00, 0x41, 0x22, 0x1c, 0x00}, // ) 0x29 41
  {0x14, 0x08, 0x3e, 0x08, 0x14}, // * 0x2a 42
  {0x08, 0x08, 0x3e, 0x08, 0x08}, // + 0x2b 43
  {0x00, 0x50, 0x30, 0x00, 0x00}, // , 0x2c 44
  {0x08, 0x08, 0x08, 0x08, 0x08}, // - 0x2d 45
  {0x00, 0x60, 0x60, 0x00, 0x00}, // . 0x2e 46
  {0x20, 0x10, 0x08, 0x04, 0x02}, // / 0x2f 47
  {0x3e, 0x51, 0x49, 0x45, 0x3e}, // 0 0x30 48
  {0x00, 0x42, 0x7f, 0x40, 0x00}, // 1 0x31 49
  {0x42, 0x61, 0x51, 0x49, 0x46}, // 2 0x32 50
  {0x21, 0x41, 0x45, 0x4b, 0x31}, // 3 0x33 51
  {0x18, 0x14, 0x12, 0x7f, 0x10}, // 4 0x34 52
  {0x27, 0x45, 0x45, 0x45, 0x39}, // 5 0x35 53
  {0x3c, 0x4a, 0x49, 0x49, 0x30}, // 6 0x36 54
  {0x01, 0x71, 0x09, 0x05, 0x03}, // 7 0x37 55
  {0x36, 0x49, 0x49, 0x49, 0x36}, // 8 0x38 56
  {0x06, 0x49, 0x49, 0x29, 0x1e}, // 9 0x39 57
  {0x00, 0x36, 0x36, 0x00, 0x00}, // : 0x3a 58
  {0x00, 0x56, 0x36, 0x00, 0x00}, // ; 0x3b 59
  {0x08, 0x14, 0x22, 0x41, 0x00}, // < 0x3c 60
  {0x14, 0x14, 0x14, 0x14, 0x14}, // = 0x3d 61
  {0x00, 0x41, 0x22, 0x14, 0x08}, // > 0x3e 62
  {0x02, 0x01, 0x51, 0x09, 0x06}, // ? 0x3f 63
  {0x3e, 0x41, 0x5d, 0x49, 0x4e}, // @ 0x40 64
  {0x7e, 0x09, 0x09, 0x09, 0x7e}, // A 0x41 65
  {0x7f, 0x49, 0x49, 0x49, 0x36}, // B 0x42 66
  {0x3e, 0x41, 0x41, 0x41, 0x22}, // C 0x43 67
  {0x7f, 0x41, 0x41, 0x41, 0x3e}, // D 0x44 68
  {0x7f, 0x49, 0x49, 0x49, 0x41}, // E 0x45 69
  {0x7f, 0x09, 0x09, 0x09, 0x01}, // F 0x46 70
  {0x3e, 0x41, 0x49, 0x49, 0x7a}, // G 0x47 71
  {0x7f, 0x08, 0x08, 0x08, 0x7f}, // H 0x48 72
  {0x00, 0x41, 0x7f, 0x41, 0x00}, // I 0x49 73
  {0x20, 0x40, 0x41, 0x3f, 0x01}, // J 0x4a 74
  {0x7f, 0x08, 0x14, 0x22, 0x41}, // K 0x4b 75
  {0x7f, 0x40, 0x40, 0x40, 0x40}, // L 0x4c 76
  {0x7f, 0x02, 0x0c, 0x02, 0x7f}, // M 0x4d 77
  {0x7f, 0x04, 0x08, 0x10, 0x7f}, // N 0x4e 78
  {0x3e, 0x41, 0x41, 0x41, 0x3e}, // O 0x4f 79
  {0x7f, 0x09, 0x09, 0x09, 0x06}, // P 0x50 80
  {0x3e, 0x41, 0x51, 0x21, 0x5e}, // Q 0x51 81
  {0x7f, 0x09, 0x19, 0x29, 0x46}, // R 0x52 82
  {0x46, 0x49, 0x49, 0x49, 0x31}, // S 0x53 83
  {0x01, 0x01, 0x7f, 0x01, 0x01}, // T 0x54 84
  {0x3f, 0x40, 0x40, 0x40, 0x3f}, // U 0x55 85
  {0x0f, 0x30, 0x40, 0x30, 0x0f}, // V 0x56 86
  {0x3f, 0x40, 0x30, 0x40, 0x3f}, // W 0x57 87
  {0x63, 0x14, 0x08, 0x14, 0x63}, // X 0x58 88
  {0x07, 0x08, 0x70, 0x08, 0x07}, // Y 0x59 89
  {0x61, 0x51, 0x49, 0x45, 0x43}, // Z 0x5a 90
  {0x3c, 0x4a, 0x49, 0x29, 0x1e}, // [ 0x5b 91
  {0x02, 0x04, 0x08, 0x10, 0x20}, // 0x5c 92
  {0x00, 0x41, 0x7f, 0x00, 0x00}, // ] 0x5d 93
  {0x04, 0x02, 0x01, 0x02, 0x04}, // ^ 0x5e 94
  {0x40, 0x40, 0x40, 0x40, 0x40}, // _ 0x5f 95
  {0x00, 0x00, 0x03, 0x04, 0x00}, // ` 0x60 96
  {0x20, 0x54, 0x54, 0x54, 0x78}, // a 0x61 97
  {0x7f, 0x48, 0x44, 0x44, 0x38}, // b 0x62 98
  {0x38, 0x44, 0x44, 0x44, 0x20}, // c 0x63 99
  {0x38, 0x44, 0x44, 0x48, 0x7f}, // d 0x64 100
  {0x38, 0x54, 0x54, 0x54, 0x18}, // e 0x65 101
  {0x08, 0x7e, 0x09, 0x01, 0x02}, // f 0x66 102
  {0x0c, 0x52, 0x52, 0x52, 0x3e}, // g 0x67 103
  {0x7f, 0x08, 0x04, 0x04, 0x78}, // h 0x68 104
  {0x00, 0x44, 0x7d, 0x40, 0x00}, // i 0x69 105
  {0x20, 0x40, 0x44, 0x3d, 0x00}, // j 0x6a 106
  {0x00, 0x7f, 0x10, 0x28, 0x44}, // k 0x6b 107
  {0x00, 0x41, 0x7f, 0x40, 0x00}, // l 0x6c 108
  {0x7c, 0x04, 0x18, 0x04, 0x78}, // m 0x6d 109
  {0x7c, 0x08, 0x04, 0x04, 0x78}, // n 0x6e 110
  {0x38, 0x44, 0x44, 0x44, 0x38}, // o 0x6f 111
  {0x7c, 0x14, 0x14, 0x14, 0x08}, // p 0x70 112
  {0x08, 0x14, 0x14, 0x18, 0x7c}, // q 0x71 113
  {0x7c, 0x08, 0x04, 0x04, 0x08}, // r 0x72 114
  {0x48, 0x54, 0x54, 0x54, 0x20}, // s 0x73 115
  {0x04, 0x3f, 0x44, 0x40, 0x20}, // t 0x74 116
  {0x3c, 0x40, 0x40, 0x20, 0x7c}, // u 0x75 117
  {0x1c, 0x20, 0x40, 0x20, 0x1c}, // v 0x76 118
  {0x3c, 0x40, 0x30, 0x40, 0x3c}, // w 0x77 119
  {0x44, 0x28, 0x10, 0x28, 0x44}, // x 0x78 120
  {0x0c, 0x50, 0x50, 0x50, 0x3c}, // y 0x79 121
  {0x44, 0x64, 0x54, 0x4c, 0x44}, // z 0x7a 122
  {0x00, 0x08, 0x36, 0x41, 0x41}, // { 0x7b 123
  {0x00, 0x00, 0x7f, 0x00, 0x00}, // | 0x7c 124
  {0x41, 0x41, 0x36, 0x08, 0x00}, // } 0x7d 125
  {0x04, 0x02, 0x04, 0x08, 0x04}, // ~ 0x7e 126
}; 

char textString[] = "WordToShow";
WiFiClientSecure ssl1, ssl2;

DefaultNetwork network;
AsyncClientClass client1(ssl1, getNetwork(network)), client2(ssl2, getNetwork(network));
FirebaseApp app;
RealtimeDatabase Database;
AsyncResult result1, result2;
NoAuth noAuth;

int clk = 4;

void printResult(AsyncResult &aResult) {

  if (aResult.isDebug()) {
    Firebase.printf("Debug task: %s, msg: %s\n", aResult.uid().c_str(), aResult.debug().c_str());
  }

  if (aResult.isError()) {
    Firebase.printf("Error task: %s, msg: %s, code: %d\n", aResult.uid().c_str(), aResult.error().message().c_str(), aResult.error().code());
  }

  if (aResult.available()) {
    RealtimeDatabaseResult &RTDB = aResult.to<RealtimeDatabaseResult>();
    if (RTDB.isStream()) {
      Serial.println("----------------------------");
      Firebase.printf("task: %s\n", aResult.uid().c_str());
      Firebase.printf("event: %s\n", RTDB.event().c_str());
      Firebase.printf("path: %s\n", RTDB.dataPath().c_str());
      Firebase.printf("data: %s\n", RTDB.to<const char *>());
      Firebase.printf("type: %d\n", RTDB.type());
      bool v1 = RTDB.to<bool>();
      if(RTDB.type() == 1){
        strcpy(textString, "");
        int v2 = RTDB.to<int>();
        if (v2 != 0) {
          clk = v2;
        }
      }
      float v3 = RTDB.to<float>();
      double v4 = RTDB.to<double>();
      if(RTDB.type() == 5){
        clk = 4;
        String v5 = RTDB.to<String>();
        strcpy(textString, v5.c_str());
      }
    } else {
      Serial.println("----------------------------");
      Firebase.printf("task: %s, payload: %s\n", aResult.uid().c_str(), aResult.c_str());
    }
  }
}

void setup() {

  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  for (int i = 0; i < rows; i++) {
    pinMode(pins[i], OUTPUT); // Set all pins as output
  }

  // Power pins (if needed for your circuit)
  pinMode(D8, OUTPUT);
  pinMode(D9, OUTPUT);
  digitalWrite(D8, HIGH);
  digitalWrite(D9, HIGH);

  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Firebase.printf("Firebase Client v%s\n", FIREBASE_CLIENT_VERSION);
  timeClient.begin();
  timeClient.setTimeOffset(19800);
  ssl1.setInsecure();
  ssl2.setInsecure();
#if defined(ESP8266)
  ssl1.setBufferSizes(1024, 1024);
  ssl2.setBufferSizes(1024, 1024);
#endif
  initializeApp(client1, app, getAuth(noAuth));
  app.getApp<RealtimeDatabase>(Database);
  Database.url(DATABASE_URL);
  Database.get(client1, "/test/data", result1, true);
}

void loop() {
  timeClient.update();
  Database.loop();
  printResult(result1);
  if (clk == 1 && !strcmp(textString,"")) {
    Serial.println("Clock 1");
    int currentHour = timeClient.getHours();
    int currentMinute = timeClient.getMinutes();
    String formattedTime = String(currentHour) + ":" + String(currentMinute);
    Serial.println(formattedTime);
    for (int k = sizeof(formattedTime) - 1; k > -1; k--) {
      Display(formattedTime[k]);
    }
  } else if (clk == 2 && !strcmp(textString,"")) {
    Firebase.printf("Clock 2\n");
    time_t epochTime = timeClient.getEpochTime();
    struct tm *ptm = gmtime ((time_t *)&epochTime); 
    int monthDay = ptm->tm_mday;
    int currentMonth = ptm->tm_mon+1;
    int currentYear = ptm->tm_year+1900;
    String formattedDate = String(monthDay) + "-" + String(currentMonth) + "-" + String(currentYear);
    Serial.println(formattedDate);
    for (int k = sizeof(formattedDate) - 1; k > -1; k--) {
      Display(formattedDate[k]);
    }
  } else if (clk == 3 && !strcmp(textString,"")) {
    Firebase.printf("Clock 3\n");
    time_t epochTime = timeClient.getEpochTime();
    struct tm *ptm = gmtime ((time_t *)&epochTime); 
    int monthDay = ptm->tm_mday;
    int currentMonth = ptm->tm_mon+1;
    int currentYear = ptm->tm_year+1900;
    String currentMonthName = months[currentMonth-1];
    String formattedDate = String(monthDay) + "-" + String(currentMonthName) + "-" + String(currentYear);
    Serial.println(formattedDate);
    for (int k = sizeof(formattedDate) - 1; k > -1; k--) {
      Display(formattedDate[k]);
    }
  } else {
    for (int k = sizeof(textString) - 1; k > -1; k--) {
      Display(textString[k]);
    }
  }
}

void Display(char ch) {
  if (ch < 32 || ch > 126) {
    ch = 32; // Default to space for unsupported characters
  }
  ch -= 32;

  for (int i = charWidth - 1; i > -1; i--) {
    byte b = font[ch][i];
    for (int j = 0; j < charHeight; j++) {
      digitalWrite(pins[j], bitRead(b, j)); // Set each row of LEDs
    }
    delay(1); // Delay for persistence of vision effect
  }

  for (int i = 0; i < rows; i++) {
    digitalWrite(pins[i], LOW); // Turn off all rows
  }
  delay(1); // Delay between characters
}

