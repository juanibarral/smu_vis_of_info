
import controlP5.*;
import java.util.Collections;
Controller controller;

Grid grid;
Axes axes;
float camRot;
float camRotSpeed;
private static final int ROT_X = 0;
private static final int ROT_Y = 1;
private static final int ROT_Z = 2;

int rotationAxis;

ArrayList<AbstractGeometry> geometries;

float[] rotationSpeeds;

LightSource myLight;

void settings()
{
  size(600, 600, P3D);
}

void setup()
{
  controller = new Controller();
  camRotSpeed = 0.002;
  rotationAxis = ROT_Y;
  
  rotationSpeeds = new float[21];
  for(int i = 0; i < rotationSpeeds.length; i++)
  {
    rotationSpeeds[i] = random(0.05);
  }
  
  geometries = new ArrayList<AbstractGeometry>();
  
  Cone myCone = new Cone(20, 100, 150);
  //myCone.setTexture("testing.png");
  
  //geometries.add(myCone);
  grid = new Grid(20, 20);
  axes = new Axes();
  
  myLight = new LightSource(color(200,200,200), new PVector(200, -200, 200), LightSource.DIRECTIONAL);
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

  //ambientLight(50,50,50);
  lights();
  //myLight.turnOn();
  //grid.render();
  axes.render();
  
  for(int i = 0; i < geometries.size(); i++)
  {
    PVector rotation = geometries.get(i).getRotation();
    int rotIndex = i % 21;
    rotation.z += rotationSpeeds[rotIndex];
    geometries.get(i).setRotation(rotation);
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
    camRotSpeed = camRotSpeed == 0.002 ? 0 : 0.002; 
  }
}

void updateRider(Rider r)
{
  int[] positions = r.getPositions();
  int[] diffs = r.getTimeDifferenceToLeader();
  int[] positionsInStage = r.getPositionsInStage();
  geometries.clear();
  
  int maxDiff = max(diffs);
  
  for(int i = 0; i < positions.length; i++)
  {
    float posZ = map(i, 0, positions.length, 250, -250);
    float h = map(positions[i], 1, 200, 1, 200);
    Cone c = new Cone(10, 10, h);
    c.setPosition(new PVector(0, 0, posZ));
    //c.setRotation(new PVector(0, 0, PI));
    geometries.add(c);
    h = map(diffs[i], 0, maxDiff, 1, 200);
    Cone c2 = new Cone(10, 10, h);
    c2.setPosition(new PVector(0, 0, posZ));
    c2.setRotation(new PVector(0, 0, PI));
    geometries.add(c2);
    h = map(positionsInStage[i], 0, 200, 1, 200);
    Cone c3 = new Cone(10, 10, h);
    c3.setPosition(new PVector(0, 0, posZ));
    c3.setRotation(new PVector(0, 0, PI/2));
    geometries.add(c3);
  }
}