class Country
{
  private String code;
  private String name;
  private PVector position;
  private int origins;
  
  public Country(String _code, String _name, PVector _position)
  {
    code = _code;
    name = _name;
    position = _position;
  }
  
  public PVector getPosition()
  {
    return position;
  }
  public void resetOrigins()
  {
    origins = 0;
  }
  public void addOrigin()
  {
    origins++;
  }
  
  public int getOrigins()
  {
    return origins;
  }
  
  public String getName()
  {
    return name;
  }
}
