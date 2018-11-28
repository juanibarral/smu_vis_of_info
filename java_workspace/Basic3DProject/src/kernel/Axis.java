package kernel;
import processing.core.*;

class Axis
{
  private PApplet p;
  
  public Axis(PApplet _p)
  {
    p = _p;
  }
  
  public void draw()
  {
    p.stroke(255, 0, 0);
    p.line(0, 0, 0, 500, 0, 0);
    p.stroke(0, 255, 0);
    p.line(0, 0, 0, 0, 500, 0);
    p.stroke(0, 0, 255);
    p.line(0, 0, 0, 0, 0, 500);
  }
}
