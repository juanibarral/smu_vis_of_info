HashMap<String, int[]> getRiderDataFromJSON(String riderNumber) //<>//
{
  HashMap<String, int[]> values = new HashMap<String, int[]>();
  int[] positions = new int[21];
  int[] differences = new int[21];

  for (int i = 1; i <= 21; i++)
  {
    JSONObject stage_i = json.getJSONObject("stage_" + i);
    if (stage_i != null)
    {
      JSONArray individual_times = stage_i.getJSONArray("Individuel Temps Général");
      if (individual_times != null)
      {
        int position = -1;
        for (int j = 0; j < individual_times.size(); j++)
        {
          JSONObject position_i = individual_times.getJSONObject(j);
          String number = position_i.getString("number");
          if (number.equals(riderNumber))
          {
            position = Integer.parseInt(position_i.getString("position"));
            String time = position_i.getString("time");
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
              //for(int ind = 0; ind < timeSplit.length; ind++)
              //{
              //  print(timeSplit[ind] + "---");
              //}
              //println();
              //println("time: " + time);
              //println(hour + " " + min + " " + sec);
              seconds += hour * 60 * 60;
              seconds += min * 60;
              seconds += sec;
            }            
            //println(seconds);
            differences[i -1] = seconds;
            break;
          }
        }
        //println(i + " - " + position);
        positions[i - 1] = position;
      }
    }
  }
  values.put("positions", positions);
  values.put("differences", differences);
  return values;
}