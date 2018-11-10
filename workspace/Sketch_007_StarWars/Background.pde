int starPeriod = 100;
int current = 0;
final static int STARS = 500;
PVector[] stars = new PVector[STARS]; 

void initStars()
{
  for(int i = 0; i < STARS; i++)
  {
    int x = (int)random(CANVAS_WIDTH);
    int y = (int)random(CANVAS_HEIGHT);
    stars[i] = new PVector(x, y);
  }
}
void drawBackground()
{
  current++;
  if(current > starPeriod)
  {
    current = 0;
    for(int i = 0; i < STARS; i++)
    {
      int x = (int)random(CANVAS_WIDTH);
      int y = (int)random(CANVAS_HEIGHT);
      stars[i].x = x;
      stars[i].y = y;
    }
  }
  stroke(255);
  for(int i = 0; i < STARS; i++)
  {
    point(stars[i].x, stars[i].y);
  }
}
