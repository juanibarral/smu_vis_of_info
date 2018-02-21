
MyToolBox myToolBox;

Car[] myCars;

void setup()
{
  size(500, 500);
  myToolBox = new MyToolBox();
  PImage redCarImage = loadImage("car.png");
  PImage greenCarImage = myToolBox.changeColor(redCarImage, color(255, 0, 0), color(0, 255, 0));
  PImage blueCarImage = myToolBox.changeColor(redCarImage, color(255, 0, 0), color(0, 0, 255));
  PImage yellowCarImage = myToolBox.changeColor(redCarImage, color(255, 0, 0), color(255, 255, 0));
  
  Car redCar;
  Car greenCar;  
  Car blueCar;
  Car yellowCar;
  redCar = new Car("Mercedes", color(255, 0, 0), 5, redCarImage);
  greenCar = new Car("Chevrolet", color(0, 255, 0), 10, greenCarImage);
  blueCar = new Car("Chevrolet", color(0, 0, 255), 2, blueCarImage);
  yellowCar = new Car("Chevrolet", color(0, 0, 255), 0, yellowCarImage);
 
  greenCar.setInitialPosition(new PVector(0, 150));
  blueCar.setInitialPosition(new PVector(0, 300));
  yellowCar.setInitialPosition(new PVector(0, 450));
  
   myCars = new Car[4];
   myCars[0] = redCar;
   myCars[1] = greenCar;
   myCars[2] = blueCar;
   myCars[3] = yellowCar;
}

void draw()
{
  background(200);
  
  for(int i = 0; i < myCars.length; i++)
  {
    Car myCar = myCars[i];
    myCar.moveForward();
    if(myCar.getPosition().x > 500)
    {
      myCar.resetPosition();
    }
    myCar.drawCar();
  }
}

void keyPressed()
{
  if(key == 'd')
  {
    myCars[3].move(Car.RIGHT);
  }
  else if (key == 'a')
  {
    myCars[3].move(Car.LEFT);
  }
  else if (key == 'w')
  {
    myCars[3].move(Car.UP);
  }
  else if (key == 's')
  {
    myCars[3].move(Car.DOWN);
  }
}