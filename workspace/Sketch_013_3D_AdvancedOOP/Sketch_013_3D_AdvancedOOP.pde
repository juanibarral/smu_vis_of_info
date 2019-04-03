ArrayList<Abstract3DObject> objects;

float speed = 0.01;
float rot = 0;

float tSpeed = 1;
float transx = 0;

int rotIndex = -1;
int transIndex = -1;
void settings()
{
  size(800, 800, P3D);
  objects = new ArrayList<Abstract3DObject>();
  
  objects.add(new Axis());
  SimpleCube cube = new SimpleCube();
  transIndex = cube.addTransformation(Abstract3DObject.TRANS, "100, 0, 0");
  rotIndex = cube.addTransformation(Abstract3DObject.ROT_Y, "0");
  transIndex = cube.addTransformation(Abstract3DObject.TRANS, "0, 100, 0");
  objects.add(cube);
}

void draw()
{
  background(0);
  rot += speed;
  transx -= tSpeed;
  camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
  
  lights();
  for(Abstract3DObject object : objects)
  {
    if(object instanceof SimpleCube)
    {
      //object.updateTransformation(transIndex, transx + ",0,0");
      object.updateTransformation(rotIndex, str(rot));
    }
    object.render();
  }
}

void keyPressed()
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
}
