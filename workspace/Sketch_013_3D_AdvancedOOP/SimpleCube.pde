class SimpleCube extends Abstract3DObject
{ 
  public SimpleCube()
  {
    super();
  }
  
  protected void renderObject()
  {
    stroke(255);
    fill(255, 0, 0);    
    box(100);
  }
}
