abstract class Renderable
{
  private PVector pos;
  private float angle;
  public Renderable()
  {
    pos = new PVector(0, 0, 0);
    angle = 0;
  }
  
  public void updateAngle(float newAngle)
  {
    angle = newAngle;
  }
  
  public void updatePosition(PVector newPosition)
  {
    pos = newPosition;
  }
  public PVector getPosition()
  {
    return pos;
  }
  
  public void draw()
  {
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      rotateY(angle);
      render();
    popMatrix();
  }
  abstract void render();
}
