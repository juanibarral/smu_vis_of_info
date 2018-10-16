class Plane
{
  private String icao24;
  private String callsign;
  private String origin_country;
  private int time_position;
  private int last_contact;
  private float longitude;
  private float latitude;
  private float geo_altitude;
  private boolean on_ground;
  private float velocity;  
  private float true_track;
  private float vertical_rate;
  private int[] sensors;
  private float baro_altitude;
  private String squawk;
  private boolean spi;
  private int position_source;
  
  PVector position;
  private boolean selected;
  
  public Plane(JSONArray data)
  {
    icao24= data.getString(0);
    //callsign= data.getString(1);
    origin_country= data.getString(2);
    //time_position= data.getInt(3);
    //last_contact= data.getInt(4);
    longitude= data.isNull(5) ? -999 : data.getFloat(5);
    latitude= data.isNull(6) ? -999 : data.getFloat(6);
    geo_altitude= data.isNull(7) ? -1 : data.getFloat(7);
    //on_ground= data.getBoolean(8);
    velocity= data.isNull(9) ? -1 : data.getFloat(9);  
    //true_track= data.getFloat(10);
    //vertical_rate= data.getFloat(11);
    //sensors= data.getIntArray(12);
    //baro_altitude= data.isNull(13) ? -1 : data.getFloat(13);
    //squawk= data.isNull(14) ? "" : data.getString(14);
    //spi= data.getBoolean(15);
    //position_source= data.getInt(16);
    if(latitude != -999 && longitude != -999)
    {
      position = new PVector(latitude, longitude);
    }
  }
  
  public String getIcao24()
  {
    return icao24;
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public float getAltitude()
  {
    return geo_altitude;
  }
  
  public String getOrigin()
  {
    return origin_country;
  }
  
  public void setSelected(boolean b)
  {
    selected = b;
  }
  
  public boolean isSelected()
  {
    return selected;
  }
}
