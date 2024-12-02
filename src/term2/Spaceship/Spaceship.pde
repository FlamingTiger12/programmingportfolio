//Katelyn Lin | 30 October 2024 | Spaceship

void setup() {
  size(600, 500);
}

void draw() {
  background(7, 0, 31);
  drawShipBlue(mouseX-5, mouseY);
  drawShipRed(mouseX+5, mouseY);
}

void drawShipBlue(int x, int y) {
  noStroke();
  //Thruster
  fill(246, 178, 107);
  quad(x-5, y+15, x+5, y+15, x+9, y+20, x-9, y+20);
  //Left Guns
  rect(x-20,y-10,2,5);
  rect(x-15,y-8,2,5);
  //Right Guns
  rect(x+18,y-10,2,5);
  rect(x+13,y-8,2,5);
  //Wings
  fill(11, 83, 148);
  quad(x-10, y-5, x+10, y-5, x+35, y+15, x-35, y+15);
  fill(7, 55, 99);
  quad(x-25, y-5, x+25, y-5, x+8, y+15, x-8, y+15);
  //Body
  fill(61, 133, 198);
  triangle(x, y-35, x+15, y+12, x-15, y+12);
  //Cockpit
  fill(246, 178, 107);
  ellipse(x, y-8, 20, 30);
  fill(249, 203, 156);
  ellipse(x, y-13, 13, 17);
  fill(252, 229, 205);
  ellipse(x, y-15, 5, 7);
}

void drawShipRed(int x, int y) {
  noStroke();
  //Body
  
}
