class Star extends Circle2DHoverable
{
  public Star(int pRadius)
  {
    super(pRadius, color(255, 255, 0), color(100, 100, 0));
  }
  
  protected void createObject()
  { //<>//
    super.createObject();
   //createCircle();
    createStar(0, 0, radius/2, radius, 7);
    
  }
  
  void createStar(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
