import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
int backButtonPin = 2;
int nextButtonPin = 3;
PImage O1;
PImage O2;
PImage O3;
PImage O4;
PImage O5;

final static int MAX = 4, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;
boolean buttonPressed = false;
void setup() {
  size(2500, 2500);
  O1 = loadImage("O1.png");
  O2 = loadImage("O2.png");
  O3 = loadImage("O3.png");
  O4 = loadImage("O4.png");
  O5 = loadImage("O5.png");
  arduino = new Arduino(this, "COM7", 57600);
  arduino.pinMode(backButtonPin, Arduino.INPUT);
  arduino.pinMode(nextButtonPin, Arduino.INPUT);
  frameRate(50);
  smooth();
  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  cx = width >> 1;
  cy = height >> 1;
  redraw();
}
void draw() {
  if (buttonPressed == false) {
    if (arduino.digitalRead(backButtonPin) == Arduino.HIGH && page > 0) {
      --page;
      buttonPressed = true;
    }
    if (arduino.digitalRead(nextButtonPin) == Arduino.HIGH && page < MAX) {
      ++page;
      buttonPressed = true;
    }
  } else {
    if (arduino.digitalRead(backButtonPin) == Arduino.LOW && arduino.digitalRead(nextButtonPin) == Arduino.LOW) {
      buttonPressed = false;
    }
  }
  background(0300);
  textSize(0100);
  text("Page #" + (page + 1), cx, cy);
  method("page" + page);
}
void page0() { 
  image(O1, 0, 0);
  if (keyPressed){if(key == '1'){
  arduino.digitalWrite(8,Arduino.HIGH);}}
  arduino.digitalWrite(9,Arduino.LOW);
   arduino.digitalWrite(10,Arduino.LOW);
    arduino.digitalWrite(11,Arduino.LOW);
     arduino.digitalWrite(12,Arduino.LOW);
}
void page1() { 
  image(O2, 0, 0);
  if (keyPressed){if(key == '2'){
  arduino.digitalWrite(9,Arduino.HIGH);}}
  arduino.digitalWrite(8,Arduino.LOW);
   arduino.digitalWrite(10,Arduino.LOW);
    arduino.digitalWrite(11,Arduino.LOW);
     arduino.digitalWrite(12,Arduino.LOW);
}
void page2() { 
  image(O3, 0, 0);
  if (keyPressed){if(key == '3'){
  arduino.digitalWrite(10,Arduino.HIGH);}}
  arduino.digitalWrite(8,Arduino.LOW);
   arduino.digitalWrite(9,Arduino.LOW);
    arduino.digitalWrite(11,Arduino.LOW);
     arduino.digitalWrite(12,Arduino.LOW);
  
}
void page3() { 
  image(O4, 0, 0);
  if (keyPressed){if(key == '4'){
  arduino.digitalWrite(11,Arduino.HIGH);}}
   arduino.digitalWrite(10,Arduino.LOW);
  arduino.digitalWrite(8,Arduino.LOW);
  arduino.digitalWrite(9,Arduino.LOW);
  arduino.digitalWrite (12,Arduino.LOW);
}
void page4() { 
  image(O5, 0, 0);
  if (keyPressed){if(key == '5'){
  arduino.digitalWrite(12,Arduino.HIGH);}}
  arduino.digitalWrite(10,Arduino.LOW);
  arduino.digitalWrite(8,Arduino.LOW);
  arduino.digitalWrite(9,Arduino.LOW);
  arduino.digitalWrite(11,Arduino.LOW);
}