class Enemy extends GameObject
{
  protected void createObject()
  {
    stroke(0);
    fill(255);
    rectMode(CENTER);
    rect(0,0, 50, 50);
    
    bbox[TOP_LEFT] = new PVector(-25,-25);
    bbox[BOTTOM_RIGHT] = new PVector(25,25);
    
    //collider = new BoxCollider(60,60);
    collider = new CircleCollider(60);
  }
  
  public void renderObject()
  {
    moveForward();
    super.renderObject();
    
    collider.setPosition(globalPosition);
    collider.renderCollider();
  }
}