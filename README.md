# Rotating LED Display  

Welcome to the **Rotating LED Display** project! This system brings together innovation, creativity, and technology to create a stunning visual experience. Designed and developed by
1. **[Animish Sharma](https://github.com/Animish-Sharma)**
2. **[Shashwat Mukadam](https://github.com/Shashwat-11)** 

this project showcases a rotating LED platform capable of displaying real-time text, time, and date in various formats.  

The hardware is driven by an **ESP8266 microcontroller**, with content managed via a **Flutter-based mobile application**, enabling effortless customization. While the app has provisions for image uploads, this feature is currently unoptimized and excluded from this version of the repository.  

---

## Features  

### 1. **Dynamic LED Display**  
- Displays **scrolling text**, **time**, and **date** in customizable formats.  
- Perfect for eye-catching installations, event displays, or educational projects.  

### 2. **Rotating Mechanism**  
- 8 red LEDs mounted on a rotating platform powered by a motor.  
- Creates a persistence of vision (PoV) effect for smooth visual outputs.  

### 3. **ESP8266 Microcontroller**  
- The brain of the project, responsible for controlling the LEDs and handling app communication.  
- Ensures precise timing and smooth operation.  

### 4. **Flutter Mobile App**  
- A simple and intuitive interface to manage display content wirelessly.  
- Features:  
  - Input custom text.  
  - Configure time and date formats.  
  - Plan to add image uploads (currently excluded).  

### 5. **Scalable & Open-Source**  
- Modular design for easy upgrades and scalability.  
- Open for contributions from the community.  

---

## Hardware Components  

### **Core Components:**  
1. **8 Red LEDs**: The main visual elements of the display.  
2. **ESP8266 Microcontroller**: Handles LED controls and wireless communication.  
3. **Motor**: Provides rotational motion for the LED platform.  

### **Additional Materials:**  
- Power supply (suitable for motor and ESP8266).  
- Connecting wires and a stable mounting structure.  

---

## Software Requirements  

### 1. **ESP8266 Firmware**  
- Microcontroller code for managing LEDs and receiving data from the Flutter app.  

### 2. **Flutter Application**  
- A cross-platform mobile app for user-friendly content management.  

---

## Installation  

### **Hardware Setup:**  
1. Mount the 8 LEDs onto a rotating platform securely attached to the motor.  
2. Connect the LEDs to the ESP8266's GPIO pins as per the pinout in the code.  
3. Provide power to the motor and ESP8266 using a compatible power source.  
4. Ensure proper balancing of the platform for smooth rotation.  

### **Software Setup:**  
1. **Clone the repository:**  
   ```bash  
   git clone https://github.com/Animish-Sharma/rotating-led-display.git  
    ```
2. **Upload Firmware to ESP8266:**  
   - Open the Arduino IDE or any other compatible tool.  
   - Navigate to the `firmware/` directory in the cloned repository.  
   - Install the required libraries for the ESP8266 (e.g., `ESP8266WiFi.h`, `Adafruit_GFX.h`, etc.).  
   - Open the firmware code file (`rotating_led.ino`) in the Arduino IDE.  
   - Configure the code for your Wi-Fi network by entering the SSID and password (if required).  
   - Connect your ESP8266 to your system via USB and upload the firmware.  

3. **Install the Flutter App:**  
   - Navigate to the `flutter-app/` directory in the repository.  
   - Ensure you have Flutter installed on your system. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).  
   - Open a terminal and run the following commands:  
     ```bash  
     flutter pub get  
     flutter run  
     ```  
   - This will install and run the app on your connected mobile device or emulator.  

   *Note: Ensure your system and device are connected to the same Wi-Fi network as the ESP8266 for proper communication.*  

## Screenshots (App)
![screenshot1](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/screenshot2.jpeg?raw=true)
![screenshot2](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/screenshot1.jpeg?raw=true)

## Circuit Design

### Circuit Design
![circuit](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/ewcircuit.png?raw=true)

### FlowChart
![flowchart](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/flowchart.png?raw=true)
## Result
### | [Google Drive Video](https://drive.google.com/file/d/1EhQVvF1xgY1Ot-h7ytVo3lwRY-moVVTa/view?usp=drive_link)

#### Some Images

1st Image
![1](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/1.jpeg?raw=true)

2nd Image
![2](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/2.jpeg?raw=true)

3rd Image
![3](https://github.com/Animish-Sharma/rotating-led-display/blob/main/app/New%20folder/3.jpeg?raw=true)
