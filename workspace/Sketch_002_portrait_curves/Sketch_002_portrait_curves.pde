PImage myBackground;
ArrayList<ArrayList<PVector>> points = new ArrayList<ArrayList<PVector>>();
int currentShape = 0;

void settings()
{
  println("******************************************");
  println("Curve creator");
  println("2018 - Juan Ibarra (juanibarral@gmail.com)");
  println("******************************************");
  println("Click on canvas to add a point to a shape");
  println("Press space bar to create a new shape");
  println("Press p to print the shapes in a file");
  myBackground = loadImage("popin_2016.jpg");
  int myWidth = myBackground.width;
  int myHeight = myBackground.height;
  size(myWidth, myHeight);
  
  points.add(new ArrayList<PVector>());
}

void draw()
{
  background(myBackground);
  
  for(int j = 0; j < points.size(); j++)
  {
    ArrayList<PVector> points_j = points.get(j);
    beginShape();
    for(int i = 0; i < points_j.size(); i++)
    {
      if(i == 0 || i == points_j.size() - 1)
      {
        curveVertex(points_j.get(i).x, points_j.get(i).y);
      }
      curveVertex(points_j.get(i).x, points_j.get(i).y);
    }
    endShape();
  }
}

void mousePressed()
{
  points.get(currentShape).add(new PVector(mouseX, mouseY));
}

void keyPressed()
{
  if(key == 'p')
  {
    println("Creating file with curves...");
    PrintWriter output = createWriter("curves.txt");
    for(int j = 0; j < points.size(); j++)
    {
      ArrayList<PVector> points_j = points.get(j);
      output.println("beginShape();");
      for(int i = 0; i < points_j.size(); i++)
      {
        output.println("curveVertex(" + points_j.get(i).x + "," + points_j.get(i).y + ");");
      }
      output.println("endShape();");
    }
    output.flush();
    output.close();
    println("File created");
  }
  else if (key == ' ')
  {
    currentShape++;
    points.add(new ArrayList<PVector>());
  }
}
