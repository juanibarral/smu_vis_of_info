package kernel;
import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PVector; 

public class Sketch_013_Basic3D extends PApplet {

	Axis myAxis;
	float rotYSpeed = 0.01f;
	float angleY = 0;
	float angleY2 = 0;
	float rotYSpeed2 = 0.1f;
	ArrayList<Renderable> renderables;

	boolean lightsOn;
	boolean axisOn;
	
	boolean mousePressed;
	
	public void settings()
	{
		size(800, 800, P3D);
		myAxis = new Axis(this);
		renderables = new ArrayList<Renderable>();
		renderables.add(new BasicBox(this));
		BasicBox b = new BasicBox(this);
		b.setName("Second");
		renderables.add(b);

		
		renderables.get(1).updatePosition(new PVector(100, 0, 0));
		lightsOn = true;
	}

	public void draw()
	{
		background(0);

		angleY += rotYSpeed;
		angleY2 += rotYSpeed2;

		beginCamera();
		camera(300, -300, 300, 0, 0, 0, 0, 1, 0);

		endCamera();

		if(axisOn)
		{
			myAxis.draw();
		}

		if(lightsOn)
		{
			lights();   
		}


		for(Renderable r : renderables)
		{
			if(r.getName() != null && r.getName().equals("Second"))
			{
				r.updateAngle(angleY2);
			}
			else
			{
				r.updateAngle(angleY);
			}
			
			if(mousePressed)
			{
				noLights();
				r.setSelecting(true);
				r.draw();
				this.loadPixels();
				int position = mouseX + (mouseY * this.width);
				int canvasPixelColor = this.pixels[position];
				int objectSelectColor = r.getSelectColor();
				if(canvasPixelColor == objectSelectColor)
				{
					PVector current = r.getPosition();
					current.y -= 10;
					r.updatePosition(current);
				}
			}
			else
			{
				r.setSelecting(false);
				r.draw();
			}
		}
		mousePressed = false;
	}

	public void keyPressed()
	{
		if(key == 'l')
		{
			lightsOn =! lightsOn;
		}
		else if(key == ' ')
		{
			axisOn =! axisOn;
		}
		else if(key == 'w')
		{
			Renderable sph = renderables.get(1);
			PVector current = sph.getPosition();
			current.y -= 10;
			sph.updatePosition(current);
		}
		else if(key == 's')
		{
			Renderable sph = renderables.get(1);
			PVector current = sph.getPosition();
			current.y += 10;
			sph.updatePosition(current);
		}
	}
	
	public void mousePressed()
	{
		mousePressed = true;
	}
	
	static public void main(String[] passedArgs) {
		String[] appletArgs = new String[] { "kernel.Sketch_013_Basic3D" };
		if (passedArgs != null) {
			PApplet.main(concat(appletArgs, passedArgs));
		} else {
			PApplet.main(appletArgs);
		}
	}
}
