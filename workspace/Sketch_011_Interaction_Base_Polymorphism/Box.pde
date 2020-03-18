class Box extends Box2DHoverable
{
  public Box(int boxWidth, int boxHeight)
  {
    super(boxWidth, boxHeight, color(0, 255, 0), color (0, 100, 0));
  }
  
  protected void createObject()
  {
    super.createObject();
    createBox();
  }
}
