// Angle of rotation
float angle = 0;
// Angular velocity
float vel = 0.01;
// Launch bullet
boolean launch = false;
// Position of bullet
PVector pos;
// Velocity of bullet
int velBullet = 1;

void settings()
{
  size(500, 500);
  
  println("Press space bar to launch bullet");
}

void draw()
{
  background(200);
  angle += vel;
  if(angle > 2 * PI)
  {
    angle = 0;
  }
  pushMatrix();
    translate(250, 250);
    fill(255, 255, 0);
    ellipse(0, 0, 50, 50);
    pushMatrix();
      rotate(angle);
      translate(150, 0);
      fill(0, 0, 255);
      ellipse(0, 0, 20, 20);
      if(launch && pos == null)
      {
        pos = getPosition();
      }
    popMatrix();
  popMatrix();
  
  if(pos != null)
  {
    pos.y += velBullet;
    rect(pos.x, pos.y, 15, 15);
  }
}
/**
 * Get global position of current transformatioon matrix
 */
PVector getPosition()
{
  float[] tMatrix = new float[6];
  PMatrix2D m = (PMatrix2D)getMatrix();
  m.get(tMatrix);
  return new PVector(tMatrix[2], tMatrix[5]);
}

void keyPressed()
{
  if(key == ' ')
  {
    launch = !launch;
    if(!launch)
    {
      pos = null;
    }
  }
}
