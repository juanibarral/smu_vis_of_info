static final int CANVAS_WIDTH = 500;
static final int CANVAS_HEIGHT = 500;
static final int ELLIPSE_DIAMETER = 20;
static final int NUM_OBJECTS = 20;

float overallVel = 200;
float[] velocities = new float[NUM_OBJECTS];
float[] positions = new float[NUM_OBJECTS];
float[] angles = new float[NUM_OBJECTS];

float angleStep = PI / NUM_OBJECTS;
boolean showLines = false;

int initialColor = color(255, 0, 0);
int finalColor = color(0, 255, 0);

void settings()
{
  size(CANVAS_WIDTH * 3, CANVAS_HEIGHT);
  for(int i = 0; i < NUM_OBJECTS; i++)
  {
    velocities[i] = i * PI / ( NUM_OBJECTS);
    angles[i] = i * angleStep;
  }  
}

void draw()
{
  background(200);
  drawCircleIllution();
  drawExplanation();
}

void keyPressed()
{
  if(key == ' ')
  {
    showLines = !showLines;
  }
  else if(key == 'p')
  {
    overallVel = overallVel == 200 ? 0 : 200;
  }
  else if(key == 'r')
  {
    for(int i = 0; i < NUM_OBJECTS; i++)
    {
      velocities[i] = i * PI / ( NUM_OBJECTS);
      angles[i] = i * angleStep;
    }  
  }
}
