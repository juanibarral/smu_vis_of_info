void drawAlienSpaceship()
{
  
  noStroke();
  fill(255);
  arc(0, -100, 80, 80, -PI, 0);
  rectMode(CENTER);
  rect(0, -50, 80, 100);
  
  stroke(0);
  ellipseMode(CENTER);
  fill(100);
  ellipse(0, 0, 100, 20);
}
