abstract class GameObject
{
  protected PVector position;
  protected PVector velocity;
  protected int rotation;
  protected int objectColor;
  protected Collider myCollider;
  protected boolean renderCollider;
  
  public GameObject()
  {
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    rotation = 0;
    objectColor = color(0);
  }
  
  public void setRenderCollider(boolean b)
  {
    renderCollider = b;
  }
  
  public void setCircleCollider(int radius)
  {
    myCollider = new CircleCollider(radius, position);
  }
  
  public void setBoxCollider(PVector pos, int cWidth, int cHeight)
  {
    myCollider = new BoxCollider(pos, cWidth, cHeight);
  }
  
  public void setColor(int pColor)
  {
    objectColor = pColor;
  }
  
  public void updatePosition(PVector newPosition)
  {
    position = newPosition;
    if(myCollider != null)
    {
      myCollider.updatePosition(newPosition);
    }
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public abstract void createObject();
  
  public void renderObject()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    fill(objectColor);
    stroke(0);
    createObject();
    if(myCollider != null && renderCollider)
    {
      myCollider.renderCollider();
    }
    popMatrix();
  }
  
  public boolean isCollider()
  {
   return myCollider != null; 
  }
  
  public boolean checkCollision(GameObject otherObject)
  {
    return myCollider.calculateCollision(otherObject.myCollider);
  }
  
  public void setVelocity(PVector pVelocity)
  {
    velocity = pVelocity;
  }
  
  public void move()
  {
    position.x += velocity.x;
    position.y += velocity.y;
    if(position.x > WINDOW_WIDTH)
    {
      position.x = 0;
    }
    if(position.y > WINDOW_HEIGHT)
    {
      position.y = 0;
    }
  }
}