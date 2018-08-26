void drawEarth()
{
  ellipseMode(CENTER);
  fill(0,0,255);
  ellipse(0,0, 100, 100);
  fill(255, 169, 40);
  triangle(0, 0, 30, 10, 0, 40);
  quad(0, 0, 25, -30, -30, -30, -40, -10);
}
