class Grid implements Renderable
{
  private int size;
  private int step;
  
  public Grid(int _size, int _step)
  {
    size = _size;
    step = _step;
  }
  
  public void render()
  {
    rectMode(CORNER);
    noFill();
    stroke(255);
    pushMatrix();
      rotateX(PI/2);
      translate(-(size * step * 0.5), -(size * step * 0.5), 0);
      for(int i = 0; i < size; i++)
      {
        for(int j = 0; j < size; j++)
        {
          rect(i * step, j * step, step, step);
        }
      }
    popMatrix();
  }
}