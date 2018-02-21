class Car
{
  private String brand;
  private color carColor;
  private float speed;
  private PImage carImage;
  private PVector position;
  private PVector initialPosition;
  
  public static final int RIGHT = 0;
  public static final int LEFT = 1;
  public static final int UP = 2;
  public static final int DOWN = 3;
  public Car()
  {
    brand = "";
    carColor = color(0);
    speed = 100;
    carImage = null;
    position = new PVector(0,0);
  }
  public Car(String pBrand, color pColor, float pSpeed, PImage pImage)
  {
    brand = pBrand;
    carColor = pColor;
    speed = pSpeed;
    carImage = pImage;
    position = new PVector(0,0);
    initialPosition = new PVector(0,0);
  }
  
  public void setInitialPosition(PVector pPosition)
  {
    position = pPosition;
    initialPosition = new PVector(pPosition.x, pPosition.y);
  }
  
  public void resetPosition()
  {
    position = new PVector(initialPosition.x, initialPosition.y);
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public void drawCar()
  {
    image(carImage, position.x, position.y);
    noFill();
    rect(position.x, position.y, carImage.width, carImage.height);
  }
  
  public void moveForward()
  {
    position.x += speed;
  }
  
  public void move(int direction)
  {
    switch(direction)
    {
     case RIGHT :
       position.x += 5;
     break;
     case LEFT :
       position.x -= 5;
     break;
     case UP :
       position.y -= 5;
     break;
     case DOWN :
       position.y += 5;
     break;
    }
  }
  
}