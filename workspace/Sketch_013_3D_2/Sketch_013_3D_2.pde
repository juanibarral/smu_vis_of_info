
Grid grid;
Axes axes;
float camRot;
float camRotSpeed;
private static final int ROT_X = 0;
private static final int ROT_Y = 1;
private static final int ROT_Z = 2;

int rotationAxis;


ArrayList<AbstractGeometry> geometries;

LightSource myLight;

MyView v;

void setup()
{
  size(600, 600, P3D);  
  camRotSpeed = 0.02;
  rotationAxis = ROT_Y;
  
  geometries = new ArrayList<AbstractGeometry>();
  
  Cone myCone = new Cone(3, 50, 150);
  myCone.setTexture("testing.png");
  
  geometries.add(myCone);
  grid = new Grid(20, 20);
  axes = new Axes();
  
  myLight = new LightSource(color(255,255,255), new PVector(200, -200, 200), LightSource.POINT);
  
  v = new MyView();
  
  PApplet.runSketch(new String[]{""}, v);
  
}

void draw()
{
    background(0);
    
    camRot += camRotSpeed;
    beginCamera();
      camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
      switch(rotationAxis)
      {
        case ROT_X :
          rotateX(camRot);
        break;
        case ROT_Y :
          rotateY(camRot);
        break;
        case ROT_Z :
          rotateZ(camRot);
        break;
      }
      
    endCamera();
  
    lights();
    //myLight.turnOn();
    //grid.render();
    axes.render();
    
    for(int i = 0; i < geometries.size(); i++)
    {
      geometries.get(i).render();
    }
}

void keyPressed()
{
  if(key == 'x')
  {
    rotationAxis = ROT_X;
  }
  else if(key == 'y')
  {
    rotationAxis = ROT_Y;
  }
  else if(key == 'z')
  {
    rotationAxis = ROT_Z;
  }
  else if(key == ' ')
  {
    camRotSpeed = camRotSpeed == 0.02 ? 0 : 0.02; 
  }
}