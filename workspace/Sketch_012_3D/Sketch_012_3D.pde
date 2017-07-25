
float angleY;
float rotSpeedY;

float camAngleY;
float camSpeedY;

ArrayList<Renderable> renderObjects;
LightSource myLight;

void setup()
{
  size(600, 600, P3D);
  
  angleY = 0;
  rotSpeedY = 0.01;
  
  camAngleY = 0;
  camSpeedY = 0.002;
  
  Axis myAxis = new Axis();
  Grid myGrid = new Grid(20, 10);
  myLight = new LightSource(color(255,255,255), new PVector(200, -200, 200), LightSource.POINT);
  
  renderObjects = new ArrayList<Renderable>();
  renderObjects.add(myAxis);
  renderObjects.add(myGrid);
  renderObjects.add(myLight);
}

void draw()
{
  background(0);
  
  camAngleY += camSpeedY;
  
  beginCamera();
    camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
    rotateY(camAngleY);
  endCamera();
  
  angleY += rotSpeedY;
  
  for(int i = 0; i < renderObjects.size(); i++)
  {
    renderObjects.get(i).render();
  }
  
  myLight.turnOn();
  
  rectMode(CENTER);
  noStroke();
  fill(255,0,0);
  pushMatrix();
    translate(0,-50, 0);
    rotateY(angleY);
    box(100);
  popMatrix();
  
  fill(0,255,0);
  pushMatrix();
    translate(0, -150, 0);
    sphereDetail(20);
    sphere(50);
  popMatrix();
}

void keyPressed()
{
  if(key == ' ')
  {
    //camSpeedY = camSpeedY == 0.002 ? 0 : 0.002;
    
    if(camSpeedY == 0.002)
    {
      camSpeedY = 0;
    }
    else
    {
      camSpeedY = 0.002;
    }
  }
  else if(key == 'r')
  {
    rotSpeedY = rotSpeedY == 0.01 ? 0 : 0.01;
  }
  else if(key == 'l')
  {
    myLight.changeType();
  }
}