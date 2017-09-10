PImage myBackground;
ArrayList<PVector> points = new ArrayList<PVector>();


void settings()
{
   myBackground = loadImage("popin_2016.jpg");
  int myWidth = myBackground.width;
  int myHeight = myBackground.height;
  size(myWidth, myHeight);
}

void draw()
{
  background(myBackground);
  
  beginShape();
  for(int i = 0; i < points.size(); i++)
  {
    if(i == 0 || i == points.size() - 1)
    {
      curveVertex(points.get(i).x, points.get(i).y);
    }
    curveVertex(points.get(i).x, points.get(i).y);
    
  }
  endShape();
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