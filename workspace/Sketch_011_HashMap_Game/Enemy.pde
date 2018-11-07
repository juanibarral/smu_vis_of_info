class Enemy extends GameObject
{
  private int velocity;
  private boolean toBeRemoved;
  public Enemy(PVector initialPosition, int _velocity)
  {
    super(initialPosition);
    velocity = _velocity;
    toBeRemoved = false;
  }
  
  public void updatePosition()
  {
    position.y += velocity;
  }
  
  void buildObject()
  {
    rect(0, 0, 10, 50);
  }
  
  void setToBeRemoved()
  {
    toBeRemoved = true;
  }
  
  boolean isToBeremoved()
  {
    return toBeRemoved;
  }
}
