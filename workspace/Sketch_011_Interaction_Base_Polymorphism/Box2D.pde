abstract class Box2D extends Object2D
{
  protected int boxWidth;
  protected int boxHeight;
  protected color baseColor;
  
  public Box2D(int pWidth, int pHeight, color bColor)
  {
    baseColor = bColor;
    boxWidth = pWidth;
    boxHeight = pHeight;
  }
  
  public boolean isInside(PVector point)
  {
    boolean isInside = false;
    if(point.x > pos.x && point.x < pos.x + boxWidth &&
      point.y > pos.y && point.y < pos.y + boxHeight)
    {
      isInside = true;    
    }
    return isInside;
  }
  
  public boolean isOverlaping(Box2D o)
  {
    boolean isOverlaped = false;
    
    PVector[] points = new PVector[]{
        new PVector(o.pos.x, o.pos.y),
        new PVector(o.pos.x + o.boxWidth, o.pos.y),
        new PVector(o.pos.x + o.boxWidth, o.pos.y + o.boxHeight),
        new PVector(o.pos.x, o.pos.y + o.boxHeight)
    };
    for(PVector point : points)
    {
      if(isInside(point))
      {
        isOverlaped = true;
        break;
      }
    }
    if(!isOverlaped)
    {
      points = new PVector[]{
          new PVector(pos.x, pos.y),
          new PVector(pos.x + boxWidth, pos.y),
          new PVector(pos.x + boxWidth, pos.y + boxHeight),
          new PVector(pos.x, pos.y + boxHeight)
      };
      for(PVector point : points)
      {
        if(o.isInside(point))
        {
          isOverlaped = true;
          break;
        }
      }
    }
    return isOverlaped;
  }
  
  public void createBox()
  {
    rectMode(CORNER);
    rect(0, 0, boxWidth, boxHeight);
  }
}
