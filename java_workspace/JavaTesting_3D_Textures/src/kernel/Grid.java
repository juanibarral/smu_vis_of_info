package kernel;
import processing.core.*;

class Grid
{
  private int size;
  private int step;
  private PApplet p;
  
  public Grid(PApplet pApplet, int _size, int _step)
  {
    size = _size;
    step = _step;
    p = pApplet;
  }
  
  public void render()
  {
    p.stroke(200);
    p.noFill();
    p.rectMode(PConstants.CORNER);
    p.pushMatrix();
      p.rotateX(PConstants.PI/2);
      p.translate((float)-(step * size * 0.5), (float)-(step * size * 0.5), (float)0);
      p.pushMatrix();
      for(int i = 0; i < size; i++)
      {
        for(int j = 0; j < size; j++)
        {
          p.rect(i * step, j * step, step, step);  
        }
      }
      p.popMatrix();
    p.popMatrix();
  }
}