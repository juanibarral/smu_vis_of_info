class BoxCollider implements Collider
{
  private int boxWidth;
  private int boxHeight;
  private PVector position;
 
 public BoxCollider(int boxWidth, int boxHeight)
 {
   this.boxWidth = boxWidth;
   this.boxHeight = boxHeight;
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
 
  boolean checkCollision(Collider c)
  {
    BoxCollider collider = (BoxCollider)c;
    boolean collision = false;
    
    PVector[] vertices = {
      new PVector(position.x - (boxWidth / 2), position.y - (boxHeight / 2)),
      new PVector(position.x + (boxWidth / 2), position.y - (boxHeight / 2)),
      new PVector(position.x - (boxWidth / 2), position.y + (boxHeight / 2)),
      new PVector(position.x + (boxWidth / 2), position.y + (boxHeight / 2)),
    };  
    
    for(int i = 0; i < vertices.length; i++)
    {
      PVector vertex = vertices[i];
      if(vertex.x >= collider.position.x - (collider.boxWidth / 2) && 
         vertex.x <= collider.position.x + (collider.boxWidth / 2) &&
         vertex.y >= collider.position.y - (collider.boxHeight / 2)&& 
         vertex.y <= collider.position.y + (collider.boxHeight / 2)
        )
      {
        collision = true;
        break;
      }
    }
    
    if(!collision)
    {
      vertices[0] = new PVector(collider.position.x - (boxWidth / 2), collider.position.y - (collider.boxHeight / 2));
      vertices[1] = new PVector(collider.position.x + (boxWidth / 2), collider.position.y - (collider.boxHeight / 2));
      vertices[2] = new PVector(collider.position.x - (boxWidth / 2), collider.position.y + (collider.boxHeight / 2));
      vertices[3] = new PVector(collider.position.x + (boxWidth / 2), collider.position.y + (collider.boxHeight / 2));
      
      for(int i = 0; i < vertices.length; i++)
      {
        PVector vertex = vertices[i];
        if(vertex.x >= position.x - (boxWidth / 2) && 
           vertex.x <= position.x + (boxWidth / 2) &&
           vertex.y >= position.y - (boxHeight / 2)&& 
           vertex.y <= position.y + (boxHeight / 2)
          )
        {
          collision = true;
          break;
        }
      }
    }
    return collision;
  }
  
  public void renderCollider()
  {
    stroke(255,0,0);
    noFill();
    rectMode(CENTER);
    rect(position.x, position.y, boxWidth, boxHeight);
  }
}