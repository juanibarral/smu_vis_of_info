class View extends PApplet
{
  private PVector[] points;
  private boolean update;
  private Controller myController;
  
  public void setController(Controller pController)
  {
    myController = pController;
  }
  public void settings()
  {
    size(500, 300);
  }
  public void draw()
  {
    background(255,0,0);
    if(update)
      drawPoints();
  }
  
  public void setPoints(PVector[] myPoints)
  {
    points = myPoints;
  }
  
  public void update(boolean b)
  {
    update = b;
  }
  public void drawPoints()
  {
    ellipseMode(CENTER);
    fill(255);
    stroke(0);
    for(int i = 0; i < points.length; i++)
    {
      PVector p = points[i];
      float x = map(p.x, 0, 500, 10, 490);
      float y = map(p.y, 0, 500, 10, 290);
      ellipse(x, y, 10, 10);
      
      float dist = dist(x, y, mouseX, mouseY);
      if(dist < 10)
      {
        ellipse(x, y, 20, 20);  
        myController.updateLine(i);
      }
    }
  }
}