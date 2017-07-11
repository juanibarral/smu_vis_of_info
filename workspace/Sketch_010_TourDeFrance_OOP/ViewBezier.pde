class ViewBezier extends ViewCurves
{
  
  public ViewBezier(Controller _controller)
  {
    super(_controller);
  }
  
  protected void drawCurve(ArrayList<PVector> curve, color curveColor)
  {
    //println("Calling the method on bezier");
    
    if(!curve.isEmpty())
    {
      ArrayList<PVector> curvePoints = curve;      
      
      fill(curveColor);
      noStroke();
      beginShape();
      PVector p0 = curvePoints.get(0);
      PVector p1 = null;
      int distance = 0;
      vertex(p0.x, p0.y);
      for(int i = 0; i < curvePoints.size(); i++)
      {
        p1 = curvePoints.get(i);
        distance = (int)dist(p1.x, p1.y, p0.x, p0.y);
        bezierVertex(
          p0.x + (distance * 0.3), p0.y,
          p1.x - (distance * 0.3), p1.y,
          p1.x, p1.y
        );
        p0 = p1;
      }
      
      p1 = new PVector(curvePoints.get(curvePoints.size() - 1).x, chartPosY + (chartHeight / 2));
      bezierVertex(
        p1.x, p1.y,
        p1.x, p1.y,
        p1.x, p1.y
      );
      p0 = p1;
      p1 = new PVector(chartPosX, chartPosY + (chartHeight / 2));
      bezierVertex(
        p1.x, p1.y,
        p1.x, p1.y,
        p1.x, p1.y
      );
      
      endShape();
    }
  }
}