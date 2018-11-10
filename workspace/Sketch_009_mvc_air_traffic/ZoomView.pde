class ZoomView extends PApplet
{
  private static final int VIEW_WIDTH = 500;
  private static final int VIEW_HEIGHT = 500;
  private static final int PLANE_DIAMETER = 10;
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
          Plane selectedPlane = null;
          PVector selectedXY = null;
          int selectedColor = 0;
          for(Plane p : planes)
          {
            PVector pos = p.getPosition();
            PVector global = converter.convert2Pixels(pos.x, pos.y);
            float x = map(global.x, corner.x, corner.x + Window.WINDOW_SIZE_PX, 0, VIEW_WIDTH);  
            float y = map(global.y, corner.y, corner.y + Window.WINDOW_SIZE_PX, 0, VIEW_HEIGHT);
            float altitude = p.getAltitude();
            int altColor = lerpColor(minColor, maxColor, altitude / (maxAltitude - minAltitude));  
            
            float diameter = PLANE_DIAMETER;
            if(p.isSelected())
            {
              selectedPlane = p;
              selectedXY = new PVector(x, y);
              selectedColor = altColor;
            }
            fill(altColor);
            ellipse(x, y, diameter, diameter);
          }
          if(selectedPlane != null && selectedXY != null)
          {
            control.setSelectedOrigin(selectedPlane.getOrigin());
              float diameter = PLANE_DIAMETER * 1.5;
              int widthPopup = 150;
              int heightPopup = 50;
              float x = selectedXY.x;
              float y = selectedXY.y;
              float posPopupX = x - (x > (VIEW_WIDTH - widthPopup) ? widthPopup : -10);
              float posPopupY = y - (y > (VIEW_HEIGHT - heightPopup) ? heightPopup : -10);
              pushMatrix();
                translate(posPopupX, posPopupY);
                stroke(0);
                fill(255);
                rect(0, 0, widthPopup, heightPopup);
                fill(0);
                text("ID: " + selectedPlane.getIcao24(), 5, 15);
                text("Alt: " + selectedPlane.getAltitude() + " Mts", 5, 30);
                text("Orig: " + selectedPlane.getOrigin(), 5, 45);
              popMatrix();
              fill(selectedColor);
              ellipse(x, y, diameter, diameter);
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
  
  public void mouseMoved()
  {
    if(!planes.isEmpty())
    {
      control.setSelectedOrigin(null);
      for(Plane p : planes)
      {
        p.setSelected(false);
      }
      for(Plane p : planes)
      {
        PVector pos = p.getPosition();
        PVector global = converter.convert2Pixels(pos.x, pos.y);
        float x = map(global.x, corner.x, corner.x + Window.WINDOW_SIZE_PX, 0, VIEW_WIDTH);  
        float y = map(global.y, corner.y, corner.y + Window.WINDOW_SIZE_PX, 0, VIEW_HEIGHT);
        float distance = dist(mouseX, mouseY, x, y);
        if(distance <= PLANE_DIAMETER)
        {
          p.setSelected(true);
        }
      }
    }
  }
}
