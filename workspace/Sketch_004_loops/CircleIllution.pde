void drawCircleIllution()
{
  // Draw circle ilussion
  for(int i = 0; i < NUM_OBJECTS; i++)
  {
    float velStep = 2 * PI / overallVel;
    velocities[i] += velStep;
    if(velocities[i] > 2 * PI)
      velocities[i] = 0;
    float sinVel = sin(velocities[i]);
    float positionX= map(sinVel, -1, 1, -(CANVAS_WIDTH / 2), CANVAS_WIDTH / 2);
    positions[i] = positionX;
  }
  pushMatrix();
    translate(CANVAS_WIDTH / 2, CANVAS_HEIGHT / 2);
    for(int i = 0; i < NUM_OBJECTS; i++)
    {
      float increment = (i + 1) / (float)NUM_OBJECTS;
      int fillColor = lerpColor(initialColor, finalColor, increment); 
      if(showLines)
      {
        pushMatrix();
          rotate(angles[i]);
          line(-(CANVAS_WIDTH / 2), 0, CANVAS_WIDTH / 2, 0);
        popMatrix();
      }
      
      pushMatrix();
        rotate(angles[i]);
        translate(positions[i], 0);
        fill(fillColor);
        ellipse(0, 0, ELLIPSE_DIAMETER, ELLIPSE_DIAMETER);
      popMatrix();  
    }
  popMatrix();
}
