Axis myAxis;
CustomCamera cam;
ArrayList<Abstract3DObject> objects;
ScatterBase base;
boolean isPicking;
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
  if(isPicking)
  {
    color pickedColor = calculatePickedColor();
    println(red(pickedColor), green(pickedColor), blue(pickedColor));
    base.setPickedColor(pickedColor);
  }
  
  isPicking = false;
  base.setPicking(isPicking);
  camera();
  hint(DISABLE_DEPTH_TEST);
  noLights();
  rect(100, 100, 100, 100);
  hint(ENABLE_DEPTH_TEST);  
}

int calculatePickedColor()
{
  int selected = 0;
  loadPixels();
  int index = mouseX + (mouseY * width);
  selected = pixels[index];
  return selected;
}

void mouseDragged()
{
  cam.dragged();
}

void mouseClicked()
{
  isPicking = true;
  base.setPicking(isPicking);
}
//void mousePressed()
//{
//  isPicking = true;
//  base.setPicking(isPicking);
//}
//void mouseReleased()
//{
//  isPicking = false;
//  base.setPicking(isPicking);
//}

void keyPressed()
{
  base.addPoint(random(300), random(300), random(300));
}
