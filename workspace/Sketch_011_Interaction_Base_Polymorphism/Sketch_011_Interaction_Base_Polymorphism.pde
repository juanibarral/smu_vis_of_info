ArrayList<Object2D> myObjects;

void settings()
{
  size(800, 800);
  myObjects = new ArrayList<Object2D>();
  
  Circle c = new Circle(100);
  c.setPosition(new PVector(400, 400));
  c.setClickable(color(255, 0, 0));
  myObjects.add(c);
  
  Star s = new Star(100);
  s.setPosition(new PVector(200, 600));
  s.setClickable(color(0, 0, 255));
  myObjects.add(s);
  
  Box b = new Box(300, 200);
  b.setPosition(new PVector(500, 500));
  b.setClickable(color(0, 255, 255));
  myObjects.add(b);
}

void draw()
{
  background(255);
  for(Object2D object : myObjects) {
    if(object instanceof Circle2DHoverable)
    {
      ((Circle2DHoverable)object).checkHovering(mouseX, mouseY);
    }
    if(object instanceof Box2DHoverable)
    {
      ((Box2DHoverable)object).checkHovering(mouseX, mouseY);
    }
    object.render();
  }
}

void mouseClicked()
{
  for(Object2D object : myObjects) {
    if(object instanceof Circle2DHoverable) {
      ((Circle2DHoverable)object).click();
    }
    if(object instanceof Box2DHoverable) {
      ((Box2DHoverable)object).click();
    }
  }
}
