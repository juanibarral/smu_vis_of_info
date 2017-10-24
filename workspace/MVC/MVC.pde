Controller myController;

void settings()
{
  size(400, 600);
}
void setup()
{
  myController = new Controller();
}

void draw()
{
  background(0,255,0);
  myController.update();
}