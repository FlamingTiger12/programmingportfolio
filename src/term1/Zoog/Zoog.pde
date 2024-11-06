// Katelyn Lin | Zoog | 26 August 2024

void setup() {
  size(500, 500);
}

void draw() {
  //background(255);
  drawZoog(int(random(width)), int(random(height)));
}

void drawZoog(int x, int y) {
  strokeWeight(1);
  ellipseMode(CENTER);
  rectMode(CENTER);

  //Arms
  stroke(0, 0, 0);
  line(x-30, y, x+30, y);

  //Body
  fill(int(random(255)), int(random(255)), int(random(255)));
  rect(x, y, 20, 100);

  //Head
  fill(255);
  ellipse(x, y-30, 60, 60);

  //Eyes
  fill(0);
  ellipse(x-19, y-30, 16, 32);
  ellipse(x+19, y-30, 16, 32);
  fill(255, 255, 255);
  ellipse(x-15, y-35, 4, 8);
  ellipse(x+23, y-35, 4, 8);

  //Tie
  fill(int(random(255)), int(random(255)), int(random(255)));
  ellipse(x, y+20, 5, 40);
  triangle(x-7, y, x+7, y, x, y+7);

  //Legs
  stroke(0, 0, 0);
  line(x-10, y+50, x-20, y+60);
  line(x+10, y+50, x+20, y+60);

  //Hat
  fill(int(random(255)), int(random(255)), int(random(255)));
  rect(x, y-65, 30, 20);
  rect(x, y-55, 50, 5);
  fill(int(random(255)), int(random(255)), int(random(255)));
  rect(x, y-60, 30, 5);
}
