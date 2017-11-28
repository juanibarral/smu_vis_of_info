package kernel;
import processing.core.*;

class Axes
{
  private PApplet p;
  
  public Axes(PApplet pApplet)
  {
    p = pApplet;
  }
  
  public void render()
  {
    p.stroke(255,0,0);
    p.line(0,0,0,500,0,0);
    p.stroke(0,255,0);
    p.line(0,0,0,0,500,0);
    p.stroke(0,0,255);
    p.line(0,0,0,0,0,500);
  }
}