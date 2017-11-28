package kernel;

import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PImage;
import processing.core.PVector;

public abstract class AbstractObject_3D {
	protected PApplet p;
	protected PVector position;
	protected ArrayList<PVector> vertices;
	protected ArrayList<int[]> faces;
	protected ArrayList<PVector[]> uvs;
	protected PImage textureImage;
	
	public AbstractObject_3D(PApplet pApplet)
	{
		p = pApplet;
		position = new PVector(0,0,0);
		vertices = new ArrayList<PVector>();
		faces = new ArrayList<int[]>();
		uvs = new ArrayList<PVector[]>();
		textureImage = null;
	}
	
	public void setTexture(String texturePath)
	{
		textureImage = p.loadImage(texturePath);
	}
	
	public void updatePosition(PVector newPos)
	{
		position = newPos;
	}
	protected abstract void createObject();
	protected abstract void applyTransformations();
	
	public void render() {
		p.pushMatrix();
			applyTransformations();
			createObject();
		p.popMatrix();
	}
	
}
