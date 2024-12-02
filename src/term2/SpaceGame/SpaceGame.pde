//Katelyn Lin | 6 November 2024 | SpaceGame //<>// //<>//
import processing.sound.*;
SoundFile laser, wind, boomy;
Spaceship blue;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level;
boolean play;
PImage boom;
Timer rTime, pTime, wTime;             

void setup() {
  boom = loadImage("boom.gif");
  size (600, 500);
  blue = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rTime = new Timer(1000); //Rock Timer
  pTime = new Timer(5000); //Powerup Timer
  wTime = new Timer(9000); //Wind Sound Timer
  //bTime = new Timer(1000); //Hopefully Explosion Timer?
  //1000 millies = 1 second
  rTime.start();
  pTime.start();
  wTime.start();
  laser = new SoundFile(this, "laserblue.wav");
  wind = new SoundFile(this, "wind.wav");
  boomy = new SoundFile(this, "boomyplus.wav");
}

void draw() {
  if (!play) {
    startScreen(); //Start Screen
  } else {
    if (wTime.isFinished()) {
      wind.play();
      wTime.start();
    }
    background(7, 0, 31);

    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    //Renders Powerups
    if (pTime.isFinished()) {
      powerups.add(new Powerup());
      pTime.start();
    }
    for (int i = 0; i < powerups.size(); i++) {
      Powerup powerup = powerups.get(i);
      powerup.display();
      powerup.move();

      if (powerup.buff(blue)) { //Has the ship hit a powerup?
        if (powerup.type == 'h') { //Health Benefit
          blue.health += 10;
          text ("+10 Health", powerup.x, powerup.y);
          score += 10;
        } else if (powerup.type == 'a') { //Laser Count/Ammunition Benefit
          blue.laserCount += 10;
          text ("+10 Energy", powerup.x, powerup.y);
          score += 10;
        } else if (powerup.type == 't') { //Turret Count Increase
          blue.turretCount = 4;
          text ("Turret Count = 4", powerup.x, powerup.y);
          score += 10;
        }
        powerups.remove(powerup); //Delete Powerup
      }
      if (powerup.reachedBottom()) { //Has the powerup reached the bottom of the screen?
        powerups.remove(powerup); //Delete laser
      }
    }
    //Renders Lasers & Detects Rock Collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.hit(rock)) {
          rock.diam -= 10;
          lasers.remove(laser);
          if (rock.diam <1) {
            rocks.remove(rock);
            score += rock.diam*-10;
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) { //Has the laser reached the top of the screen?
        lasers.remove(laser); //Delete Laser
      }
    }
    //Rock Timer (Controls how fast the rocks spawn)
    if (rTime.isFinished()) { //Has the timer ended?
      rocks.add(new Rock()); //Create New Rock
      rTime.start(); //Restart Timer
    }
    //Powerup Timer (Controls how fast the powerups spawn)
    if (pTime.isFinished()) { //Has the timer ended?
      powerups.add(new Powerup()); //Create New Powerup
      pTime.start(); //Restart Timer
    }
    //Renders Rocks & Detects Ship Collison
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (blue.crash(rock)) { //Has the ship crashed into a rock?
        score -= rock.diam; //Deduct Points
        blue.health -= rock.diam/2; //Deduct Health
        rocks.remove(rock); //Delete Rock
        //Boom
        imageMode(CENTER);
        boom.resize(rock.diam, rock.diam);
        image(boom, rock.x, rock.y);
        boomy.play();
      }
      if (rock.reachedBottom()) { //Has rocks reached the bottom of the screen?
        rocks.remove(rock); //Delete Rock
      }
    }
    blue.display();
    blue.move(mouseX, mouseY);
    infoPanel();
    if (blue.health < 1) {
      gameOver();
      noLoop();
    }
  }
}

void keyPressed() {
  if (key == ' ' && blue.fire()) { //Has the space key been pressed?
    lasers.add(new Laser(blue.x+17, blue.y)); //Shoot right laser
    lasers.add(new Laser(blue.x-17, blue.y)); //Shoot left laser
    blue.laserCount=blue.laserCount-2; //Deduct Laser Count
    laser.play();
  }
}

void infoPanel() { //Display statistics
  fill(255, 90);
  rectMode(CENTER);
  rect(width/2, height-20, width, 40);
  fill (0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Score: " + score, 120, height-20); //Score
  text("Health: " + blue.health, 240, height-20); //Health
  text("Level: " + level, 360, height-20); //Level
  text("Energy: " + blue.laserCount, 480, height-20); //Ammo or Laser Count
}

void startScreen() {
  textAlign(CENTER, CENTER);
  background(0);
  fill(255);
  textSize(24);
  text("Welcome to", width/2, 50);
  textSize(80);
  text("Space Game", width/2, 100);
  textSize(24);
  text("Created by Katelyn Lin", width/2, 170);
  textSize(20);
  text("Click/Press Space to shoot. Shooting each laser takes one energy.", width/2, 240);
  text("Shoot rocks to increase your score, and don't let your health reach zero.", width/2, 260);
  text("Get powerups to increase health, energy, and other surprises!", width/2, 280);
  textSize(30);
  text ("Good Luck!", width/2, 320);
  textSize(24);
  text("Click/Press Space to Start", width/2, 400);
  if (mousePressed || keyPressed == true && key == ' ') {
    play = true;
    wind.play();
  }
}

void gameOver() {
  textAlign(CENTER, CENTER);
  background(0);
  fill(255);
  textSize(80);
  text("Game Over", width/2, 150);
  textSize(24);
  text("Score:" + score, width/2, 220);
  textSize(24);
  text("Thanks for Playing!", width/2, 350);
  if (mousePressed || keyPressed == true && key == ' ') {
    play = true;
  }
}

void ticker() {
}

void mousePressed() {
  if (blue.fire()&& blue.turretCount == 2) {
    lasers.add(new Laser(blue.x+17, blue.y));
    lasers.add(new Laser(blue.x-17, blue.y));
    blue.laserCount=blue.laserCount-2;
    laser.play();
  } else if (blue.fire()&& blue.turretCount == 4) {
    lasers.add(new Laser(blue.x+20, blue.y));
    lasers.add(new Laser(blue.x-20, blue.y));
    lasers.add(new Laser(blue.x+15, blue.y));
    lasers.add(new Laser(blue.x-15, blue.y));
    blue.laserCount=blue.laserCount-4;
    if (!laser.isPlaying()) {
      laser.play();
    }
  }
}
