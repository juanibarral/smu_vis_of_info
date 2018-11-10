class ZoomView extends PApplet
{
  private static final int VIEW_WIDTH = 500;
  private static final int VIEW_HEIGHT = 500;
  private PImage zoomImage;
  private ArrayList<Plane> planes;
  private PVector corner;
  private float minAltitude;
  private float maxAltitude;
  
  private int minColor;
  private int maxColor;
  
  public ZoomView(Controller _control)
  {
    control = _control;
    planes = new ArrayList<Plane>();
    minColor = color(255,237,160);
    maxColor = color(240,59,32);
  }
  
  public void settings()
  {
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void draw()
  {
    this.background(0);
    if(zoomImage != null)
    {
      try
      {
        this.image(zoomImage, 0, 0);
        if(!planes.isEmpty())
        {
          for(Plane p : planes)
          {
            PVector pos = p.getPosition();
            PVector global = converter.convert2Pixels(pos.x, pos.y);
            float x = map(global.x, corner.x, corner.x + Window.WINDOW_SIZE_PX, 0, VIEW_WIDTH);  
            float y = map(global.y, corner.y, corner.y + Window.WINDOW_SIZE_PX, 0, VIEW_HEIGHT);
            float altitude = p.getAltitude();
            int altColor = lerpColor(minColor, maxColor, altitude / (maxAltitude - minAltitude));  
            fill(altColor);
            ellipse(x, y, 10, 10);
          }
        }
        drawLegend();
      }
      catch(Exception e)
      {
        
      }
    }
  }
  
  public void drawLegend()
  {
    fill(200);
    rect(10, 10, 80, 20);
    fill(0);
    text("Altitude (Mts)", 15, 25);
    pushMatrix();
    translate(0, 30);
    for(int i = 0; i < 5; i++)
    {
      stroke(0);
      float altValue = 1f - (float(i) / 5.f);
      int altColor = lerpColor(minColor, maxColor, altValue);
      fill(altColor);
      pushMatrix();
      translate(10, i * 20);
      rect(0, 0, 80, 20);
      fill(0);
      text("<" + (minAltitude + (altValue * (maxAltitude - minAltitude))), 5, 15);
      popMatrix();
    }
    popMatrix();
  }
  public void setZoomImage(PImage _zoomImage, PVector _corner)
  {
    corner = _corner;
    zoomImage = _zoomImage;
    zoomImage.resize(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void updatePlanes(ArrayList<Plane> _planes, float _minAltitude, float _maxAltitude)
  {
    planes = _planes;
    minAltitude = _minAltitude;
    maxAltitude = _maxAltitude;
  }
}
