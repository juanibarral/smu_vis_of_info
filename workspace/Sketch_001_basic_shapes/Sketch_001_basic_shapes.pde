void setup()
{
  size(500, 500);
  background(255);
  
  strokeWeight(1);
  
  noFill();
  
  stroke(255,0,0);
  rectMode(CORNER); 
  rect(255, 255, 200, 200);
  
  stroke(0,255,0);
  rectMode(CORNERS);
  rect(255, 255, 200, 200);
 
 stroke(0,0,255);
 rectMode(RADIUS);
 rect(255, 255, 200, 200);
 
  stroke(0,255,255);
 rectMode(CENTER);
 rect(255, 255, 200, 200);
 
 stroke(255,0,0);
 ellipseMode(RADIUS);
 ellipse(255, 255, 200, 100);
 
  stroke(0,255,0);
 ellipseMode(CENTER);
 ellipse(255, 255, 200, 100);
 
  stroke(0,0,255);
 ellipseMode(CORNER);
 ellipse(255, 255, 200, 100);
 
  stroke(0,255,255);
 ellipseMode(CORNERS);
 ellipse(255, 255, 200, 100);
}