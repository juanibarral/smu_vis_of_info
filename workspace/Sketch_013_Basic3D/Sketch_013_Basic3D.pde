Axis myAxis;
float rotYSpeed = 0.01;
float angleY = 0;
ArrayList<Renderable> renderables;

boolean lightsOn;
boolean axisOn;
void settings()
{
  size(800, 800, P3D);
  myAxis = new Axis();
  renderables = new ArrayList<Renderable>();
  renderables.add(new BasicBox());
  renderables.add(new BasicSphere());
  lightsOn = true;
}

void draw()
{
  background(0);
  
  angleY += rotYSpeed;
  
  beginCamera();
    camera(300, -300, 300, 0, 0, 0, 0, 1, 0);
    //rotateY(angleY);
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
    r.updateAngle(angleY);
    r.draw();
  }
}

void keyPressed()
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
