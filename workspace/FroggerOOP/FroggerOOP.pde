static final int WINDOW_WIDTH = 1000;
static final int WINDOW_HEIGHT = 600; 

ArrayList<GameObject> myObjects;


void settings()
{
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
  
  myObjects = new ArrayList<GameObject>();
  
  Frog myFrog = new Frog();
  myFrog.updatePosition(new PVector(WINDOW_WIDTH/2, WINDOW_HEIGHT - 25));
  myFrog.setColor(color(0,255,0));
  myFrog.setCircleCollider(25);
  myFrog.setRenderCollider(true);
  Car myCar1 = new Car();
  myCar1.updatePosition(new PVector(0, 50));
  myCar1.setVelocity(new PVector(10, 0));
  myCar1.setColor(color(255,0,255));
  myCar1.setCircleCollider(25);
  myCar1.setRenderCollider(true);
  
  Car myCar2 = new Car();
  myCar2.updatePosition(new PVector(0, 100));
  myCar2.setVelocity(new PVector(5, 0));
  myCar2.setColor(color(0,0,255));
  myCar2.setBoxCollider(new PVector(-25, -12), 50, 25);
  myCar2.setRenderCollider(true);
  
  Truck myTruck1 = new Truck();
  myTruck1.updatePosition(new PVector(0, 150));
  myTruck1.setVelocity(new PVector(5, 0));
  myTruck1.setColor(color(0));
  
  myObjects.add(myFrog);
  myObjects.add(myCar1);
  myObjects.add(myCar2);
  myObjects.add(myTruck1);
  
  
}

void draw()
{
  background(200);
  for(int i = 0; i < myObjects.size(); i++)
  {
    GameObject myObject = myObjects.get(i);
    myObject.move();
    myObject.renderObject();
    if(myObject.isCollider())
    {
      for(int j = 0; j < myObjects.size() && i != j; j ++)
      {
        GameObject myOtherObject = myObjects.get(j);
        if(myOtherObject.isCollider())
        {
          if(myObject.checkCollision(myOtherObject))
          {
            println("Collision!!!");
            noLoop();
          }
        }
        
      }
    }
  }
  

}

void keyPressed()
{
  Frog myFrog = (Frog)myObjects.get(0);
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      myFrog.moveUp();
    }
    else if(keyCode == DOWN)
    {
      myFrog.moveDown();
    }
    else if(keyCode == RIGHT)
    {
      myFrog.moveRight();
    }
    else if(keyCode == LEFT)
    {
      myFrog.moveLeft();
    }  
  }
  
}