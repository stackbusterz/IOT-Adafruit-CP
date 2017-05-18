#include <Adafruit_CircuitPlayground.h>
#this code helps sense temperature and 
#indicate glasses of water u need to drink on neopixels
#you can consumed water by pressing the left button on ACP
#it reduces the count of lit neopixels
#currently programmed for 75-80 degrees
#Create additional cinditions as needed

float tempC, tempF;
int temp75lightup=5;
int temp75run;
int temp80lightup=6;
int temp80run;

void setup() {
  Serial.begin(9600);
  CircuitPlayground.begin();
  
}

void loop() {
  tempC = CircuitPlayground.temperature();
  tempF = CircuitPlayground.temperatureF();
  
  
  Serial.print("tempC: ");
  Serial.print(tempC);
  Serial.print("  tempF: ");
  Serial.println(tempF);

  delay(1000);

  CircuitPlayground.clearPixels();
  if (CircuitPlayground.leftButton()){
  Serial.print("Button PRESS temp75lightup current value:"); Serial.println(temp75lightup);
  Serial.print("Button PRESS temp80lightup current value:"); Serial.println(temp80lightup);
    temp75lightup --;
    temp80lightup --;
    
    if (temp75lightup < 0) {
    temp75lightup = 0;  
    }

    if (temp80lightup < 0) {
    temp80lightup = 0;  
    }
  Serial.print("Button PRESS temp75lightup New value:"); Serial.println(temp75lightup);
  Serial.print("Button PRESS temp80lightup New value:"); Serial.println(temp80lightup);
  delay (500);
  }

  
  if (tempF >= 75) {
    Serial.print("temp75lightup before NeoPixel loop:"); Serial.println(temp75lightup);
    for (temp75run=0; temp75run <= temp75lightup; temp75run ++ ) {
    Serial.print("temp75run in FOR loop"); Serial.println(temp75run);
    CircuitPlayground.setPixelColor(temp75run,   0,   0, 255);  
    }
    
    /*
    CircuitPlayground.setPixelColor(0,   0,   0, 255);
    CircuitPlayground.setPixelColor(1,   0,   0, 255);
    CircuitPlayground.setPixelColor(2,   0,   0, 255);
    CircuitPlayground.setPixelColor(3,   0,   0, 255);
    CircuitPlayground.setPixelColor(4,   0,   0, 255);
    CircuitPlayground.setPixelColor(5,   0,   0, 255);
    */
  }
  if (tempF >=80) {
    
    Serial.print("temp80lightup before NeoPixel loop:"); Serial.println(temp80lightup);
    for (temp80run=0; temp80run <=temp80lightup; temp80run ++ ) {
    Serial.print("temp80run in FOR loop"); Serial.println(temp80run);
    CircuitPlayground.setPixelColor(temp80run,   0,   0, 255);
    }
    /*
    CircuitPlayground.setPixelColor(0,   0,   0, 255);
    CircuitPlayground.setPixelColor(1,   0,   0, 255);
    CircuitPlayground.setPixelColor(2,   0,   0, 255);
    CircuitPlayground.setPixelColor(3,   0,   0, 255);
    CircuitPlayground.setPixelColor(4,   0,   0, 255);
    CircuitPlayground.setPixelColor(5,   0,   0, 255);
    */
  }
}
