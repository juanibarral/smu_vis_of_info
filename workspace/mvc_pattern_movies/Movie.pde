class Movie
{
  private int releaseDate;
  private String id;
  private String title;
  private int rt;
  private String producer;
  private String director;
  
  public Movie(int pReleaseDate, String pId, String pTitle, int pRt, String pProducer, String pDirector)
  {
    releaseDate = pReleaseDate;
    id = pId;
    title = pTitle;
    rt = pRt;
    producer = pProducer;
    director = pDirector;
  }
  
  public int getReleaseDate()
  {
    return releaseDate;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public String getId()
  {
    return id;
  }
  
  public String getProducer()
  {
    return producer;
  }
  
  public String getDirector()
  {
    return director;
  }
  
  public int getRt()
  {
    return rt;
  }
}