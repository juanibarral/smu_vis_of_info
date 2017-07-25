class Target extends GameObject
{
  protected void createObject()
  {
    stroke(0);
    noFill();
    line(-10, 0, 10, 0);
    line(0,-10, 0, 10);
  }
}