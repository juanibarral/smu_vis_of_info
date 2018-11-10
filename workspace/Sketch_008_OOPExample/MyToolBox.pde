class MyToolBox
{
  PImage changeColor(PImage sourceImage, color fromColor, color toColor)
  {
    PImage result = createImage(sourceImage.width, sourceImage.height, ARGB);
    result.loadPixels();
    for(int i = 0; i < sourceImage.pixels.length; i++)
    {
      color sourcePixel = sourceImage.pixels[i];
      if(sourcePixel == fromColor)
      {
        result.pixels[i] = toColor;
      }
      else
      {
        result.pixels[i] = sourceImage.pixels[i];
      }
    }
    result.updatePixels();
    return result;
  }
}
