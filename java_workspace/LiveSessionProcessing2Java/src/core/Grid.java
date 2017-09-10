package core;

import processing.core.*;
class Grid extends AbstractGeometry
{
  private int size;
  private int step;
  
  public Grid(PApplet _p,int _size, int _step)
  {
    p = _p;
    size = _size;
    step = _step;
  }
  
  public void render()
  {
    p.stroke(200);
    p.noFill();
    p.rectMode(p.CORNER);
    p.pushMatrix();
      p.rotateX(p.PI/2);
      p.translate((float)-(step * size * 0.5), (float)-(step * size * 0.5), (float)0.0);
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