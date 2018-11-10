void drawExplanation()
{
  // Draw explanation
  int minX = CANVAS_WIDTH + 100;
  int maxX = (CANVAS_WIDTH * 3) - 100;
  int minY = 100;
  int maxY = CANVAS_HEIGHT - 100;
  int lineResolution = 100;
  fill(0);
  textAlign(CENTER, CENTER);
  text("1", minX - 10, minY);
  text("0", minX - 10, CANVAS_HEIGHT / 2);
  text("-1", minX - 10, maxY);
  text("π/2", minX + ((maxX - minX) * 0.25), (CANVAS_HEIGHT / 2) + 20);
  text("π", minX + ((maxX - minX) * 0.5), (CANVAS_HEIGHT / 2) + 20);
  text("3π/2", minX + ((maxX - minX) * 0.75), (CANVAS_HEIGHT / 2) + 20);
  text("2π", maxX, (CANVAS_HEIGHT / 2) + 20);
  line(minX, minY, minX, maxY);
  line(minX, CANVAS_HEIGHT / 2, maxX, CANVAS_HEIGHT / 2);
  
  float lineStep = 2 * PI / lineResolution;
  for(int i = 0; i < lineResolution; i++)
  {
    float posX = map(i * lineStep, 0, 2 * PI, minX, maxX);
    float posY = map(sin(i * lineStep), -1, 1, maxY, minY);
    ellipse(posX, posY, 1, 1);
  }
  
  for(int i = 0; i < NUM_OBJECTS; i++)
  {
    float increment = (i + 1) / (float)NUM_OBJECTS;
    int fillColor = lerpColor(initialColor, finalColor, increment); 
    float posX = map(velocities[i], 0, 2 * PI, minX, maxX);
    float posY = map(sin(velocities[i]), -1, 1, maxY, minY);
    fill(fillColor);
    ellipse(posX, posY, 20, 20);
  }
  
}
