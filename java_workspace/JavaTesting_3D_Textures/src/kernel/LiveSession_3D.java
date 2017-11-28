package kernel;

import java.util.ArrayList;

import processing.core.*; 


public class LiveSession_3D extends PApplet {

	private float angleY = 0;
	private float speedY = 0.02f;
	private float cameraAngleY = 0;
	private float cameraAngleSpeed = 0.01f;
	private Grid myGrid;
	private Axes myAxes;
	
	private ArrayList<AbstractObject_3D> objects;
	
	private CustomLight myLight;
	private CustomLight myLight2;
	
	private boolean renderAxis;
	private boolean renderGrid;

	public void setup()
	{
		myGrid = new Grid(this,20,10);
		myAxes = new Axes(this);
		objects = new ArrayList<AbstractObject_3D>();
		
		Cone myCone = new Cone(this, 40, 200, 150);
		myCone.setRotSpeed(0.01f);
		myCone.setTexture("test_2.jpg");
		objects.add(myCone);
		
		myLight = new CustomLight(this, new PVector(0, 10, 0), CustomLight.DIRECTIONAL, color(10, 100, 200));
		myLight2 = new CustomLight(this, new PVector(0, -10, 0), CustomLight.DIRECTIONAL,color(255, 0, 0));
	}

	public void draw()
	{
		background(0);
		cameraAngleY += cameraAngleSpeed;
		beginCamera();
		camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
		endCamera();

		if(renderGrid)
		{
			myGrid.render();
		}
		
		if(renderAxis)
		{
			myAxes.render();	
		}
		
		angleY += speedY;

		lights();
		//myLight.render();
		//myLight.renderLight();
		
		//myLight2.render();


		
		for(int i = 0; i < objects.size(); i++)
		{
			objects.get(i).render();
		}

	}
	public void settings() {  size(600, 600, P3D); }
	
	public void keyPressed()
	{
		if(key == 'o')
		{
			myLight.switchLight();
			myLight2.switchLight();
		}
		else if(key == 'a')
		{
			renderAxis =! renderAxis;
		}
		else if(key == 'g')
		{
			renderGrid =! renderGrid;
		}
	}

	static public void main(String[] passedArgs) {
		String[] appletArgs = new String[] { "kernel.LiveSession_3D" };
		if (passedArgs != null) {
			PApplet.main(concat(appletArgs, passedArgs));
		} else {
			PApplet.main(appletArgs);
		}
	}
}
