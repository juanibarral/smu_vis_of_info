class Frog extends GameObject
{
  public Frog()
  {
    super();
  }
  
  public void createObject()
  {
    ellipseMode(CENTER);
    ellipse(0,0, 50, 50);
  }
  
  public void moveUp()
  {
    position.y -= 10;
  }
  public void moveDown()
  {
    position.y += 10;
  }
  public void moveLeft()
  {
    position.x -= 10;
  }
  public void moveRight()
  {
    position.x += 10;
  }
}