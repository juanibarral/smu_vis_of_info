class Controller
{
  private Model myModel;
  private View1 myView1;
  private View2 myView2;
  
  boolean hovered;
  
  public Controller()
  {
    hovered = false;
    myModel = new Model();
    myModel.loadData();
    
    myView1 = new View1(this);
    myView2 = new View2(this);
    
    myView1.setYears(myModel.getMinYear(), myModel.getMaxYear());
    setDataForYAxis(Model.DIRECTORS);
    
    PApplet.runSketch(new String[]{"My view 1"}, myView1);
    PApplet.runSketch(new String[]{"My view 2"}, myView2);
  }
  
  private void setDataForYAxis(int type)
  {
    ArrayList<String> list = myModel.getList(type);
    myView1.setList(list);
    ArrayList<Movie> movies = myModel.getMovies();
    ArrayList<int[]> moviesForView = new ArrayList<int[]>();
    for(Movie m : movies)
    {
      int year = m.getReleaseDate();
      int dataI = getListIndex(list, type == Model.PRODUCERS ? m.getProducer() : m.getDirector());
      int rt = m.getRt();
      int[] values = new int[]{year, dataI, rt};
      moviesForView.add(values);
    }
    myView1.setMovies(moviesForView);
  }
  
  public int getListIndex(ArrayList<String> list, String name)
  {
    int position = -1;
    for(int i = 0; i < list.size(); i++)
    {
      if(list.get(i).equals(name))
      {
        position = i;
        break;
      }
    }
    return position;
  }
  
  
  public void setHoverIndex(int index)
  {
    println(index);
    if(index != -1 && !hovered)
    {
      hovered = true;
      Movie movie = myModel.getMovieByIndex(index);
      println(index);
      myView2.setText(movie.getDirector()); //<>//
    }
    else if(index == -1)
    {
      hovered = false;
      myView2.setText(null);
    }
  } 
}