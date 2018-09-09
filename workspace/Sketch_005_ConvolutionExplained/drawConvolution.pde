void drawConvolution(int x, int y, color[][] colors)
{ 
  int sideStep = lensSize / lensGridSize;
  int sideBegin = (int)-(0.5 * lensSize); 

  translate(x, y);
  pushMatrix();
    int red = 0;
    int green = 0;
    int blue = 0;
    for(int i = 0; i < lensGridSize; i++)
    {
      for(int j = 0; j < lensGridSize; j++)
      {
        fill(colors[i][j]);
        
        rect(sideBegin + (i * sideStep), 
          sideBegin + (j * sideStep), 
          sideStep, 
          sideStep);
        red += red(colors[i][j]) * convolutionKernel[i][j];
        green += green(colors[i][j]) * convolutionKernel[i][j];
        blue += blue(colors[i][j]) * convolutionKernel[i][j];
        
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(20);
        text(convolutionKernel[i][j], 
          sideBegin + (i * sideStep) + (sideStep / 2), 
          sideBegin + (j * sideStep) + (sideStep / 2)
          );
      }
    }
    fill(colors[lensGridSize / 2][lensGridSize / 2]);
    rect(sideBegin, 
      sideBegin + (lensGridSize * sideStep), 
      lensSize / 2, 
      lensSize / 2);
   
    if(currentKernel == BLUR)
    {
      fill(color(red/9, green/9, blue/9));
    }
    else
    {
      fill(color(red, green, blue));
    }
    rect(sideBegin + (lensSize / 2), 
      sideBegin + (lensGridSize * sideStep), 
      lensSize / 2, 
      lensSize / 2);
  popMatrix();
}
