/**
* Creates a circular transparent image from a source image
*/
PImage createCircularMask(PImage sourceImage)
{
  int imgWidth = sourceImage.width;
  int imgHeight = sourceImage.height;
  int resultSize = min(imgWidth, imgHeight);
  int gap = imgHeight > imgWidth ? (imgHeight - resultSize) / 2 : (imgWidth - resultSize) / 2;
  PImage result = createImage(resultSize, resultSize, ARGB);
  PVector center = new PVector(imgWidth / 2, imgHeight / 2);
  int radius = resultSize/2;
  result.loadPixels();
  int j_init = imgHeight > imgWidth ? gap : 0;
  int j_limit = imgHeight > imgWidth ? imgHeight - gap : imgHeight;
  int i_init = imgHeight > imgWidth ? 0 : gap;
  int i_limit = imgHeight > imgWidth ? imgWidth : imgWidth - gap;
  int resultIndex = 0;
  for(int j = j_init; j < j_limit; j++)
  {
    //for(int i = 0; i < imgWidth; i++)
    for(int i = i_init; i < i_limit; i++)
    {
      int index = i + (j * imgWidth);
      float distance = dist(center.x, center.y, i, j);
      result.pixels[resultIndex] = distance <= radius ? sourceImage.pixels[index] : color(0, 0, 0, 0);
      resultIndex++;
    }
  }
  result.updatePixels();
  return result;
}
