abstract class Circle2D extends Object2D
{
  protected int radius;
  protected color baseColor;
  
  public Circle2D(int pRadius, color bColor)
  {
    baseColor = bColor;
    radius = pRadius;
  }
  
  public boolean isInside(PVector point)
  {
    boolean isInside = false;
    float distance = dist(pos.x, pos.y, point.x, point.y);
    if(distance <= radius)
    {
      isInside = true;    
    }
    return isInside;
  }
  
  public boolean isOverlaping(Circle2D o)
  {
    boolean isOverlaped = false;
    float distance = dist(pos.x, pos.y, o.pos.x, o.pos.y);
    if(distance <= radius + o.radius) {
      isOverlaped = true;
    }
    return isOverlaped;
  }

  protected void createCircle()
  {
    ellipseMode(CENTER);
    ellipse(0, 0, radius*2 , radius*2);
  }
}
