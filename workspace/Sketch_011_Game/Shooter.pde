public class Shooter extends GameObject
{
  
  public Shooter()
  {
   position = new PVector(300, 500); 
  }
  
  protected void createObject()
  {
    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(0,0,30,30);
    line(0,0,35,0);
  }
  
  public void updateRotationByMouse(int posX, int posY)
  {
    PVector xVector = new PVector(posX - position.x, 0);
    PVector mouseVector = new PVector(posX - position.x, posY - position.y);
    
    float angle = PVector.angleBetween(mouseVector, xVector);
    if(mouseVector.x == position.x)
      angle = PI/2;
    else if(posX < position.x)
      angle = PI -angle;
    setAngle(-angle);
    
    //println(degrees(angle));
    
    //pushMatrix();
    //  translate(position.x, position.y);
    //  line(0,0,xVector.x, xVector.y);
    //popMatrix();
    
    //pushMatrix();
    //  translate(position.x, position.y);
    //  line(0,0,mouseVector.x, mouseVector.y);
    //popMatrix();
    
  }
}