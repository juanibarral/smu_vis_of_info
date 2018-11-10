int sliderWidth = canvasWidth - 100;
int sliderValue = 0;
int selectorDiameter = 20;
int selectorWeight = 1;

PVector sliderPosition = new PVector(20, 40);
PVector selectorPosition = new PVector(sliderPosition.x, sliderPosition.y);

void moveSlider(int x, int y)
{
  float distance = dist(x, y, selectorPosition.x, selectorPosition.y);
  if(distance <= selectorDiameter/2)
  {
    selectorPosition.x = x;
    if(selectorPosition.x < sliderPosition.x)
    {
      selectorPosition.x = sliderPosition.x;
    }
    else if(selectorPosition.x > sliderPosition.x + sliderWidth)
    {
      selectorPosition.x = sliderPosition.x + sliderWidth;
    }
    
    sliderValue = (int)map(selectorPosition.x, sliderPosition.x, sliderPosition.x + sliderWidth, 0, 100);
  }
}

void hoverSlider(int x, int y)
{
  float distance = dist(x, y, selectorPosition.x, selectorPosition.y);
  selectorWeight = distance <= selectorDiameter/2 ? 3 : 1;
}

void drawSlider()
{
  stroke(0);
  fill(255);
  strokeWeight(10);
  line(sliderPosition.x, sliderPosition.y, sliderPosition.x + sliderWidth, sliderPosition.y);
  
  strokeWeight(selectorWeight);
  ellipse(selectorPosition.x, selectorPosition.y, selectorDiameter, selectorDiameter);
  
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  text(sliderValue, sliderPosition.x + sliderWidth + 30, sliderPosition.y);
}
