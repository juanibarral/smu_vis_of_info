class View2 extends PApplet
{
  private color bgColor;
  
  private int posX;
  private int posY;
  private int side;
  private color rectColor;
  private boolean inside;
  
  public View2()
  {
    bgColor = color(255);
    
    posX = 250;
    posY = 150;
    side = 100;
    rectColor = color(0);
    inside = false;
  }
  public void settings()
  {
    size(500, 300);
  }
  
  
  public void draw()
  {
    background(bgColor);
    
    rectMode(CENTER);
    fill(rectColor);
    rect(posX, posY, side, side);
    
    boolean check = false;
    if(mouseX >= (posX - (side/2)) && mouseX <= (posX + (side/2)) &&
        mouseY >= (posY - (side/2)) && mouseY <= (posY + (side/2)))
    {
      check = true;
      
    }
    if(check && !inside)
    {
      inside = true;
      controller.update(2, true);
    }
    else if(!check && inside)
    {
      inside = false;
      controller.update(2, false);
    }
  }
  
  public void setSide(int _side)
  {
    side = _side;
  }
  
  public void update(boolean inside)
  {
    if(inside)
    {
      bgColor = color(0);
      rectColor = color(255);
    }
    else
    {
      bgColor = color(255);
      rectColor = color(0);
    }

  }
  
}