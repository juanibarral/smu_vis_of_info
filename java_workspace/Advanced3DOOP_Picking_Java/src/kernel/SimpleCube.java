package kernel;

import processing.core.*;

class SimpleCube extends Abstract3DObject
{ 
  public SimpleCube(PApplet _p)
  {
    super(_p);
  }
  
  protected void renderObject()
  {
    p.stroke(255);
    p.fill(255, 0, 0);    
    if(isPicking) 
    {
    	p.noStroke();
    	p.fill(pickColor);
    }
    p.box(100);
  }
}
