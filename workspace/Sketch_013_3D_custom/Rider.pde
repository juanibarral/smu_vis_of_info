class Rider
{
  //Attributes
  private String name;
  private String tShirtNumber;
  private int[] positions;
  private int[] timeDifferenceToLeader;
  private String[] timeDifferenceToLeaderString;
  
  private int[] positionsInStage;
  
  //Constructor
  // Initialize ALL atributes
  public Rider(String _name, String tShirtNumber)
  {
    name = _name;
    this.tShirtNumber = tShirtNumber;
    positions = new int[21];
    positionsInStage = new int[21];
    timeDifferenceToLeader = new int[21];
    timeDifferenceToLeaderString = new String[21];
  }
  //Getters
  public String getName()
  {
    return name;
  }
  
  public String getTshirtNumber()
  {
    return tShirtNumber;
  }
  
  public int[] getPositions()
  {
    return positions;
  }
  
  public int[] getPositionsInStage()
  {
    return positionsInStage;
  }
  
  public int[] getTimeDifferenceToLeader()
  {
    return timeDifferenceToLeader;
  }
  
    public int getTimeDifferenceToLeader(int stage)
  {
    return timeDifferenceToLeader[stage - 1];
  }
  
  public String[] getTimeDifferenceToLeaderString()
  {
    return timeDifferenceToLeaderString;
  }
  
   public String getTimeDifferenceToLeaderString(int stage)
  {
    return timeDifferenceToLeaderString[stage - 1];
  }
  
  public int getPosition(int stage)
  {
    return positions[stage -1];
  }
  //Setters
  
  //Methods
  //Adds a position in the given stage
  public void addPosition(int position, int stage)
  {
    positions[stage - 1] = position;
  }
  
  public void addPositionInStage(int position, int stage)
  {
    positionsInStage[stage - 1] = position;
  }
  
  // Adds a time in seconds on the given stage
  public void addTimeDifference(int time, int stage)
  {
    timeDifferenceToLeader[stage - 1] = time;
  }
    public void addTimeDifferenceString(String time, int stage)
  {
    timeDifferenceToLeaderString[stage - 1] = time;
  }
  
}