abstract class GameObject
{
  protected PVector position;
  
  public GameObject()
  {
    position = new PVector(0,0);
  }
  
  public GameObject(PVector initialPosition)
  {
    position = initialPosition;
  }
  
  public void updatePosition(PVector newPosition)
  {
    position = newPosition;
  }
  
  public PVector getCurrentPosition()
  {
    return position;
  }
  public void drawObject()
  {
    pushMatrix();
      translate(position.x, position.y);
      buildObject();
    popMatrix();
  }
  
  abstract void buildObject();
}
