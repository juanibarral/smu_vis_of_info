class ProjectionRenderer
{
  private PImage projectionImage;
  private Converter converter;
  public static final String MERCATOR = "mercator.jpeg";
  public static final String EQUIRECTANGULAR = "equirectangular.jpg";
  
  
  public ProjectionRenderer(String projection)
  {
    projectionImage = loadImage(projection);
    converter = new Converter(projectionImage.width, projectionImage.height);
    if(projection.equals(MERCATOR))
    {
      converter.setProjection(Converter.MERCATOR);
    } 
    else if(projection.equals(EQUIRECTANGULAR))
    {
      converter.setProjection(Converter.EQUIRECTANGULAR);
    }
  }
  
  public void renderImage()
  {
    PVector latlon = converter.convert2latlon(mouseX, mouseY);
    float lat = latlon.x;
    float lon = latlon.y;
    image(projectionImage, 0, 0);
    fill(255);
    rect(mouseX + 5, mouseY - 45, 200, 40);
    fill(0);
    text("Pixel: " + mouseX + "," + mouseY, mouseX + 10, mouseY - 30);
    text("LatLon: " + lat + "," + lon, mouseX + 10, mouseY - 10);
    line(0, mouseY, width, mouseY);
    line(mouseX, 0, mouseX, height);
  }
  
  public int[] getImageSize()
  {
    int imageWidth = projectionImage.width;
    int imageHeight = projectionImage.height;
    return new int[]{imageWidth, imageHeight};
  }
}
