abstract class Object2D implements Renderable
{
  protected PVector pos;
  protected Object data;
  
  public Object2D() {
    pos = new PVector(0, 0);
  }
  
  public Object getData()
  {
    return data;
  }
  
  public void setData(Object _data)
  {
   data = _data; 
  }
  
  public PVector getPosition()
  {
    return pos;
  }
  
  public void setPosition(PVector newPosition)
  {
    pos = newPosition;
  }
  
  protected abstract void createObject();
  protected void transform()
  {
    translate(pos.x, pos.y);
  }
  public void render()
  {
    pushMatrix();
      transform();
      createObject();
    popMatrix();
  }
}
