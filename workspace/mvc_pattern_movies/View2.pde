class View2 extends PApplet
{
  private String movieTitle;
  private int dataAxis;
  private Controller myController;
  
  public View2(Controller pController)
  {
    myController = pController;
  }
  
  public void settings()
  {
    this.size(300, 500);
    dataAxis = Model.DIRECTORS;
  }
  
  public void draw()
  {
   this.background(200);
   drawText();
   drawLegend();
   drawSwitch();
  }
  
  private void drawLegend()
  {
    ellipseMode(CENTER);
    
    for(int i = 0; i <= 5; i++)
    {
      noStroke();
      int x = 30;
      int y = (int)map(i, 0, 5, 100, 400);
      int c = (int)map(i, 0, 5, View1.MIN_COLOR, View1.MAX_COLOR);
      int r = (int)map(i, 0, 5, View1.MIN_RADIUS, View1.MAX_RADIUS);
      int rt = (int)map(i, 0, 5, 0, 100);
      fill(c,0,0);
      ellipse(x, y, r, r);
      fill(255);
      textSize(12);
      text(rt, x + (r / 2), y);
    }
  }
  
  private void drawSwitch()
  {
    ellipseMode(CENTER);
    fill(100);
    ellipse(30, 470, 30, 30);
    rectMode(CORNER);
    rect(30, 455, 50, 30);
    ellipse(80, 470, 30, 30);
    fill(200);
    if(dataAxis == Model.DIRECTORS)
    {
      ellipse(30, 470, 25, 25);
    }
    else
    {
      ellipse(80, 470, 25, 25);
    }
    fill(255);
    textSize(20);
    text(dataAxis == Model.DIRECTORS ? "Directors" : "Producers", 100, 470);
  }
  private void drawText()
  {
    if(movieTitle != null)
    {
      textSize(24);
      text(movieTitle, 10, 50);
    }
  }
  
  public void setText(String pTitle)
  {
   movieTitle = pTitle; 
  }
  
  public void mousePressed()
  {
    float dist = 0;
    if(dataAxis == Model.DIRECTORS)
    {
      dist = dist(30, 470, this.mouseX, this.mouseY);
    }
    else
    {
      dist = dist(80, 470, this.mouseX, this.mouseY);
    }
    if(dist < 25)
    {
      if(dataAxis == Model.DIRECTORS)
      {
        dataAxis = Model.PRODUCERS;
      }
      else
      {
        dataAxis = Model.DIRECTORS;
      }
      myController.setDataForYAxis(dataAxis);
    }
  }
}