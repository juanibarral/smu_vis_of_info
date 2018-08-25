class ControlPoint
{
  private PVector position;
  private int baseSize;
  private int size;
  private int pointColor;
  private int pointFill;
  private int baseWeight;
  private int weight;
  private boolean isHovering;
  
  public ControlPoint(int x, int y){
    position = new PVector(x, y);
    baseSize = 10;
    size = baseSize;
    pointColor = color(0);
    pointFill = color(255);
    baseWeight = 1;
    weight = baseWeight;
  }
  
  public void setPosition(PVector newPosition)
  {
    position = newPosition;
  }
  
  public float getX()
  {
    return position.x;
  }
  
  public float getY()
  {
    return position.y;
  }
  
  public void render()
  {
    ellipseMode(CENTER);
    fill(pointFill);
    stroke(pointColor);
    strokeWeight(weight);
    ellipse(position.x, position.y,size, size);
  }
  
  private boolean isInside(int x, int y)
  {
    boolean isInside = false;
    float distance = dist(position.x, position.y, x, y);
    if(distance <= (size/2))
    {
      isInside = true;
    }
    return isInside;
  }
  
  public boolean checkHovering()
  {
    boolean currentHovering = isInside(mouseX, mouseY);
    if(isHovering != currentHovering)
    {
      isHovering = currentHovering;
      weight = isHovering ? baseWeight + 2 : baseWeight;
      size  = isHovering ? baseSize + 2 : baseSize;
    }
    return isHovering;
  }
}
