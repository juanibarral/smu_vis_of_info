PImage myBackground;
ArrayList<PVector> points;

void settings()
{
  myBackground = loadImage("popin_2016.jpg");  
  size(myBackground.width, myBackground.height);
  points = new ArrayList<PVector>();
}

void draw()
{
  background(myBackground);
  
  ellipseMode(CENTER);
  for(int i = 0; i < points.size() - 2; i++)
  {
    PVector eCenter = points.get(i);
    PVector eWidth = points.get(i + 1);
    PVector eHeight = points.get(i + 2);
    float eW = dist(eWidth.x, eWidth.y, eCenter.x, eCenter.y);
    float eH = dist(eHeight.x, eHeight.y, eCenter.x, eCenter.y);
    ellipse(eCenter.x, eCenter.y, eW * 2, eH * 2);
  }
}

void mousePressed()
{
  points.add(new PVector(mouseX, mouseY));
}

void keyPressed()
{
  if(key == ' ')
  {
    for(int i = 0; i < points.size(); i++)
    {
      println(points.get(i).x, points.get(i).y);
    }
  }
}