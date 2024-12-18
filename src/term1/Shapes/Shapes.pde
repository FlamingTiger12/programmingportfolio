// Katelyn Lin | Shapes Assignment | 21 August 2024

void setup() {
  size(650,550);
  background(130);
}

void draw() {  
  background(130);
    
  stroke(0,0,0);
  line(100,0,100,550);
  line(200,0,200,550);
  line(300,0,300,550);
  line(400,0,400,550);
  line(500,0,500,550);
  line(600,0,600,550);
  line(0,100,650,100);
    
  fill(255,255,0);
  rect(25,25,120,120);
  rect(180,25,120,120,25);
  rect(340,25,120,120,25,15,35,45);
  rect(500,40,120,75);

  fill(255,0,0);
  ellipse(80,250,120,120);
  ellipse(240,250,120,75);
  ellipse(400,250,75,120);

  fill(0,0,255);
  triangle(500,300,620,300,560,180);
  triangle(25,420,140,460,40,340);

  fill(0,255,255);
  quad(180,340,300,340,300,380,180,460);
  quad(400,340,440,400,400,460,360,400);
  quad(500,340,620,400,500,460,560,400);
}
