void drawDashboard()
{
  fill(255);
  stroke(255);
  textAlign(CENTER);
  textSize(24);
  text("Planets on Star Wars films", 200, 20);
  textSize(12);
  text("Quantity of Water", 100, 50);
  for(int i = 1; i <= 4; i++)
  {
    float perc = (float)i / (float)4;
    int legendColor = lerpColor(fromPlanetColor, toPlanetColor, perc);
    fill(legendColor);
    
    rect(50, (i * 20) + 50, 50, 20);
    fill(255);
    text("<" + perc, 120, (i * 20) + 60);
  }
}
