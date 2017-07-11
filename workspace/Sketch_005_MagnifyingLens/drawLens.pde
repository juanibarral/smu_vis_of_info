void drawLens(int x, int y, color[][] colors)
{
  int sideStep = lensSize / lensGridSize;
  int sideBegin = (int)-(0.5 * lensSize); 

  rectMode(CENTER);
  translate(x, y);
  pushMatrix();
    for(int i = 0; i < lensGridSize; i++)
    {
      for(int j = 0; j < lensGridSize; j++)
      {
        fill(colors[i][j]);
        rect(sideBegin + (i * sideStep), 
          sideBegin + (j * sideStep), 
          sideStep, 
          sideStep);
      }
    }
  popMatrix();
}