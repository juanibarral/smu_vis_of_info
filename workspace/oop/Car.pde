class Car
{
  private int carColor;
  private int carSpeed;
  private boolean electric;
  private PVector position;
  
  //Constructor
  public Car(int pCarColor, int pCarSpeed, boolean pElectric)
  {
    carColor = pCarColor;
    carSpeed = pCarSpeed;
    electric = pElectric;
    position = new PVector(0,0);
  }
  
  public void updatePosition(PVector pPosition)
  {
    position = pPosition;
  }
  
  public void move()
  {
    position.x += carSpeed;
    if(position.x > 500)
      position.x = 0;
  }
  
 
  
  public void drawCar()
  {
    rectMode(CENTER);
    stroke(0);
    fill(carColor);
    pushMatrix();
    translate(position.x, position.y);
    rect(0, 0, 40, 10);
    rect(5, -10, 20, 10);
    ellipseMode(CENTER);
    fill(255);
    ellipse(-2, 4, 8, 8);
    ellipse(12, 4, 8, 8);
    popMatrix();
  }
  
}