class Bullet extends GameObject
{
  
  public Bullet()
  {
    super();
  }
  protected void createObject()
  {
    stroke(0);
    fill(255);
    rectMode(CENTER);
    rect(0,0, 10, 10);
    
    bbox[TOP_LEFT] = new PVector(-5,-5);
    bbox[BOTTOM_RIGHT] = new PVector(5,5);
    
  }
  
  public void renderObject()
  {
    moveForward();
    super.renderObject();
  }
  

  
  
}