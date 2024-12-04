class Laser {
  //Member Variables
  int x, y, w, h, speed;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 3;
  }

  //Member Methods
  void display() {
    noStroke();
    rectMode(CENTER);
    fill(255, 128, 0);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-100) {
      return true;
    } else {
      return false;
    }
  }

  boolean hit(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
