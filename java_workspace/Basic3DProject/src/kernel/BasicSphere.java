package kernel;
import processing.core.*;
class BasicSphere extends Renderable
{
  public BasicSphere(PApplet _p)
  {
    super(_p);
  }
  public void render()
  {
    p.noStroke();
    p.sphere(50);
  }
}
