class View2 extends PApplet
{
  private PVector[] points;
  private boolean update;
  private int index = -1;
  public void settings()
  {
    size(500, 500);
  }
  
  public void update(boolean b)
  {
    update = b;
  }
  
  public void setPoints(PVector[] myPoints)
  {
    points = myPoints;
  }
  
  public void draw()
  {
    background(0,0,255);
    if(update)
      drawLines();
  }
  
  public void drawLines()
  {
    noFill();
    stroke(255);
    
    for(int i = 0; i < points.length -1 ; i++)
    {
      PVector p0 = points[i];
      PVector p1 = points[i + 1];
      strokeWeight(1);
      if(index != -1 && index == i)
        strokeWeight(4);
      line(p0.x, p0.y, p1.x, p1.y);
      
    }
  }
  
  public void changeLine(int pIndex)
  {
    index = pIndex;
  }
}