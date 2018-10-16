class Controller
{
  private Model model;
  private PApplet mainView;
  private ZoomView zoomView;
  
  private String selectedOrigin;
  public Controller(PApplet _mainView)
  {
    mainView = _mainView;
    zoomView = new ZoomView(this);
    model = new Model(this);
    
    PApplet.runSketch(new String[]{"Zoom View 1"}, zoomView);
  }
  
  public void updateZoomView(PImage image, PVector corner)
  {
    zoomView.setZoomImage(image, corner);
  }
  
  public void updateCoordinates(float minLat, float minLon, float maxLat, float maxLon)
  {
    model.updateCoordinates(minLat, minLon, maxLat, maxLon);
  }
  
  public void updatePlanes(ArrayList<Plane> planes)
  {
    zoomView.updatePlanes(planes, model.getMinAltitude(), model.getMaxAltitude());
  }
  
  public ArrayList<Plane> getPlanes()
  {
    return model.getPlanes();
  }
  
  public ArrayList<Country> getOrigins()
  {
    return model.getOrigins();
  }
  
  public int[] getMinMaxOrigins()
  {
    return new int[]{model.getMinOrigins(), model.getMaxOrigins()};
  }
  
  public void setSelectedOrigin(String origin)
  {
    selectedOrigin = origin;
  }
  
  public String getSelectedOrigin()
  {
    return selectedOrigin;
  }
}
