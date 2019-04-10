package kernel;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sketch_013_3D_AdvancedOOP extends PApplet {

	ArrayList<Abstract3DObject> objects;

	float speed = 0.01f;
	float rot = 0;

	float tSpeed = 1;
	float transx = 0;
	
	float sphereSpeed = 0.01f;
	float rotSphere = 0;
	
	int rotIndexSphere = -1;

	int rotIndex = -1;
	int transIndex = -1;
	
	Grid myGrid;
	boolean showGrid = true;
	
	Axis myAxis;
	boolean showAxis = true;
	
	boolean isPicking = false;
	public void settings()
	{
		size(800, 800, P3D);
		objects = new ArrayList<Abstract3DObject>();

		myAxis = new Axis(this);
		objects.add(myAxis);
		myGrid = new Grid(this);
		myGrid.addTransformation(Abstract3DObject.ROT_X, Float.toString(PApplet.PI / 2));
		myGrid.addTransformation(Abstract3DObject.TRANS, "-500, -500, 0");
		
		objects.add(myGrid);
		SimpleCube cube = new SimpleCube(this);
		transIndex = cube.addTransformation(Abstract3DObject.TRANS, "200, 0, 0");
		rotIndex = cube.addTransformation(Abstract3DObject.ROT_Y, "0");
//		transIndex = cube.addTransformation(Abstract3DObject.TRANS, "0, 100, 0");
		objects.add(cube);
		
		SimpleSphere sphere = new SimpleSphere(this);
		rotIndexSphere = sphere.addTransformation(Abstract3DObject.ROT_X, "0");
		sphere.addTransformation(Abstract3DObject.TRANS, "0, 0, 100");
		objects.add(sphere);
	}

	public void draw()
	{
		background(0);
		rot += speed;
		transx -= tSpeed;
		rotSphere += sphereSpeed;
		camera(500, -500, 500, 0, 0, 0, 0, 1, 0);

		if(isPicking)
		{
			noLights();
		}
		else
		{
			lights();
		}
		for(Abstract3DObject object : objects)
		{
			object.setIsPicking(isPicking);
			if(object instanceof SimpleCube)
			{
				object.updateTransformation(rotIndex, str(rot));
			}
			if(object instanceof SimpleSphere)
			{
				object.updateTransformation(rotIndexSphere, str(rotSphere));
			}
			object.render();
		}
		
		if(isPicking)
		{
			this.loadPixels();
			int index = mouseX + (mouseY * 800);
			int mousePixelColor = this.pixels[index];
			for(Abstract3DObject object : objects)
			{
				if(object instanceof SimpleCube)
				{
					if(object.getPickColor() == mousePixelColor)
					{
						println("The selected object is the cube");
					}
				}
				if(object instanceof SimpleSphere)
				{
					if(object.getPickColor() == mousePixelColor)
					{
						println("The selected object is the sphere");
					}
				}
			}
			isPicking = false;
		}
		
	}

	public void keyPressed()
	{
		if(key == 'x')
		{
			objects.get(1).updateTransformation(rotIndex, Abstract3DObject.ROT_X, "0");
		}
		else if(key == 'y')
		{
			objects.get(1).updateTransformation(rotIndex, Abstract3DObject.ROT_Y, "0");
		}
		else if(key == 'z')
		{
			objects.get(1).updateTransformation(rotIndex, Abstract3DObject.ROT_Z, "0");
		}
		else if(key == 'g')
		{
			showGrid = !showGrid;
			if(showGrid)
			{
				objects.add(1, myGrid);
			}
			else
			{
				objects.remove(1);
			}
		}
		else if(key == 'a')
		{
			showAxis = !showAxis;
			if(showAxis)
			{
				objects.add(0, myAxis);
			}
			else
			{
				objects.remove(0);
			}
		}
	}
	
	public void mouseClicked()
	{
		isPicking = true;
	}
	
	static public void main(String[] passedArgs) {
		String[] appletArgs = new String[] { "kernel.Sketch_013_3D_AdvancedOOP" };
		if (passedArgs != null) {
			PApplet.main(concat(appletArgs, passedArgs));
		} else {
			PApplet.main(appletArgs);
		}
	}
}
