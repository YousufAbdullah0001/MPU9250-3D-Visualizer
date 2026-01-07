MPU9250/6500 3D Handset Visualizer

This project demonstrates a real-time 3D orientation tracker using an Arduino Nano and MPU9250/6500 IMU. It visualizes the movement in Processing (Java) with smooth 360-degree rotation.

Hardware Required

Arduino Nano

MPU9250/6500/9255 Sensor

USB Cable 

Jumper Wires

Software Required

Arduino IDE

Processing 4.x (with processing.serial library)

How to Use

Arduino: Upload the code inside Arduino_Code/ to your Arduino Nano.

Wiring:

VCC -> 5V

GND -> GND

SCL -> A5

SDA -> A4

Processing: Open the script in Processing_Visualizer/ and update the COM port to match your Arduino's port.

Run: Press the Play button in Processing to see the 3D box move with your sensor!

Features

Full 360° Rotation: Uses atan2 for precise tilt measurement.

Smoothing: Implemented lerp() for noise-free movement.

Lightweight: Minimal delay for real-time response.