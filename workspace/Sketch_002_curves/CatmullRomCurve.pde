class CatmullRomCurve extends Curve
{
  private boolean animateExtra;
  private float currentPerc;
  private boolean showExtra;
  
  public CatmullRomCurve()
  {
    super();
    animateExtra = false;
    currentPerc = 0;
    showExtra = false;
  }
  
  protected void drawCurve()
  {
    for(int i = 0; i < points.size(); i++)
    {
      curveVertex(points.get(i).getX(), points.get(i).getY());
    }
  }
  
  protected void drawControlSegments()
  {
    if(animateExtra)
    {
      currentPerc += 0.01;
      if(currentPerc > 1)
      {
        currentPerc = 1;
      }
    }

    noFill();
    strokeWeight(1);
    stroke(0);
    // Draw the lines between points
    for(int i = 0; i < points.size(); i++)
    {
      fill(0);
      text("p" + i, points.get(i).getX(), points.get(i).getY() + 20);
      
      if(points.size() > i + 1)
      {
        stroke(0);
        line(
          points.get(i).getX(),
          points.get(i).getY(),
          points.get(i + 1).getX(),
          points.get(i + 1).getY()
          );
      }
      
      if(points.size() > i + 2 && showExtra)
      {
        stroke(0, 0, 255);
        PVector p1 = new PVector(points.get(i).getX(), points.get(i).getY());
        PVector p2 = new PVector(points.get(i + 1).getX(), points.get(i + 1).getY());
        PVector p3 = new PVector(points.get(i + 2).getX(), points.get(i + 2).getY());
        
        PVector rp = new PVector(p1.x + ((p2.x - p1.x)*currentPerc), p1.y + ((p2.y - p1.y)*currentPerc)); 
        pushMatrix();
          translate(rp.x, rp.y);
          line(0,0, p3.x - p1.x, p3.y - p1.y);
        popMatrix();
        if(currentPerc != 1)
        {
          line(p1.x, p1.y, p3.x, p3.y);
        }
      }
    }
  }
  
  public void showExtra()
  {
    showExtra =! showExtra;
  }
  
  public void animateExtra()
  {
    animateExtra =! animateExtra;
    if(!animateExtra)
    {
      currentPerc = 0;
    }
  }
}
