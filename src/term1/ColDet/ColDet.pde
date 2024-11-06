//Katelyn Lin | ColDet | 09 September 2024
int xspeed, yspeed, xpos, ypos, wdth, ht;

void setup() {
  windowResize(displayWidth, displayHeight);
  background(0);
  xspeed = 3;
  yspeed = 10;
  wdth = 40;
  ht = 40;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(30);
}

void draw() {
  fill(255);
  ellipse(xpos, ypos, wdth, ht);
  ellipse(xpos+100, ypos+100, wdth, ht);
  xpos = xpos + xspeed;
  ypos += yspeed; //<>//
  if (xpos >= width-wdth/2 || xpos <= ht/2) {
    xspeed = xspeed * -1;
  }
  if (ypos >= height+ht/2 || ypos <= ht/2) {
    yspeed = yspeed * -1;
  }
}
