int canvasWidth = 500;
int canvasHeight = 300;

static final String RED_TXT = "Red";
static final String GREEN_TXT = "Green";
static final String BLUE_TXT = "Blue";

static final int RED_COLOR = #FF0000;
static final int GREEN_COLOR = #00FF00;
static final int BLUE_COLOR = #0000FF;

int currentColor = RED_COLOR;
String currentText = RED_TXT;

void settings()
{
  size(canvasWidth, canvasHeight);
}

void draw()
{
  background(200);
  
  drawSlider();
  
  strokeWeight(1);
  stroke(0);
  //**********************************
  // Play with conditionals!
  //**********************************
  
  if(sliderValue < 30)
  {
    currentColor = RED_COLOR;
  }
  else if(sliderValue < 60)
  {
    currentColor = GREEN_COLOR;
  }
  else
  {
    currentColor = BLUE_COLOR;
  }
  
  switch(currentColor)
  {
    case RED_COLOR:
      currentText = RED_TXT;
    break;
    case GREEN_COLOR:
      currentText = GREEN_TXT;
    break;
    case BLUE_COLOR:
      currentText = BLUE_TXT;
    break;
  }
  
  //**********************************
  // Play with conditionals!
  //**********************************
  
  fill(0);
  text(currentText, canvasWidth - 101, (canvasHeight / 2) - 1);
  fill(currentColor);
  rectMode(CENTER);
  rect(canvasWidth / 2, (canvasHeight / 2) + 30, 200, 200);
  
  text(currentText, canvasWidth - 100, canvasHeight / 2);
}

void mouseDragged()
{
  moveSlider(mouseX, mouseY);
}

void mouseMoved()
{
 hoverSlider(mouseX, mouseY); 
}
