package kernel;

import processing.core.*;

public class SimpleSphere extends Abstract3DObject{

	public SimpleSphere(PApplet _p) {
		super(_p);
	}

	protected void renderObject() {
		p.noStroke();
		p.fill(0, 255, 0);
	    if(isPicking) 
	    {
	    	p.fill(pickColor);
	    }
		p.sphere(50);
	}

}
