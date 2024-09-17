//Katelyn Lin | Grades App | 13 September 2024

float grade;

void setup() {
  size(400, 150);
  background(200);
}

void draw() {
  background(200);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Grades by Katelyn", width/2, 40);

  //Lines
  strokeWeight(2);
  line(0, 95, width, 95);
  for (int i=50; i<=width; i+=100) {
    line(i, 92, i, 98);
    textSize(15);
    text((float)i/width*4, i, 120);
  }
  for (int i=0; i<=width; i+=100) {
    line(i, 90, i, 100);
    text((float)i/width*4, i, 120);
  }

  //Marker
  strokeWeight(0);
  fill(255);
  ellipse(mouseX, 95, 8, 8);
  textSize(15);
  text((float)mouseX/width*4, mouseX, 90);
  
  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  fill(255,0,0);
  if (tgrade>=3.51) {
    text ("Assign letter grade A.", width/2, 140);
  } else if (tgrade>=3.00) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade -A.", width/2, 140);
  } else if (tgrade>=2.84) {
    text ("Assign letter grade B+.", width/2, 140);
  } else if (tgrade>=2.67) {
    text ("Assign letter grade B.", width/2, 140);
  } else if (tgrade>=2.50) {
    text ("Assign letter grade B-.", width/2, 140);
  } else if (tgrade>=2.34) {
    text ("Assign letter grade C+.", width/2, 140);
  } else if (tgrade>=2.17) {
    text ("Assign letter grade C.", width/2, 140);
  } else if (tgrade>=2.00) {
    text ("Assign letter grade C-.", width/2, 140);
  } else if (tgrade>=1.66) {
    text ("Assign letter grade D+.", width/2, 140);
  } else if (tgrade>=1.33) {
    text ("Assign letter grade D.", width/2, 140);
  } else if (tgrade>=1.00) {
    text ("Assign letter grade D-.", width/2, 140);
  } else {
    text ("Assign letter grade F.", width/2, 140);
  }
}

