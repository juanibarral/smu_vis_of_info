abstract class Abstract3DObject
{
  protected PVector position;
  
  public Abstract3DObject()
  {
    position = new PVector(0, 0, 0);
  }
  
  public void setPosition(PVector _pos)
  {
    position = _pos;
  }
  
  protected void transform(){};
  protected abstract void createObject();
  
  public void render()
  {
    pushMatrix();
      transform();
      createObject();
    popMatrix();
  }
}
