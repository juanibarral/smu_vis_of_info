class Model
{
  HashMap<String, Rider> riders;
  JSONObject json;
  
  public Model()
  {
    riders = new HashMap<String, Rider>();
  }
  
  public void loadData(String dataPath)
  {
    json = loadJSONObject(dataPath); 
    for(int stage = 1; stage <= 21; stage++)
    {
      JSONObject stage_i = json.getJSONObject("stage_" + stage);
      JSONArray individual_times = stage_i.getJSONArray("Individuel Temps Général");
      for(int i = 0; i < individual_times.size(); i++)
      {
        JSONObject position_i = individual_times.getJSONObject(i);
        String number = position_i.getString("number");
        String name = position_i.getString("name");
        String position = position_i.getString("position");
        String time = position_i.getString("time");
        String timeS = position_i.getString("time");
        int seconds = 0;
        if(time.contains("+"))
        {
          time = time.replaceAll("\\+","");
          time = time.replaceAll("h","");
          time = time.replaceAll("'","");
          time = time.replaceAll("\"","");
          String[] timeSplit = time.trim().split(" ");
          int hour = timeSplit.length == 3 ? int(timeSplit[0]) : 0;
          int min = timeSplit.length == 3 ? int(timeSplit[1]) : int(timeSplit[0]);
          int sec = timeSplit.length == 3 ? int(timeSplit[2]) : int(timeSplit[1]);
          seconds += hour * 60 * 60;
          seconds += min * 60;
          seconds += sec;
        }            
            
        if(!riders.containsKey(number))
          riders.put(number, new Rider(name, number));
        Rider rider_i = riders.get(number);
        rider_i.addPosition(int(position), stage);
        rider_i.addTimeDifference(seconds,stage);
        rider_i.addTimeDifferenceString(timeS,stage);
      } 
      
      JSONArray timesInStage = stage_i.getJSONArray("Individuel Temps Etape");
      for(int i = 0; i < timesInStage.size(); i++)
      {
        JSONObject position_i = timesInStage.getJSONObject(i);
        String number = position_i.getString("number");
        String position = position_i.getString("position");
        //String time = position_i.getString("time");
        Rider rider_i = riders.get(number);
        rider_i.addPositionInStage(int(position), stage);
      }
    }
    //println("Data loaded");
    

  }
  
  public ArrayList<String> getRiderNames()
  {
    ArrayList<String> riderNames = new ArrayList<String>();
    for(HashMap.Entry<String, Rider> entry : riders.entrySet())
    {
      String name = entry.getValue().getName();
      String number = entry.getValue().getTshirtNumber();
      String riderName = number + " - " + name;
      if(!riderNames.contains(riderName))
      {
        riderNames.add(riderName);
      }
    }
    Collections.sort(riderNames);
    return riderNames;
  }
  
  public Rider getRider(String tshirt)
  {
    return riders.get(tshirt);
  }
}