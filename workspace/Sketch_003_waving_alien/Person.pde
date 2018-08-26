public void drawPerson()
{ 
  if(personWavingPositive)
  {
    personWavingAngle += personWavingSpeed;
  }
  else
  {
    personWavingAngle -= personWavingSpeed;
  }
  
  if(personWavingAngle > PI / 4)
  {
    personWavingPositive = false;
  }
  else if (personWavingAngle < 0)
  {
    personWavingPositive = true;
  }
  
  fill(255);
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
      rotate(personWavingAngle);
      rect(0, 0, 10, -40);
    popMatrix();
  popMatrix();
}
