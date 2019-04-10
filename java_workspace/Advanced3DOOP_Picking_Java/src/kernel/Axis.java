package kernel;

import processing.core.*;

class Axis extends Abstract3DObject
{
  public Axis(PApplet _p)
  {
    super(_p);
  }
  
  protected void renderObject(){
    p.stroke(255, 0, 0);
    p.line(0, 0, 0, 500, 0, 0);
    p.stroke(0, 255, 0);
    p.line(0, 0, 0, 0, 500, 0);
    p.stroke(0, 0, 255);
    p.line(0, 0, 0, 0, 0, 500);
  }
}
