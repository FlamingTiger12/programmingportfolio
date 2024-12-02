class Rock {
  //Member Variables
  int x, y, diam, speed;
  PImage rock1;

  //Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(20, 80));
    speed = int(random(1, 6));
    rock1 = loadImage("rock1.gif");
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    rock1.resize(diam, diam);
    image(rock1, x, y);
  }

  void move() {
    y+= speed;
  }

  boolean reachedBottom() {
   if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
