class Model
{
  private PVector[] myData;
  private String[] myDataNames;
  
  private int DATA_SIZE = 100;
  
  public Model()
  {
    myData = new PVector[DATA_SIZE];
    myDataNames = new String[DATA_SIZE];
    
    for(int i = 0; i < DATA_SIZE; i++)
    {
      myData[i] = new PVector(random(500), random(500));
      myDataNames[i] = "My Data " + i;
    }
  }
  
  public PVector[] getData()
  {
    return myData;
  }
  public String[] getDataNames()
  {
    return myDataNames;
  }
}