String[] planetNames;
float[] diameters;
float[] surfaceWater;
String[] planetUrls;
JSONObject jsonPlanets;
PVector[] planetPositions;
boolean[] selectedPlanet;

color fromPlanetColor = color(204, 102, 0);
color toPlanetColor = color(0, 102, 153);

void loadPlanets()
{
  println("Loading planets");
  int resultsCount = 61;
  planetNames = new String[resultsCount];
  planetUrls = new String[resultsCount];
  diameters = new float[resultsCount];
  surfaceWater = new float[resultsCount];
  planetPositions = new PVector[resultsCount];
  selectedPlanet = new boolean[resultsCount];
  int index = 0;
  
  float angleStep = PI / 65;
  for(int j = 1; j <= 7; j++)
  {
    jsonPlanets = connector.loadSwapi("planets/?page=" + j);
    JSONArray results = jsonPlanets.getJSONArray("results");
    pushMatrix();
    translate(CANVAS_WIDTH / 2, CANVAS_HEIGHT - 50);
    for(int i = 0; i < results.size(); i++)
    {
      JSONObject jsonPlanet = results.getJSONObject(i);
      planetNames[index] = jsonPlanet.getString("name");
      diameters[index] = jsonPlanet.getString("diameter").equals("unknown") ? 10 : jsonPlanet.getFloat("diameter");
      surfaceWater[index] = jsonPlanet.getString("surface_water").equals("unknown") ? 0 : jsonPlanet.getFloat("surface_water");
      planetUrls[index] = jsonPlanet.getString("url");
      
      pushMatrix();
        rotate(PI + (index * angleStep));
        translate((CANVAS_HEIGHT) - 100, 100);
        planetPositions[index] = getPosition();
      popMatrix();
      index++;
    }
    popMatrix();
    
  }
  println("End loading planets");
}

int getPlanetIndex(String url)
{
  int planetIndex = -1;
  for(int k = 0; k < planetUrls.length; k++)
  {
    if(url.equals(planetUrls[k]))
    {
      planetIndex = k;
      break;
    }
  }
  return planetIndex;
}

void drawPlanets()
{
  noStroke();
  float maxDiam = max(diameters);
  float minDiam = min(diameters);

  for(int i = 0; i < planetPositions.length; i++)
  {
    PVector pos = planetPositions[i];
    float diam = map(diameters[i], minDiam, maxDiam, 20, 50);
    color planetColor = lerpColor(fromPlanetColor, toPlanetColor, surfaceWater[i]/100);
    fill(planetColor);
    ellipse(pos.x, pos.y, diam, diam);
    fill(255);
    if(selectedPlanet[i])
    {
      textAlign(CENTER, CENTER);
      text(planetNames[i], pos.x, pos.y); 
    }
  }
}
