int[] createdYear;
String[] title;
ArrayList<HashMap<String, Integer>> planetsOnFilm;
PVector[] filmPosition;
boolean[] hovered;
int filmIconSize = 100;
void loadFilms()
{
  println("Loading films");
  json = connector.loadSwapi("films");
  JSONArray films = json.getJSONArray("results");
  int filmsSize = films.size();
  createdYear = new int[filmsSize];
  title = new String[filmsSize];
  planetsOnFilm = new ArrayList<HashMap<String, Integer>>();
  filmPosition = new PVector[filmsSize];
  hovered = new boolean[filmsSize];
  
  for(int i = 0; i < filmsSize; i++)
  {
    JSONObject film = films.getJSONObject(i);
    title[i] = film.getString("title");
    createdYear[i] = int(film.getString("release_date").substring(0,4)); 
    JSONArray planets = film.getJSONArray("planets");
    HashMap<String, Integer> planetsOfFilm = new HashMap<String, Integer>();
    for(int j = 0; j < planets.size(); j++)
    {
      String url = (String)planets.get(j);
      int index = getPlanetIndex(url);
      planetsOfFilm.put(url, index);
    }
    planetsOnFilm.add(planetsOfFilm);
    
    int xPosition = (int)map(i, 0, createdYear.length - 1, CANVAS_WIDTH / 2 - 500, CANVAS_WIDTH / 2 + 500);
    filmPosition[i] = new PVector(xPosition, CANVAS_HEIGHT - 50);
    hovered[i] = false;
  }
  println("End loading films");
}

void drawFilms()
{
  for(int i = 0; i < filmPosition.length; i++)
  {
    PVector pos = filmPosition[i];
    float distance = dist(mouseX, mouseY, pos.x, pos.y);
    
    if(hovered[i])
    {
      for(int ind = 0; ind < selectedPlanet.length; ind++)
      {
        selectedPlanet[ind] = false;
      }
      
      for(Map.Entry entry : planetsOnFilm.get(i).entrySet())
      {
        selectedPlanet[(Integer)entry.getValue()] = true;
      }
    }
    else
    {
      if(distance <= filmIconSize / 2)
      {
        hovered[i] = true;
      }
      else
      {
        hovered[i] = false;
      }
    }
    
    noStroke();
    fill(255);
    int iconSize = hovered[i] ? filmIconSize + 10 : filmIconSize;
    
    PImage icon = images.get(title[i]);
    if(icon != null)
    {
      image(icon, pos.x - (icon.width / 2), pos.y - (icon.height / 2));
    }
    else
    {
      ellipse(pos.x, pos.y, iconSize, iconSize);
    }
    fill(255, 255, 0);
    textAlign(CENTER);
    text(createdYear[i], pos.x, CANVAS_HEIGHT - 30);
    text(title[i], pos.x, CANVAS_HEIGHT - 10);
  }
}
