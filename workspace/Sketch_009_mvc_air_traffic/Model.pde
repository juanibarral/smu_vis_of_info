class Model
{
  private static final String BASE_API = "https://opensky-network.org/api/states/all?";
  private ArrayList<Plane> planes;
  private Controller controller;
  private float minAltitude;
  private float maxAltitude;
  private HashMap<String, Country> countries;
  private ArrayList<Country> currentOrigins;
  private int minOrigin;
  private int maxOrigin;
  
  public Model(Controller _controller)
  {
    planes = new ArrayList<Plane>();
    converter = new Converter(worldMap.width, worldMap.height);
    controller = _controller;
    minAltitude = Float.MAX_VALUE;
    maxAltitude = Float.MIN_VALUE;
    minOrigin = Integer.MAX_VALUE;
    maxOrigin = Integer.MIN_VALUE;
    currentOrigins = new ArrayList<Country>();
    countries = new HashMap<String, Country>();
    Table t = loadTable("countries.csv");
    for(int i = 1; i < t.getRowCount(); i++)
    {
      TableRow r = t.getRow(i);
      countries.put(r.getString(3), new Country(r.getString(0), r.getString(3), new PVector(r.getFloat(1), r.getFloat(2))));
    }
    println(countries.size() + " countries loaded.");
  }
  
  public void updateCoordinates(float minLat, float minLon, float maxLat, float maxLon)
  {
    println("Loading data");
    planes.clear();
    currentOrigins.clear();
    for(Map.Entry entry : countries.entrySet())
    {
      ((Country)entry.getValue()).resetOrigins();
    }
    String apiPos = "lamin=" + minLat + "&lomin=" + minLon + "&lamax=" + maxLat + "&lomax=" + maxLon;
    String uri = BASE_API + apiPos;
    JSONObject res = loadJSONObject(uri);
    if(!res.isNull("states"))
    {
      minAltitude = Float.MAX_VALUE;
      maxAltitude = Float.MIN_VALUE;
      JSONArray states = res.getJSONArray("states");
      for(int i = 0; i < states.size(); i++)
      {
        JSONArray data = states.getJSONArray(i);
        Plane p = new Plane(data);
        planes.add(p);
        if(minAltitude > p.getAltitude())
        {
          minAltitude = p.getAltitude();
        }
        if(maxAltitude < p.getAltitude())
        {
          maxAltitude = p.getAltitude();
        }
        String origin = p.getOrigin();
        Country originObject = countries.get(origin);
        if(originObject != null)
        {
          originObject.addOrigin();
          currentOrigins.add(originObject);
        }
      }
      minOrigin = Integer.MAX_VALUE;
      maxOrigin = Integer.MIN_VALUE;
      for(int i = 0; i < currentOrigins.size(); i++)
      {
        Country c = currentOrigins.get(i);
        if(minOrigin > c.getOrigins())
        {
          minOrigin = c.getOrigins();
        }
        if(maxOrigin < c.getOrigins())
        {
          maxOrigin = c.getOrigins();
        }
      }
    }
    else
    {
      println("Is null");
    }
    controller.updatePlanes(planes);
    println(planes.size() + "planes loaded");
  }
  
  public ArrayList<Plane> getPlanes()
  {
    return planes;
  }
  
  public float getMinAltitude()
  {
    return minAltitude;
  }
  public float getMaxAltitude()
  {
    return maxAltitude;
  }
  
  public int getMinOrigins()
  {
    return minOrigin;
  }
  public int getMaxOrigins()
  {
    return maxOrigin;
  }
  
  public ArrayList<Country> getOrigins()
  {
    return currentOrigins;
  }
}

//https://opensky-network.org/api/states/all?lamin=45.8389&lomin=5.9962&lamax=47.8229&lomax=10.5226
