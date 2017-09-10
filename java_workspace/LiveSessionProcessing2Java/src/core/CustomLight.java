package core;

import processing.core.*;

class LightSource
{
  private int c;
  private PVector pos;
  private PVector dir;
  private float angle;
  public static final int POINT = 0;
  public static final int DIRECTIONAL = 1;
  public static final int SPOT = 2;
  
  private int type;
  private PApplet p;
  
  public LightSource(PApplet _p, int _c, PVector _pos, int _type)
  {
    p = _p;
    c = _c;
    pos = _pos;
    type = _type;
    
    dir = new PVector(pos.x, pos.y, pos.z);
    dir.normalize();
    dir.mult(-1);
    
    angle = p.PI/6;
  }
  
  public void turnOn()
  {
    switch(type)
    {
      case POINT : 
        p.pointLight(p.red(c), p.green(c), p.blue(c), pos.x, pos.y, pos.z);
      break;
      case DIRECTIONAL :
        p.directionalLight(p.red(c), p.green(c), p.blue(c), pos.x, pos.y, pos.z);
      break;
      case SPOT :
        p.spotLight(p.red(c), p.green(c), p.blue(c), pos.x, pos.y, pos.z, dir.x, dir.y, dir.z, angle, 100);
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
          p.pushMatrix();
            p.translate(pos.x, pos.y, pos.z);
            p.noFill();
            p.stroke(200);
            p.sphereDetail(10);
            p.sphere(10);
          p.popMatrix();
      break;
      case DIRECTIONAL : 
          p.pushMatrix();
            p.noFill();
            p.stroke(200);
            p.line(0,0,0,pos.x, pos.y, pos.z);
          p.popMatrix();
      break;
    }

    
  }
}