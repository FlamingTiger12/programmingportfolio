class Powerup {
  //Member Variables
  int x, y, diam, speed;
  char type;
  PImage health, energy, strength;

  //Constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = 25;
    speed = 3;
    health = loadImage("health.gif");
    energy = loadImage("ammo.gif");
    strength = loadImage("strength.gif");
    int rand = int(random(3));
    if (rand == 0) { //Health Benefit
      type = 'h';
    } else if (rand == 1) { //Laser Count/Ammo Benefit
      type = 'a';
    } else if (rand == 2) {
      type = 't';
    }
    //else if (rand == 3) { //Increase Laser Strenghth
    //} else if (rand == 4) { //Increase Turret Count
    //} else if (rand == 5) { //Heat-Seeking Lasers
    //} else if (rand == 6) { //Bomb (Remove All Enemies
    //} else if (rand == 7) { //Temporary Score Multiplier
    //} else if (rand == 8) {
    //}
  }

  //Member Methods
  void display() {
    if (type == 'h') {
      image(health, x, y);
    } else if (type == 'a') {
      image(energy, x, y);
    } else if (type == 't') {
      image(strength, x, y);
    }
    //imageMode(CENTER);
    //rock1.resize(diam, diam);
    //image(rock1, x, y);
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

  boolean buff(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}

// IDEAS FOR POWERUPS
// 0. Health Benefit
// 1. Laser Count Benefit
// 3. Increase Turret Count
// 4. Increase Laser Strength
// 5. Heat-Seeking Lasers
// 6. Bomb (Remove All Enemies)
// 7. Temporary Score Multiplier
// 8. Temporary Shield/Invincibility
// 9. Enemy Speed Decrease
// 10. Random
