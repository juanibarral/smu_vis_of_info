class Circle extends Circle2DHoverable
{
  public Circle(int radius)
  {
    super(radius, color(200), color(100));
  }
  
  protected void createObject()
  {
    super.createObject();
    createCircle();
  }
}
