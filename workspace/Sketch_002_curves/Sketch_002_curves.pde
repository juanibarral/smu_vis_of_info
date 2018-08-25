CatmullRomCurve catmullCurve;
BezierCurve bezierCurve;
Curve currentCurve;

void setup()
{
  println("******************************************");
  println("Curves explained");
  println("2018 - Juan Ibarra (juanibarral@gmail.com)");
  println("******************************************");
  println("Click on canvas to add a point to a curve");
  println("Press e : on/off edit mode");
  println("Press c : change type of curve");
  println("Press s : show/hide control segments");
  println("For Catmull-Rom curves");
  println("Press x to show control tangent lines");
  println("Press space bar to animate tangent lines");
  
  size(800, 800);
  
  catmullCurve = new CatmullRomCurve();
  catmullCurve.setColor(color(255,0,0));
  catmullCurve.setWeight(3);
  
  bezierCurve = new BezierCurve();
  bezierCurve.setColor(color(255, 0, 0));
  bezierCurve.setWeight(3);
  
  currentCurve = catmullCurve;
}

void draw()
{
  background(currentCurve.isEditMode() ? 100 : 200);
  currentCurve.render();
  renderInfo();
}

void renderInfo()
{
  fill(255);
  textSize(20);
  text((currentCurve instanceof CatmullRomCurve) ? "Catmull-Rom Curve" : "Bezier Curve", 50, 50);
  text("Edit mode " + (currentCurve.isEditMode() ? "on" : "off"), 50, 75);
}

void mousePressed()
{
  if(!bezierCurve.isEditMode())
  {
    bezierCurve.addPoint(mouseX, mouseY);
  }
  if(!catmullCurve.isEditMode())
  {
    catmullCurve.addPoint(mouseX, mouseY);
  }
}

void mouseDragged()
{
  if(catmullCurve.isEditMode())
  {
    catmullCurve.editPointPosition(mouseX, mouseY);
  }
  if(bezierCurve.isEditMode())
  {
    bezierCurve.editPointPosition(mouseX, mouseY);
  }
}

void keyPressed()
{
  if(key == 'x')
  {
    if(currentCurve instanceof CatmullRomCurve)
    {
      ((CatmullRomCurve)catmullCurve).showExtra();
    }
  }
  else if(key == ' ')
  {
    if(currentCurve instanceof CatmullRomCurve)
    {
      ((CatmullRomCurve)catmullCurve).animateExtra();
    }
  }
  else if(key == 'e')
  {
    catmullCurve.setEditMode();
    bezierCurve.setEditMode();
  }
  else if(key == 'c')
  {
    currentCurve = currentCurve instanceof CatmullRomCurve ? bezierCurve : catmullCurve;
  }
    else if(key == 's')
  {
    currentCurve.setDrawSegmentsMode();
  }
}
