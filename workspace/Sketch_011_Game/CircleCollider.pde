class CircleCollider implements Collider
{
  private PVector position;
  private int diameter;
  
  public CircleCollider(int _diameter)
  {
    diameter = _diameter;
    position = new PVector(0,0);
  }
  
  public void setPosition(PVector _position)
  {
    position = _position;
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public boolean checkCollision(Collider c)
  {
    boolean collision = false;
    CircleCollider collider = (CircleCollider)c;
    float distance = dist(position.x, position.y, collider.position.x, collider.position.y);
    if(distance <= (diameter + collider.diameter) / 2)
      collision = true;
    
    return collision;
  }
  
  public void renderCollider()
  {
    noFill();
    stroke(0,0,255);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, diameter, diameter);
  }
}