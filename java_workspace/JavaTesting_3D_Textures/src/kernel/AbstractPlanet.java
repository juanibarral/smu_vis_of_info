package kernel;

import processing.core.*;

public abstract class AbstractPlanet {

	private PApplet p;
	private int size;
	private int distanceFromSun;
	private int planetColor;
	private float planetSpeed;
	private float rotationAngle;
	
	public AbstractPlanet(PApplet pApplet, 
								int pSize, 
								int pDistanceFromSun, 
								int pColor,
								float pSpeed)
	{
		p = pApplet;
		size = pSize;
		distanceFromSun = pDistanceFromSun;
		planetColor = pColor;
		planetSpeed = pSpeed;
		rotationAngle = 0;
	}
	
	public void render() {
		rotationAngle += planetSpeed;
		p.fill(planetColor);
		p.pushMatrix();
			p.rotateY(rotationAngle);
			p.translate(distanceFromSun, 0);
			p.sphere(size);
		p.popMatrix();
	}
}
