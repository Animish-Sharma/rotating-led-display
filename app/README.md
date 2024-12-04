# OkAndroid - Flutter App for Rotating LED Display  

**OkAndroid** is a Flutter-based mobile application designed to wirelessly control the **Rotating LED Display**. With its user-friendly interface, you can customize the content displayed on the LED platform, including text, time, and date in multiple formats.  

This app connects seamlessly with the **ESP8266 microcontroller**, ensuring smooth communication and real-time updates to the display.  

---

## Features  

### 1. **Custom Text Display**  
- Input custom text to be displayed on the rotating LEDs.  
- Supports scrolling text for dynamic visuals.  

### 2. **Time and Date Configuration**  
- Display the current time and date in various user-defined formats.  
- Perfect for creating a clock or calendar-style display.  

### 3. **Wireless Communication**  
- Uses Wi-Fi to connect with the ESP8266 microcontroller.  
- Provides real-time updates without the need for wired connections.  

### 4. **Future Scope**  
- **Image Uploads:** Although not optimized yet, the app has a placeholder for uploading images for display.  
- **Animations:** Planned updates include the ability to add pre-configured animations for added visual effects.  

---

## Installation  

### Prerequisites  
1. Ensure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).  
2. The ESP8266 microcontroller should be set up and running the appropriate firmware.  

### Steps to Install  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/Animish-Sharma/rotating-led-display.git  
   ```
2. Navigate to the app directory:  
   ```bash  
   cd rotating-led-display/flutter-app
   ```
3. Install the necessary dependencies:  
   ```bash  
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```
## How to Use  

1. **Connect to the ESP8266:**  
   - Open the OkAndroid app on your mobile device.  
   - Connect your phone to the Wi-Fi network broadcasted by the ESP8266 microcontroller.  

2. **Customize the Display:**  
   - Enter your desired text in the app to be displayed on the LEDs.  
   - Configure the time and date display formats as per your preference.  

3. **Send Data to the LED Display:**  
   - Use the app's "Send" button to wirelessly transfer your settings and content to the LED display.  
   - Observe your text, time, or date displayed dynamically on the rotating LEDs!  

4. **Future Features Placeholder:**  
   - Although image upload functionality is not optimized yet, the app interface includes a placeholder for future implementation.  

---

## App Design  

### **Tech Stack**  
- **Flutter:** A robust framework for creating cross-platform mobile applications.  
- **Dart:** The programming language powering Flutter for clean, expressive code.  

### **Interface Overview**  
1. **Main Screen:**  
   - Input fields for custom text, time, and date.  
   - Format selection dropdown for customization.  

2. **Connection Status:**  
   - Displays the app's connectivity to the ESP8266.  

3. **Control Panel:**  
   - Buttons for sending data and resetting the display.  

---

## Roadmap for Enhancements  

1. **Optimized Image Uploads:**  
   - Enable users to upload and render images on the LED display seamlessly.  

2. **Custom Animations:**  
   - Add pre-set animation effects to enhance the display's visual appeal.  

3. **Advanced Configuration:**  
   - Introduce brightness and speed controls for finer customization.  

4. **Multi-Device Support:**  
   - Allow the app to manage multiple LED displays simultaneously.  

---

## Contribution  

We welcome contributions to improve **OkAndroid**! Here’s how you can help:  
- Report bugs or suggest enhancements via GitHub Issues.  
- Submit pull requests for code improvements or new features.  
- Share feedback to make the app more user-friendly.  

---

## Authors  

- **Animish Sharma** ([Animish-Sharma](https://github.com/Animish-Sharma))  
- **Shashwat Mukadam** ([Shashwat-11](https://github.com/Shashwat-11))  

Feel free to reach out with your thoughts, suggestions, or collaboration ideas!  

---

## License  

This project is licensed under the MIT License. For more details, see the `LICENSE` file in the repository.  
