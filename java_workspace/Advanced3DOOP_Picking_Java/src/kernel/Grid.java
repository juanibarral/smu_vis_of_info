package kernel;

import processing.core.*;

public class Grid extends Abstract3DObject{

	public Grid(PApplet _p) {
		super(_p);
	}


	protected void renderObject() {
		for(int i = 0; i < 100; i++)
		{
			for(int j = 0; j < 100; j++)
			{
				p.stroke(255);
				p.noFill();
				p.rect(i * 10, j * 10, 10, 10);
			}
		}
	}
	

}
