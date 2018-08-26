int canvasSize = 800;

float alienWavingSpeed = 0.01;
float alienWavingAngle = 0;
boolean alienWavingPositive = true;

float personWavingSpeed = 0.1;
float personWavingAngle = 0;
boolean personWavingPositive = true;

float earthAngle = 0;
float earthVelocity = 0.01;

float spaceshipAngle = 0;
float spaceshipVelocity = 0.02;

void settings()
{
  size(canvasSize, canvasSize);
}

void draw()
{
  background(200);
  stroke(0);

  
  earthAngle += earthVelocity;
  if(earthAngle > 2 * PI)
  {
    earthAngle = 0;
  }
  pushMatrix();
    translate(400, 400);
    rotate(-earthAngle);
    drawEarth();
    pushMatrix();
      translate(0, -50);
      drawPerson();
    popMatrix();
    spaceshipAngle += spaceshipVelocity;
    pushMatrix();
      rotate(spaceshipAngle);
      translate(200, 0);
      drawAlienSpaceship();
      pushMatrix();
        translate(0, -10);
        drawAlien();
      popMatrix();
    popMatrix();
  popMatrix();
}
