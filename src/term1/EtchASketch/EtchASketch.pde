//Katelyn Lin | Etch-A-Sketch | 18 September 2024

int x, y;
PImage e1;

void setup() {
  size(800, 658);
  background(180);
  x = width/2;
  y = height/2;
  e1 = loadImage("Etch.png");
}

void draw() {
  image(e1, 0, 0);
  strokeWeight(3);
  point(x, y);

//General Controls and Clearing
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y-=1;
    } if (key == 's' || key == 'S') {
      y+=1;
    } if (key == 'a' || key == 'A') {
      x-=1;
    } if (key == 'd' || key == 'D') {
      x+=1;
    } if (key == ' ') {
      background(180);
    }
  }
  //Saving
  saveFrame("line-######.png");
}

//Precise Controls
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y=y-1;
    } else if (keyCode == DOWN) {
      y=y+1;
    } else if (keyCode == RIGHT) {
      x=x+1;
    } else if (keyCode == LEFT) {
      x=x-1;
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
