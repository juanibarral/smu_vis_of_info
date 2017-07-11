class View1 extends PApplet
{
  private color bgColor;
  
  private int posX;
  private int posY;
  private int radius;
  private color ellipseColor;
  private boolean inside;
  
  private Controller controller;
  
  public View1(Controller _controller)
  {
    bgColor = color(0);  
    posX = 150;
    posY = 250;
    radius = 100;
    ellipseColor = color(255);
    controller = _controller;
    inside = false;
  }
  
  public void settings()
  {
    size(300, 500);
  }
  
  public void draw()
  {
    background(bgColor);
    
    fill(ellipseColor);
    ellipse(posX, posY, radius, radius);
    
    float distance = dist(mouseX, mouseY, posX, posY);
    if(distance <= (radius / 2) && !inside)
    {
      inside = true;
      controller.update(1, true);
    }
    else if (distance > (radius / 2) && inside)
    {
      inside = false;
      controller.update(1, false);
    }
  }
  
  public void setRadius(int _radius)
  {
    radius = _radius;
  }
  
  public void update(boolean inside)
  {
    if(inside)
    {
      bgColor = color(255);
      ellipseColor = color(0);
    }
    else
    {
      bgColor = color(0);
      ellipseColor = color(255);
    }

  }
}