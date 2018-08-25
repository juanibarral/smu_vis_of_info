class BezierCurve extends Curve
{
  public BezierCurve()
  {
    super();
  }
  
  protected void drawCurve()
  {
    if(points.size() >= 4)
    {
      for(int i = 0; i < points.size(); i+=3)
      {
        if(points.size() > i + 3)
        {
          vertex(points.get(i).getX(), points.get(i).getY());
          bezierVertex(
            points.get(i + 1).getX(), 
            points.get(i + 1).getY(),
            points.get(i + 2).getX(), 
            points.get(i + 2).getY(),
            points.get(i + 3).getX(), 
            points.get(i + 3).getY()
            );
        }
      }
    }
  }
  
  public void drawControlSegments()
  {
    strokeWeight(1);

    for(int i = 0; i < points.size(); i+=3)
    {
      if(points.size() > i + 3)
      {
        stroke(0);
        fill(0);
        text("a", points.get(i).getX(), points.get(i).getY() + 20);
        text("c1", points.get(i + 1).getX(), points.get(i + 1).getY() + 20);
        text("c2", points.get(i + 2).getX(), points.get(i + 2).getY() + 20);
        text("a", points.get(i + 3).getX(), points.get(i + 3).getY() + 20);
        stroke(0, 0, 255);
        line(
          points.get(i).getX(),
          points.get(i).getY(),
          points.get(i + 1).getX(),
          points.get(i + 1).getY()
          );
          
        line(
          points.get(i + 2).getX(),
          points.get(i + 2).getY(),
          points.get(i + 3).getX(),
          points.get(i + 3).getY()
          );
      }
    }
  }
}
