class ScatterBase extends Abstract3DObject
{
  private int sizeWidth;
  private int sizeHeight;
  private int sizeDepth;
  private ArrayList<DataObject> dataObjects;
  
  public ScatterBase()
  {
    super();
    sizeWidth = 300;
    sizeDepth = 500;
    sizeHeight = 700;
    dataObjects = new ArrayList<DataObject>();
  }
  
  public ScatterBase( int _width, int _height, int _depth)
  {
    this();
    sizeWidth = _width;
    sizeDepth = _depth;
    sizeHeight = _height;
  }
  
  public void addPoint(float w, float d, float h)
  {
    DataObject newPoint = new DataObject(w, d, h);
    dataObjects.add(newPoint);
  }
  
  protected void createObject()
  {
    box(sizeWidth, 10, sizeDepth);
    pushMatrix();
      translate(sizeWidth/2, -10, -sizeDepth/2);
      line(0, 0, 0, 0, -sizeHeight, 0); 
    popMatrix();
    pushMatrix();
      translate(sizeWidth/2, -10, -sizeDepth/2);
      for(DataObject o : dataObjects)
      {
        o.render();
      }
    popMatrix();
  }
  
 
}
