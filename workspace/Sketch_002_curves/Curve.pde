abstract class Curve
{
  protected ArrayList<ControlPoint> points;
  protected int curveColor;
  protected int curveWeight;
  protected boolean editMode;
  protected boolean drawSegmentsMode;
  
  public Curve()
  {
    points = new ArrayList<ControlPoint>();
    curveColor = color(0);
    curveWeight = 1;
    editMode = false;
    drawSegmentsMode = true;
  }
  
  public void setColor(int newColor)
  {
    curveColor = newColor;
  }
  
  public void setWeight(int newWeight)
  {
    curveWeight = newWeight;
  }
  
  public void render()
  {
    noFill();
    stroke(curveColor);
    strokeWeight(curveWeight);
    beginShape();
    drawCurve();
    endShape();
    
    if(drawSegmentsMode)
    {
      drawControlSegments();
    }
    drawControlPoints();
  }
  
  protected void drawCurve(){};
  protected void drawControlSegments(){};
  
  protected void drawControlPoints()
  {
    for(ControlPoint p : points)
    {
      p.checkHovering();
      p.render();
    }
  }
  
  public void addPoint(int x, int y)
  {
      points.add(new ControlPoint(x, y));
  }
  
  public void setEditMode()
  {
    editMode =! editMode;
  }
  
  public boolean isEditMode()
  {
    return editMode;
  }
  
  public void editPointPosition(int newX, int newY)
  {
    for(ControlPoint p : points)
    {
      if(p.checkHovering())
      {
        p.setPosition(new PVector(newX, newY));
      }
      p.render();
    }
  }
  
  public void setDrawSegmentsMode()
  {
    drawSegmentsMode =! drawSegmentsMode;
  }
}
