class LightSource
{
  private color c;
  private PVector pos;
  private PVector dir;
  private float angle;
  public static final int POINT = 0;
  public static final int DIRECTIONAL = 1;
  public static final int SPOT = 2;
  
  private int type;
  public LightSource(color _c, PVector _pos, int _type)
  {
    c = _c;
    pos = _pos;
    type = _type;
    
    dir = new PVector(pos.x, pos.y, pos.z);
    dir.normalize();
    dir.mult(-1);
    
    angle = PI/6;
  }
  
  public void turnOn()
  {
    switch(type)
    {
      case POINT : 
        pointLight(red(c), green(c), blue(c), pos.x, pos.y, pos.z);
      break;
      case DIRECTIONAL :
        directionalLight(red(c), green(c), blue(c), pos.x, pos.y, pos.z);
      break;
      case SPOT :
        spotLight(red(c), green(c), blue(c), pos.x, pos.y, pos.z, dir.x, dir.y, dir.z, angle, 100);
      break;
    }
  }
  
  public void setType(int _type)
  {
    type = _type;
  }
  
  public int getType()
  {
    return type;
  }
  
  public void changeType()
  {
    switch(type)
    {
      case POINT : 
        type = DIRECTIONAL;
      break;
      case DIRECTIONAL :
        type = SPOT;
      break;
      case SPOT :
        type = POINT;
      break;
    }
  }
  
  public void render()
  {
    switch(type)
    {
      case POINT:
          pushMatrix();
            translate(pos.x, pos.y, pos.z);
            noFill();
            stroke(200);
            sphereDetail(10);
            sphere(10);
          popMatrix();
      break;
      case DIRECTIONAL : 
          pushMatrix();
            noFill();
            stroke(200);
            line(0,0,0,pos.x, pos.y, pos.z);
          popMatrix();
      break;
    }

    
  }
}