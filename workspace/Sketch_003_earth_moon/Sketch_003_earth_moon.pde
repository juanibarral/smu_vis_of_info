
float earthVel = 0;
float moonVel = 0;

void setup()
{
  size(800, 800); 
}

void draw()
{
  background(255);
  
  noFill();
  stroke(0);
  ellipseMode(CENTER);
  ellipse(400, 400, 500, 500); 
  drawSun();
  
  earthVel += TWO_PI / 600;
  moonVel += TWO_PI /600;
  translate(400, 400);
  pushMatrix();
    rotate(earthVel);
    translate(250, 0);
    drawEarth();
    pushMatrix();
      rotate(moonVel);
      translate(50, 0);
      fill(200);
      ellipse(0,0, 20, 20);
    popMatrix();
  popMatrix();
}

void drawSun()
{
  fill(255, 255, 0);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(400, 400, 100, 100);
  
}

void drawEarth()
{
  fill(0, 255, 0);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(0, 0, 50, 50);
  noFill();
  ellipse(0, 0, 100, 100);
}