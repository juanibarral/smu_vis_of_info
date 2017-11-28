package kernel;

import processing.core.*;
public class CustomLight {
	private PApplet p;
	private boolean isOn;
	private PVector position;
	private int lightType;
	private int lightColor;
	
	public static final int DEFAULT = 0;
	public static final int POINT = 1;
	public static final int DIRECTIONAL = 2;
	
	
	public CustomLight(PApplet pApplet, PVector pPosition, int type, int color)
	{
		p = pApplet;
		position = pPosition;
		lightType = type;
		lightColor = color;
	}
	
	
	public void switchLight()
	{
		isOn =! isOn;
	}
	
	public void render()
	{
		if(isOn)
		{
			switch(lightType)
			{
				case DEFAULT:
					p.lights();
				break;
				case POINT:
					p.pointLight(p.red(lightColor), p.green(lightColor), p.blue(lightColor), position.x, position.y, position.z);
				break;
				case DIRECTIONAL:
					p.directionalLight(p.red(lightColor), p.green(lightColor), p.blue(lightColor), position.x, position.y, position.z);
				break;
			}
			
		}
	}
	
	public void renderLight()
	{
		p.pushMatrix();
			p.translate(position.x, position.y, position.z);
			p.stroke(255);
			p.noFill();
			p.sphere(1);
		p.popMatrix();
	}
	
}
