public void drawAlien()
{ 
  if(alienWavingPositive)
  {
    alienWavingAngle += alienWavingSpeed;
  }
  else
  {
    alienWavingAngle -= alienWavingSpeed;
  }
  
  if(alienWavingAngle > PI / 4)
  {
    alienWavingPositive = false;
  }
  else if (alienWavingAngle < 0)
  {
    alienWavingPositive = true;
  }
  fill(0,255,0);
  pushMatrix();
    translate(0, -25);
    rectMode(CENTER);
    rect(0,0,30, 50);
    //head
    ellipseMode(CENTER);
    ellipse(0,-40, 30, 30);
    //Arm
    rectMode(CORNER);
    pushMatrix();
      translate(15,-25);
      rotate(alienWavingAngle);
      rect(0, 0, 10, -40);
    popMatrix();
  popMatrix();
}
