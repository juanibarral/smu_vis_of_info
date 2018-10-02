ArrayList<ArrayList<PVector>> hoveringPoints;

void createHoveringPoints()
{
  hoveringPoints = new ArrayList<ArrayList<PVector>>();
  
  for(int i = 0; i < planetsOnFilm.size(); i++)
  {
    HashMap<String, Integer> urls = planetsOnFilm.get(i);
    for(Map.Entry entry : urls.entrySet())
    { 
      ArrayList<PVector> urlPoints = new ArrayList<PVector>();
      PVector filmPos = filmPosition[i];
      PVector planetPos = planetPositions[(Integer)entry.getValue()];
      PVector interPos = new PVector(
          filmPos.x + ((planetPos.x - filmPos.x) / 2),
          (filmPos.y + ((planetPos.y - filmPos.y) / 2)) - 75
          );
      // ControlPointsForHovering
      for(int ctrl = 0; ctrl < 10; ctrl++)
      {
        float x = curvePoint(filmPos.x, filmPos.x, interPos.x, planetPos.x, ctrl * 0.1);
        float y = curvePoint(filmPos.y, filmPos.y, interPos.y, planetPos.y, ctrl * 0.1);
        urlPoints.add(new PVector(x, y));
        
        x = curvePoint(filmPos.x, interPos.x, planetPos.x, planetPos.x, ctrl * 0.1);
        y = curvePoint(filmPos.y, interPos.y, planetPos.y, planetPos.y, ctrl * 0.1);
        urlPoints.add(new PVector(x, y));
      }
      hoveringPoints.add(urlPoints);
    }
  }
}
void drawConnections()
{
  for(int i = 0; i < planetsOnFilm.size(); i++)
  {
    HashMap<String, Integer> urls = planetsOnFilm.get(i);
    for(Map.Entry entry : urls.entrySet())
    {
      int planetIndex = (Integer)entry.getValue();
      if(planetIndex != -1)
      {
        PVector filmPos = filmPosition[i];
        PVector planetPos = planetPositions[planetIndex];
        if(hovered[i])
        {
          stroke(255);
          strokeWeight(3);
        }
        else
        {
          stroke(150);
          strokeWeight(1);
        }
        
        PVector interPos = new PVector(
          filmPos.x + ((planetPos.x - filmPos.x) / 2),
          (filmPos.y + ((planetPos.y - filmPos.y) / 2)) - 75
          );
        
        noFill();
        beginShape();
          curveVertex(filmPos.x, filmPos.y);
          curveVertex(filmPos.x, filmPos.y);
          curveVertex(interPos.x, interPos.y);
          curveVertex(planetPos.x, planetPos.y);
          curveVertex(planetPos.x, planetPos.y);
        endShape(); 
      }
    }
  }
  strokeWeight(1);
  stroke(150);
  for(int i = 0; i < hoveringPoints.size(); i++)
  {
    ArrayList<PVector> hov = hoveringPoints.get(i);
    for(int j = 0; j < hov.size(); j++)
    {
      ellipse(hov.get(j).x, hov.get(j).y, 5, 5);
    }
  }
}

void checkHovering()
{
  for(int i = 0; i < hoveringPoints.size(); i++)
  {
    ArrayList<PVector> hov = hoveringPoints.get(i);
    for(int j = 0; j < hov.size(); j++)
    {
      float distance = dist(mouseX, mouseY, hov.get(j).x, hov.get(j).x);
      if(distance <= 5)
      {
        hovered[i] = true;
      }
    }
  }
}
