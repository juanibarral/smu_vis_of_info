class Car extends GameObject
{
  public Car()
  {
    super();
  }
  
  public void createObject()
  {
    rectMode(CENTER);
    rect(0, 0, 50, 25); 
  }
}