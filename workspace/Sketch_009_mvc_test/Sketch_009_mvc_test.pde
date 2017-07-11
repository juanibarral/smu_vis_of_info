Controller controller;

int posX;
int posY;
int radius;

boolean inside;
void settings()
{
  size(200, 200);
}

void setup()
{
  controller = new Controller();
  
  posX = 100;
  posY = 100;
  radius = 100;
  
  inside = false;
}

void draw()
{
  background(200);
  
  fill(0);
  ellipse(posX, posY, radius, radius);
  
  float distance = dist(mouseX, mouseY, posX, posY);
  if(distance <= (radius / 2) && !inside)
  {
    inside = true;
    controller.updateSize();
    controller.update(1,true);
    controller.update(2,true);
    
  }
  else if(distance > (radius/2) && inside)
  {
    inside = false;
    controller.updateSize();
    controller.update(1,false);
    controller.update(2,false);
  }
}