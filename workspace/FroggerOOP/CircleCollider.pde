class CircleCollider implements Collider 
{
  private int radius;
  private PVector position;
  public CircleCollider(int pRadius, PVector pPosition)
  {
    radius = pRadius;
    position = pPosition;
  }
  
  public void updatePosition(PVector newPosition)
  {
    position = newPosition;
  }
  
  public boolean calculateCollision(Collider pCollider)
  {
    boolean isColliding = false;
    if(pCollider instanceof CircleCollider )
    {
      float distance = dist(position.x, 
                            position.y, 
                            ((CircleCollider)pCollider).position.x, 
                            ((CircleCollider)pCollider).position.y);
      if(distance < radius + ((CircleCollider)pCollider).radius)
      {
        isColliding = true;
      }
    }
    else if(pCollider instanceof BoxCollider)
    {
       //<>//
    }
    return isColliding;
  }
  
  public void renderCollider()
  {
    ellipseMode(CENTER);
    noFill();
    stroke(255,0,0);
    ellipse(0,0, radius * 2, radius * 2);
  }
}