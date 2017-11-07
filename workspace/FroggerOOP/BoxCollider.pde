class BoxCollider implements Collider
{
  private PVector position;
  private int colliderWidth;
  private int colliderHeight;
  
  public BoxCollider(PVector pPosition, int pWidth, int pHeight)
  {
    position = pPosition;
    colliderWidth = pWidth;
    colliderHeight = pHeight;
  }
  public boolean calculateCollision(Collider pCollider)
  {
    boolean isColliding = false;
    if(pCollider instanceof BoxCollider)
    {
      
    }
    else if(pCollider instanceof CircleCollider)
    {
     
    }
    return isColliding;
  }
  
  public void updatePosition(PVector newPosition)
  {
  }
  
  public void renderCollider()
  {
    rectMode(CORNER);
    noFill();
    stroke(255,0,0);
    rect(position.x, position.y, colliderWidth, colliderHeight);
  }
}