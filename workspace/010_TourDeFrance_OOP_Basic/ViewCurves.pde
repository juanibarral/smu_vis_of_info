class ViewCurves extends PApplet
{
  
  private int chartWidth;
  protected int chartHeight;
  protected int chartPosX;
  protected int chartPosY;
  
  private int[] padding;
  private static final int TOP = 0;
  private static final int BOTTOM = 1;
  private static final int LEFT = 2;
  private static final int RIGHT = 3;
  
  private Rider rider;
  
  protected ArrayList<PVector> posPoints; 
  private ArrayList<PVector> secsPoints;
  
  private String maxPosLabel;
  private String maxDiffLabel;
  
  private int ellipseDiameter;
  
  private int stageIndexHovered;
  private boolean hovered;
  
  private int viewId;
  
  private Controller controller;
  
  public ViewCurves()
  {
   padding = new int[4];
   padding[TOP] = 50;
   padding[BOTTOM] = 50;
   padding[LEFT] = 100;
   padding[RIGHT] = 50;
   
   chartPosX = padding[LEFT];
   chartPosY = padding[TOP];
   
   posPoints = new ArrayList<PVector>();
   secsPoints = new ArrayList<PVector>();
   
   maxPosLabel = "";
   maxDiffLabel = "";
   ellipseDiameter = 5;
   hovered = false;
  }
  
  public ViewCurves(Controller _controller)
  {
    this();
    controller = _controller;
  } //<>//
  
  public void setId(int _viewId)
  {
    viewId = _viewId;
  }
  
  public void settings()
  {
    size(950,300);
    chartWidth = width - padding[LEFT] - padding[RIGHT];
    chartHeight = height - padding[TOP] - padding[BOTTOM];
  }
  
  public void draw()
  {
    background(100);
    
    noFill();
    //rect(chartPosX, chartPosY, chartWidth, chartHeight);
    cursor(CROSS);
    
    drawCurve(posPoints, color(145,191,219));
    drawCurve(secsPoints, color(225, 225,191));
    drawPosPoints();
    drawDiffPoints();
    drawLegend();
    
    boolean h = checkHover();
    
    //if(h)
    //{
      controller.updateHovered(viewId, h, stageIndexHovered);
    //}
    
    if(hovered)
    {
      drawHover();
    }
  }
  
  private void drawLegend()
  {
    textAlign(CENTER, CENTER);
    fill(0);
    
    for(int i = 0; i < 21; i++)
    {
      int posX = chartPosX + (int)map(i, 0, 20, 0, chartWidth);
      int posY = chartPosY + chartHeight;
      line(posX, posY, posX, posY + 5);
      text((i + 1), posX, posY + 10);
    }
    text("Stages", chartPosX + (chartWidth / 2), chartPosY + chartHeight + (padding[BOTTOM] / 2));
    
    line(chartPosX, chartPosY + chartHeight, chartPosX + chartWidth, chartPosY + chartHeight);
    
    line(chartPosX, chartPosY, chartPosX, chartPosY + chartHeight);
    line(chartPosX - 10, chartPosY, chartPosX, chartPosY);
    text(maxDiffLabel, chartPosX - (padding[LEFT] / 2), chartPosY); 
    line(chartPosX - 10, (chartPosY + (chartHeight / 2)), chartPosX, (chartPosY + (chartHeight / 2)));
    line(chartPosX - 10, chartPosY + chartHeight, chartPosX, chartPosY + chartHeight);
    text(maxPosLabel, chartPosX - (padding[LEFT] / 2), chartPosY + chartHeight);
    
    pushMatrix();
      translate(chartPosX - (padding[LEFT] / 2), chartPosY + (chartHeight * 0.75));
      rotate(-PI/2);
      text("Positions", 0, 0);
    popMatrix();
    
    pushMatrix();
      translate(chartPosX - (padding[LEFT] / 2), chartPosY + (chartHeight * 0.25));
      rotate(-PI/2);
      text("Time Diff", 0, 0);
    popMatrix();
    
  }
  
  private void drawPosPoints()
  {
    for(int i = 0; i < posPoints.size(); i++)
    {
      PVector posPoint = posPoints.get(i);
      fill(255);
      stroke(0);
      ellipseMode(CENTER);
      ellipse(posPoint.x, posPoint.y, ellipseDiameter, ellipseDiameter);
      
      if(i == posPoints.size() - 1)
      {
        int pos = rider.getPosition((i + 1));
        text(pos, posPoint.x, posPoint.y + 10);
      }
    }
  }
  
  private void drawDiffPoints()
  {
    for(int i = 0; i < secsPoints.size(); i++)
    {
      PVector posPoint = secsPoints.get(i);
      fill(255);
      stroke(0);
      ellipseMode(CENTER);
      ellipse(posPoint.x, posPoint.y, ellipseDiameter, ellipseDiameter);
      
      if(i == secsPoints.size() - 1)
      {
        String diff = rider.getTimeDifferenceToLeaderString((i + 1));
        text(diff, posPoint.x, posPoint.y - 10);
      }
    }
  }
  
  protected void drawCurve(ArrayList<PVector> curve, color curveColor)
  {
    if(!curve.isEmpty())
    {
      ArrayList<PVector> curvePoints = new ArrayList<PVector>();
      curvePoints.add(curve.get(0));
      for(int i = 0; i < curve.size(); i++)
      {
        PVector posPoint = curve.get(i);
        curvePoints.add(posPoint);
      }
      curvePoints.add(posPoints.get(posPoints.size() - 1));
      curvePoints.add(posPoints.get(posPoints.size() - 1));
      curvePoints.add(posPoints.get(posPoints.size() - 1));
      
      curvePoints.add(new PVector(posPoints.get(posPoints.size() - 1).x, chartPosY + (chartHeight / 2)));
      curvePoints.add(new PVector(posPoints.get(posPoints.size() - 1).x, chartPosY + (chartHeight / 2)));
      curvePoints.add(new PVector(posPoints.get(posPoints.size() - 1).x, chartPosY + (chartHeight / 2)));
      
      curvePoints.add(new PVector(chartPosX, chartPosY + (chartHeight / 2)));
      curvePoints.add(new PVector(chartPosX, chartPosY + (chartHeight / 2)));
      curvePoints.add(new PVector(chartPosX, chartPosY + (chartHeight / 2)));
      
      
      fill(curveColor);
      noStroke();
      beginShape();
      for(int i = 0; i < curvePoints.size(); i++)
      {
        PVector curvePoint = curvePoints.get(i);
        curveVertex(curvePoint.x, curvePoint.y);
      }
      endShape();
    }
  }
  
  public void setRider(Rider rider)
  {
    this.rider = rider;
    posPoints.clear();
    secsPoints.clear();
    int[] positions = rider.getPositions();
    int maxPosition = max(positions);
    maxPosLabel = str(maxPosition);
    for(int i = 0; i < positions.length; i++) //<>//
    {
      int position = positions[i];
      if(position == 0)
        break;
      int posX = chartPosX + (int)map(i, 0, 20, 0, chartWidth);
      int posY = chartPosY + (chartHeight / 2 ) + (int)map(position, 1, maxPosition, 0, chartHeight / 2);
      posPoints.add(new PVector(posX, posY));
    }
    
    int[] seconds = rider.getTimeDifferenceToLeader();
    int maxSeconds = max(seconds);
    
    for(int i = 0; i < posPoints.size(); i++)
    {
      int timeDifference = seconds[i];
      int posX = chartPosX + (int)map(i, 0, 20, 0, chartWidth);
      int posY = chartPosY + (chartHeight / 2 ) - (int)map(timeDifference, 0, maxSeconds, 0, chartHeight / 2);
      secsPoints.add(new PVector(posX, posY));
      
      if(timeDifference == maxSeconds)
        maxDiffLabel = rider.getTimeDifferenceToLeaderString(i + 1); 
    }
    
  }
  
  private boolean checkHover()
  {
    boolean hovered = false;
    for(int i = 0; i < posPoints.size(); i++)
    {
      PVector p = posPoints.get(i);
      float distance = dist(mouseX, mouseY, p.x, p.y);
      if(distance <= ellipseDiameter / 2)
      {
        hovered = true;
        stageIndexHovered = i;
        break;
      }
    }
    return hovered;
  }
  
  public void updateHovered(boolean h, int index)
  {
    stageIndexHovered = index;
    hovered = h;
    println(viewId + " " + stageIndexHovered);
  }
  
  private void drawHover()
  {
    int index = stageIndexHovered;
    PVector p = posPoints.get(index);
    PVector p1 = secsPoints.get(index);
    fill(255);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(p.x, p.y, 10, 10);    
    line(p.x, p.y, p1.x, p1.y);
    
    String pos = str(rider.getPosition(index + 1));
    String diff = rider.getTimeDifferenceToLeaderString(index + 1);
    
    text(pos, p.x, p.y + 15);
    text(diff, p1.x, p1.y - 15);
  }
  
  public void updateHover(boolean h, int indexStage)
  {
    stageIndexHovered = indexStage;
    hovered = h;
  }
  
}