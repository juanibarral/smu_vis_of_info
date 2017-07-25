class TriangleEnemy extends CircleEnemy
{
  protected void createObject()
  {
    fill(255, 255, 0);
    triangle(-15, 0, 0, 15, 15, 0);
  }
}