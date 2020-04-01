Axis myAxis;
CustomCamera cam;
ArrayList<Abstract3DObject> objects;
ScatterBase base;

void settings()
{
  myAxis = new Axis();
  cam = new CustomCamera();
  objects = new ArrayList<Abstract3DObject>();
  base = new ScatterBase(300, 300, 300);
  objects.add(base);
  size(800, 800, P3D);
}

void draw()
{
  background(200);
  
  cam.use();
  //myAxis.render();
  lights();
  for(Abstract3DObject o : objects)
  {
    o.render();
  }
  
  camera();
  hint(DISABLE_DEPTH_TEST);
  noLights();
  rect(100, 100, 100, 100);
  hint(ENABLE_DEPTH_TEST);  
}

void mouseDragged()
{
  cam.dragged();
}

void keyPressed()
{
  base.addPoint(random(300), random(300), random(300));
}
