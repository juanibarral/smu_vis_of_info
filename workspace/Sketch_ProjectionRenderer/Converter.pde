class Converter
{
  private int imageWidth;
  private int imageHeight;
  private int projection;
  public static final int EQUIRECTANGULAR = 0;
  public static final int MERCATOR = 1;
  
  public Converter(int _imageWidth, int _imageHeight)
  {
    imageWidth = _imageWidth;
    imageHeight = _imageHeight;
    projection = EQUIRECTANGULAR;
  }
  
  public void setProjection(int _projection)
  {
    projection = _projection;
  }
  
  public PVector convert2latlon(float x, float y)
  {
    PVector latlon = null;
    float lat = 0;
    float lon = 0;
    switch(projection)
    {
      case EQUIRECTANGULAR:
        lat = map(y, imageHeight, 0, -90, 90); 
        lon = map(x, 0, imageWidth, -180, 180);
      break;
      case MERCATOR:
        if(y <= height/2)
        {
          y = map(y, 0, height/2, height/2, 0);
        }
        else
        {
          y = -map(y, height/2, height, 0, height/2);
        }
      
        float a = 1 / (imageHeight / (2 * PI));
        a = exp((y * 2) * a);
        lat = (asin((a - 1) / (a + 1))) * (180.0 / PI);
        lon = map(x, 0, imageHeight, -180, 180);
      break;
    }
    latlon = new PVector(lat, lon);
    return latlon;
  }
  
  public PVector convert2Pixels(float lat, float lon)
  {
    PVector xy = null;
    float x = 0;
    float y = 0;
    switch(projection)
    {
      case EQUIRECTANGULAR:
        x = map(lon, -180, 180, 0, imageWidth);
        y = map(lat, -90, 90, imageHeight, 0);
      break;
      case MERCATOR:
        x = (lon+180)*(imageWidth/360);
        float latRad = lat*PI/180;
        float mercN = log(tan((PI/4)+(latRad/2)));
        y = (imageHeight/2)-(imageWidth*mercN/(2*PI));
      break;
    }
    xy = new PVector(x, y);
    return xy;
  }
}
