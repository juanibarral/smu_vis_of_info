class CircleEnemy extends GameObject
{
  protected void createObject()
  {
    
    ellipseMode(CENTER);
    noFill();
    stroke(255,0,0);
    ellipse(0,0, 25,25);
  }
  
  public void renderObject()
  {
    moveForward();
    super.renderObject();
  }
}