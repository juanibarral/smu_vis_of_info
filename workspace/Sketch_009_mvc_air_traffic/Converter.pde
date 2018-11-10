class Converter
{
  private int imageWidth;
  private int imageHeight;
  public Converter(int _imageWidth, int _imageHeight)
  {
    imageWidth = _imageWidth;
    imageHeight = _imageHeight;
  }
  public PVector convert2latlon(float x, float y)
  {
    float lat = map(y, imageHeight, 0, -90, 90); 
    float lon = map(x, 0, imageWidth, -180, 180);
    return new PVector(lat, lon);
  }
  
  public PVector convert2Pixels(float lat, float lon)
  {
    float x = map(lon, -180, 180, 0, imageWidth);
    float y = map(lat, -90, 90, imageHeight, 0);
    return new PVector(x, y);
  }
}
