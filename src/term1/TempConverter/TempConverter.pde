//Katelyn Lin | Temp Converter | September 23 2024

void setup() {
  size (400, 200);
}

void draw() {
  //Setup
  background(128);
  rectMode(CENTER);
  textAlign(CENTER);
  
  //Onscreen Info
  textSize(24);
  text("Temperature Converter - Katelyn Lin", width/2, 40);
  textSize(14);
  text("Drag your cursor across \n the line to convert your \n Farhenheit/Celsius value \n to the opposite.", 76, 75);
  text("Formulas \n F->C: (F-32)*(5/9) \n C->F: (C*9/5)+32", 324, 80);
  
  //Line
  strokeWeight(2);
  line (0, 150, width, 150);
  
  //Marker
  fill(255);
  strokeWeight(0);
  ellipse(mouseX, 150, 8, 8);
  
  //Value Box
  rect(width/2,90,90,40);
  
  //Marks
  fill(0);
  textSize(12);
  strokeWeight(1);
  for (int i=0; i<= width; i+=50) {
    line(i, 146, i, 154);
    text(i, i, 164);
  }
  //Values
  text("Cel: " + farToCel(mouseX) + "°C", width/2, 100);
  text("Far: " + celToFar(mouseX) + "°F", width/2, 85);
}

float farToCel(float tempFar) {
  // Formula to calc cel conv.
  tempFar = (tempFar-32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  //Formula to calc far conv.
  tempCel = (tempCel*9.0/5.0)+(32);
  return tempCel;
}
