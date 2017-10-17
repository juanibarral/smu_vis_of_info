
Car car1;
Car car2;
Car car3;
Car car4;
Car car5;

Frog myFrog;
Frog myFrog2;

void setup()
{
  car1 = new Car(color(255, 0 , 0), 10, false);
  car1.updatePosition(new PVector(10, 50));
  car2 = new Car(color(0, 255 , 0), 8, false);
  car2.updatePosition(new PVector(10, 100));
  car3 = new Car(color(0, 0 , 255), 5, false);
  car3.updatePosition(new PVector(10, 150));
  car4 = new Car(color(0, 255 , 255), 3, false);
  car4.updatePosition(new PVector(10, 200));
  car5 = new Car(color(255, 0 , 255), 2, false);
  car5.updatePosition(new PVector(10, 250));
  
  myFrog = new Frog(new PVector(400, 400), color(0,255,0));
  myFrog2 = new Frog(new PVector(100, 400), color(255,255,0));
  
  size(500, 500);
}

void draw()
{
  background(200);
  car1.move();
  car1.drawCar();
  car2.move();
  car2.drawCar();
  car3.move();
  car3.drawCar();
  car4.move();
  car4.drawCar();
  car5.move();
  car5.drawCar();
  
  myFrog.drawFrog();
  myFrog2.drawFrog();
}

void keyPressed()
{
  if(key == 'u')
    myFrog.moveUp();
  else if(key == 'j')
    myFrog.moveDown();
  else if(key == 'w')
    myFrog2.moveUp();
  else if(key == 's')
    myFrog2.moveDown();
    
    
}