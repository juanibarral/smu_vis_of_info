package kernel;

import processing.core.PApplet;

public class Earth extends AbstractPlanet{

	public Earth(PApplet pApplet)
	{
		super(pApplet, 10, 100, pApplet.color(0,0,255), 0.02f);
	}
}
