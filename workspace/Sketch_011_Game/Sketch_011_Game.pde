
Controller mainController;
int boundsWidth;
int boundsHeight;

void settings()
{
  boundsWidth = 600;
  boundsHeight = 600;
  size(boundsWidth, boundsHeight);
}
void setup()
{
  
  mainController = new Controller();
  mainController.setBounds(boundsWidth, boundsHeight);
}

void draw()
{
  mainController.updateView();
}

void mouseClicked()
{
  mainController.updateClicked(mouseX, mouseY);
}