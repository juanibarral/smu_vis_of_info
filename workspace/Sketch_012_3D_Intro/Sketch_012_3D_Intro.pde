

float angleY = 0;
float speedY = 0.02;

float cameraAngleY = 0;
float cameraAngleSpeed = 0.01;
Grid myGrid;
Axes myAxes;

CustomLight myLight;
void setup()
{
  size(600, 600, P3D);
  
  myGrid = new Grid(20,10);
  myAxes = new Axes();
  //camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
  
  myLight = new CustomLight(color(255,255,255), new PVector(200, -200, 200), CustomLight.POINT);
}

void draw()
{

   background(0);
   cameraAngleY += cameraAngleSpeed;
   beginCamera();
     camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
     rotateY(cameraAngleY);
   endCamera();
   
   myGrid.render();
   myAxes.render();
   angleY += speedY;
   
   //lights();
   myLight.turnOn();
   myLight.render();
   rotateX(angleY);
   rectMode(CENTER);
   noStroke();
   fill(200,0,0);
   //ambientLight(255,255,0);
   //ambient(255,255,0);
   box(100);
}

void keyPressed()
{
  if(key == ' ')
  {
    cameraAngleSpeed = cameraAngleSpeed == 0.01 ? 0 : 0.01;
  }
  else if(key == 'l')
  {
    //myLight.setType(myLight.getType() == CustomLight.POINT ? CustomLight.DIRECTIONAL : CustomLight.POINT);
    myLight.changeType();
  }
  else if(key == 'r')
  {
    speedY = speedY == 0.02 ? 0 : 0.02;
  }
}