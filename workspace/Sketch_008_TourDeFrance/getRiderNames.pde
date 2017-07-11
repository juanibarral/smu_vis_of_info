ArrayList<String> getRiderNames()
{
  ArrayList<String> names = new ArrayList<String>();
  JSONObject stage_1 = json.getJSONObject("stage_1");
  JSONArray individual_times = stage_1.getJSONArray("Individuel Temps Général");
  for(int i = 0; i < individual_times.size(); i++)
  {
    JSONObject position_i = individual_times.getJSONObject(i);
    String number = position_i.getString("number");
    String name = position_i.getString("name");
    String rider_name = number + " - " + name;
    if(!names.contains(rider_name))
      names.add(rider_name);
  }
  Collections.sort(names);
  return names;
}