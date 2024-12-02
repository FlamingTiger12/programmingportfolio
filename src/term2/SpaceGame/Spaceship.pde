class Spaceship {
  //Member Variables
  int x, y, w, laserCount, turretCount, health;
PImage ship;

  //Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 32;
    turretCount = 2;
    health = 100;
    ship = loadImage("blue2.gif");
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    ship.resize(80,80);
    image(ship, x, y);
    //noStroke();
    //fill(127);
    ////Thruster
    //fill(246, 178, 107);
    //quad(x-5, y+15, x+5, y+15, x+9, y+20, x-9, y+20);
    ////Left Guns
    //rect(x-20, y-8, 2, 5);
    //rect(x-15, y-6, 2, 5);
    ////Right Guns
    //rect(x+18, y-8, 2, 5);
    //rect(x+13, y-6, 2, 5);
    ////Wings
    //fill(11, 83, 148);
    //quad(x-10, y-5, x+10, y-5, x+35, y+15, x-35, y+15);
    //fill(7, 55, 99);
    //quad(x-25, y-5, x+25, y-5, x+8, y+15, x-8, y+15);
    ////Body
    //fill(61, 133, 198);
    //triangle(x, y-35, x+15, y+12, x-15, y+12);
    ////Cockpit
    //fill(246, 178, 107);
    //ellipse(x, y-8, 20, 30);
    //fill(249, 203, 156);
    //ellipse(x, y-13, 13, 17);
    //fill(252, 229, 205);
    //ellipse(x, y-15, 5, 7);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount >= turretCount) {
      return true;
    } else {
      return false;
    }
  }

  boolean crash(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
