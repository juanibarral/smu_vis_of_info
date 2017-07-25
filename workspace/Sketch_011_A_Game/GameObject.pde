abstract class GameObject 
{
  protected float angle;
  protected PVector position;
  protected float velocity;
  protected PVector localPosition;
  protected PVector[] bbox;
  protected PVector globalPosition;
  
  public static final int TOP_LEFT = 0;
  public static final int BOTTOM_RIGHT = 1;
  
  protected Collider collider;
  protected String id;
  
  public GameObject()
  {
    localPosition = new PVector(0,0);
    bbox = new PVector[2];
    globalPosition = new PVector(0,0);
    id = "";
  }
  
  public Collider getCollider()
  {
    return collider;
  }
  
  public void setId(String _id)
  {
    id = _id;
  }
  
  public String getId()
  {
    return id;
  }
  
  public boolean isCollider()
  {
    return collider != null;
  }
  
  public void moveForward()
  {
    localPosition.x += velocity;
  }
  
  public void setAngle(float _angle)
  {
    angle = _angle;
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public PVector getGlobalPosition()
  {
    return globalPosition;
  }
  
  public float getAngle()
  {
    return angle;
  }
  public void setPosition(PVector _position)
  {
    position = _position;
  }
  
  public void setVelocity(float _velocity)
  {
    velocity = _velocity;
  }
  
  abstract protected void createObject();
  
  public void renderObject()
  {
    pushMatrix();
      translate(position.x, position.y);
      rotate(angle);
      pushMatrix();
       translate(localPosition.x, localPosition.y);
       createObject();  
       fill(0);
       //text("Id: " + id, 0,0);
     popMatrix();
    popMatrix();
    
    globalPosition.x = position.x + (cos(angle) * localPosition.x);
    globalPosition.y = position.y + (sin(angle) * localPosition.x);
    
  }
}