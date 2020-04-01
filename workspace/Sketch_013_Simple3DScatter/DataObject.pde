
class DataObject extends Abstract3DObject
{
  public DataObject(float x, float y, float z)
  {
    setPosition(new PVector(-x, -y, z));
  }
  
  public void transform()
  {
    translate(position.x, position.y, position.z);
  }
  
  protected void createObject()
  {
    fill(255, 0, 0);
    noStroke();
    sphere(10);
    fill(255);
    stroke(0);
  }
}
