import processing.serial.*;

Serial myPort;
float x, y, z;
float smoothX, smoothY; // for smooth movement
void setup() {
  size(800, 600, P3D);
  if (Serial.list().length > 0) {
    // select right port
    myPort = new Serial(this, Serial.list()[0], 115200);
    myPort.bufferUntil('\n'); //
  }
}

void draw() {
  background(30);
  lights();
  
  // smooth movement using (Lerp)
  smoothX = lerp(smoothX, x, 0.1); 
  smoothY = lerp(smoothY, y, 0.1);

  translate(width/2, height/2, 0);
  
  // Adjust rotation limit and maping
  float rotX = map(smoothY, 16400, -16400, PI/1.9, -PI/1.9);
  float rotZ = map(smoothX, -16400, 16400, -PI/1.9, PI/1.9);

  rotateX(rotX);
  rotateZ(rotZ);

pushMatrix();
  fill(50); // Black
  box(150, 10, 250); // Phone shape
  translate(0, -6, 0); 
  fill(0, 200, 255, 200); // Display color
  box(140, 2, 240); // Display
popMatrix();
}

void serialEvent(Serial myPort) {
  String input = myPort.readStringUntil('\n');
  if (input != null) {
    input = trim(input);
    float[] v = float(split(input, ","));
    if (v.length >= 3) {
      x = v[0]; 
      y = v[1]; 
      z = v[2];
    }
  }
}
