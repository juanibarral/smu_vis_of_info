class View1 extends PApplet
{
  private int minYear;
  private int maxYear;
  private ArrayList<String> list;
  private ArrayList<int[]> movies;
  private static final int TOP = 50;
  private static final int LEFT = 150;
  public static final int MIN_COLOR = 0;
  public static final int MAX_COLOR = 255;
  public static final int MIN_RADIUS = 10;
  public static final int MAX_RADIUS = 50;
  private Controller myController;
  
  public View1(Controller pController)
  {
    myController = pController;
  }
  
  public void settings()
  {
    this.size(1000, 500);
  }
  
  public void draw()
  {
    this.background(0);
    //rect(LEFT, TOP, this.width - (2 * LEFT), this.height - (2 * TOP));
    drawMovies();
    drawAxis();
  }
  
  private void drawAxis()
  {
    stroke(255);
    fill(255);
    for(int i = minYear; i < maxYear; i++)
    {
      int x = (int)map(i, minYear, maxYear, LEFT, this.width - LEFT);
      int y = this.height - TOP;
      line(x, y, x, y + 10);  
      pushMatrix();
      translate(x, y + 10);
      rotate(PI/4);
      text(i, 0, 0);
      popMatrix();
    }
    for(int i = 0; i < list.size(); i++)
    {
      int x = this.width - LEFT;
      int y = (int)map(i, 0, list.size() - 1, TOP, this.height - TOP);
      line(x, y, x + 10, y);  
      text(list.get(i), x + 10, y);
    }
  }
  
  public void drawMovies()
  {
    ellipseMode(CENTER);
    int hovered = -1;
    for(int i = 0; i < movies.size(); i++)
    {
      int year = movies.get(i)[0];
      int producerI = movies.get(i)[1];
      int rt = movies.get(i)[2];
      int x = (int)map(year, minYear, maxYear, LEFT, this.width - LEFT);
      int y = (int)map(producerI, 0, list.size() - 1, TOP, this.height - TOP);
      int radius = (int)map(rt, 0, 100, MIN_RADIUS, MAX_RADIUS);
      int c = (int)map(rt, 0, 100, MIN_COLOR, MAX_COLOR);
      
      float distance = dist(this.mouseX, this.mouseY, x, y);
      if(distance <= radius / 2)
      {
        stroke(255);
        hovered = i;
      } 
      else
      {
        noStroke();
      }
      
      fill(c, 0, 0);
      ellipse(x, y, radius, radius);
    }
    
    myController.setHoverIndex(hovered);
  }
  
  public void setYears(int pMinYear, int pMaxYear)
  {
    minYear = pMinYear;
    maxYear = pMaxYear;
  }
  
  public void setList(ArrayList<String> pList)
  {
    list = pList;
  }
  
  public void setMovies(ArrayList<int[]> pMovies)
  {
    movies = pMovies;
  }
}