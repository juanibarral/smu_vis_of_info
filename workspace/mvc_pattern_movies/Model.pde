class Model
{
  private ArrayList<Movie> movies;
  private int minYear;
  private int maxYear;
  
  public static final int PRODUCERS = 0;
  public static final int DIRECTORS = 1;
  public Model()
  {
    movies = new ArrayList<Movie>();
    minYear = Integer.MAX_VALUE;
    maxYear = Integer.MIN_VALUE;
  }
  
  public void loadData()
  {
    JSONArray myObject = loadJSONArray("https://ghibliapi.herokuapp.com/films");
    for(int i = 0; i < myObject.size(); i++)
    {
      JSONObject objectI = myObject.getJSONObject(i);
      int releaseDate = objectI.getInt("release_date");
      String title = objectI.getString("title");
      String id = objectI.getString("id");
      String producer = objectI.getString("producer");
      String director = objectI.getString("director");
      int rt = objectI.getInt("rt_score");
      Movie movieI = new Movie(releaseDate, id, title, rt, producer, director);
      movies.add(movieI);
      if(minYear > releaseDate)
      {
        minYear = releaseDate;
      }
      if(maxYear < releaseDate)
      {
        maxYear = releaseDate;
      }
    }
  }
  public int getMinYear()
  {
    return minYear;
  }
  
  public int getMaxYear()
  {
    return maxYear;
  }
  
  public ArrayList<String> getList(int type)
  {
    ArrayList<String> list = new ArrayList<String>();
    for(int i = 0; i < movies.size(); i++)
    {
      Movie movie = movies.get(i);
      switch(type)
      {
        case PRODUCERS:
          String producer = movie.getProducer();
          if(!list.contains(producer))
          {
            list.add(movie.getProducer());
          }
        break;
        case DIRECTORS:
          String director = movie.getDirector();
          if(!list.contains(director))
          {
            list.add(movie.getDirector());
          }
        break;
      }
    }
    return list;
  }
  
  public ArrayList<Movie> getMovies()
  {
    return movies;
  }
  
  
  public Movie getMovieByIndex(int index)
  {
    return movies.get(index);
  }
}