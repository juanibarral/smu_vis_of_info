package kernel;
import processing.core.*;

class BasicBox extends Renderable
{
	
  public BasicBox(PApplet _p)
  {
    super(_p);
  }
  public void render()
  {
    p.noStroke();
    p.box(50, 50, 50);
  }
}
