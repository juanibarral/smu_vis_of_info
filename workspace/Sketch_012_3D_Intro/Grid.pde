class Grid
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
    stroke(200);
    noFill();
    rectMode(CORNER);
    pushMatrix();
      rotateX(PI/2);
      translate(-(step * size * 0.5), -(step * size * 0.5), 0);
      pushMatrix();
      for(int i = 0; i < size; i++)
      {
        for(int j = 0; j < size; j++)
        {
          rect(i * step, j * step, step, step);  
        }
      }
      popMatrix();
    popMatrix();
  }
}