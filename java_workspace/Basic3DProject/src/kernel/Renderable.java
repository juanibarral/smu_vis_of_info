package kernel;
import processing.core.*;

abstract class Renderable
{
	protected PVector pos;
	protected float angle;
	protected PApplet p;
	protected int objectColor;
	protected int selectColor;
	protected boolean isSelecting;
	protected String name;

	public Renderable(PApplet _p)
	{
		p = _p;
		pos = new PVector(0, 0, 0);
		angle = 0;
		objectColor = p.color(255);
		selectColor = p.color(p.random(255), p.random(255), p.random(255));
	}

	public void setName(String _name)
	{
		name = _name;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setColor(int newColor)
	{
		objectColor = newColor;
	}

	public void updateAngle(float newAngle)
	{
		angle = newAngle;
	}

	public void updatePosition(PVector newPosition)
	{
		pos = newPosition;
	}
	public PVector getPosition()
	{
		return pos;
	}
	
	public int getSelectColor()
	{
		return selectColor;
	}

	public void setSelecting(boolean b)
	{
		isSelecting = b;
	}

	public void draw()
	{
		p.fill(isSelecting ? selectColor : objectColor);
		p.pushMatrix();
		p.translate(pos.x, pos.y, pos.z);
		p.rotateY(angle);
		render();
		p.popMatrix();
	}
	abstract void render();
}
