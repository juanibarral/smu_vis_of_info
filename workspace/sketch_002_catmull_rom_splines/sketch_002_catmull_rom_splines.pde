PImage myBackground;
ArrayList<PVector> points = new ArrayList<PVector>();
int curveColor = color(255,0,0);
int extraColor = color(0,0,255);
boolean animate = false;
boolean showExtra = false;
float currentperc = 0;
void settings()
{
  println("******************************************");
  println("Catmull-Rom splines explained");
  println("2018 - Juan Ibarra (juanibarral@gmail.com)");
  println("******************************************");
  println("Click on canvas to add a point to a curve");
  println("Press s to show control tangent lines");
  println("Press space bar to animate tangent lines");
  
  size(800, 800);
}

void draw()
{
  background(200);
  noFill();
  
  if(animate)
  {
    currentperc += 0.01;
    if(currentperc > 1)
    {
      currentperc = 1;
    }
  }

    strokeWeight(1);
    // Draw the lines between points
    for(int i = 0; i < points.size(); i++)
    {
      if(points.size() > i + 1)
      {
        stroke(0);
        line(
          points.get(i).x,
          points.get(i).y,
          points.get(i + 1).x,
          points.get(i + 1).y
          );
      }
      
      if(points.size() > i + 2 && showExtra)
      {
        stroke(extraColor);
        PVector p1 = new PVector(points.get(i).x, points.get(i).y);
        PVector p2 = new PVector(points.get(i + 1).x, points.get(i + 1).y);
        PVector p3 = new PVector(points.get(i + 2).x, points.get(i + 2).y);
        
        PVector rp = new PVector(p1.x + ((p2.x - p1.x)*currentperc), p1.y + ((p2.y - p1.y)*currentperc)); 
        pushMatrix();
          translate(rp.x, rp.y);
          line(0,0, p3.x - p1.x, p3.y - p1.y);
        popMatrix();
        if(currentperc != 1)
        {
          line(p1.x, p1.y, p3.x, p3.y);
        }
      }
    }
  
  stroke(curveColor);
  strokeWeight(3);
  beginShape();
  for(int i = 0; i < points.size(); i++)
  {
    curveVertex(points.get(i).x, points.get(i).y);
  }
  endShape();
  
  stroke(0);
  strokeWeight(1);
  // Draw the control points
  for(int i = 0; i < points.size(); i++)
  {
    ellipse(points.get(i).x, points.get(i).y, 5, 5);
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
    animate =! animate;
      if(!animate)
      {
        currentperc = 0;
      }
  }
  else if(key == 's')
  {
    showExtra =! showExtra;
  }
  
}
