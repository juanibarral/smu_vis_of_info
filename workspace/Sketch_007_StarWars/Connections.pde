  ArrayList<ArrayList<ArrayList<PVector>>> hoveringPoints;
  
  void createHoveringPoints()
  {
    println("Creating hovering points");
    hoveringPoints = new ArrayList<ArrayList<ArrayList<PVector>>>();
    
    for(int i = 0; i < planetsOnFilm.size(); i++)
    {
      HashMap<String, Integer> urls = planetsOnFilm.get(i);
      ArrayList<ArrayList<PVector>> urlsArray = new ArrayList<ArrayList<PVector>>();
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
        int controlPoints = 50;
        float step = 1/float(controlPoints);
        for(int ctrl = 0; ctrl < controlPoints; ctrl++)
        {
          float x = curvePoint(filmPos.x, filmPos.x, interPos.x, planetPos.x, ctrl * step);
          float y = curvePoint(filmPos.y, filmPos.y, interPos.y, planetPos.y, ctrl * step);
          urlPoints.add(new PVector(x, y));
          
          x = curvePoint(filmPos.x, interPos.x, planetPos.x, planetPos.x, ctrl * step);
          y = curvePoint(filmPos.y, interPos.y, planetPos.y, planetPos.y, ctrl * step);
          urlPoints.add(new PVector(x, y));
        }
        urlsArray.add(urlPoints);
      }
      hoveringPoints.add(urlsArray);
    }
    println("End creating hovering points");
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
    //for(int i = 0; i < hoveringPoints.size(); i++)
    //{
    //  ArrayList<ArrayList<PVector>> urlList = hoveringPoints.get(i);
    //  for(int j = 0; j < urlList.size(); j++)
    //  {
    //    ArrayList<PVector> hovPoints = urlList.get(j);
    //    for(int k = 0; k < hovPoints.size(); k++)
    //    {
    //      ellipse(hovPoints.get(k).x, hovPoints.get(k).y, 5, 5); 
    //    }
    //  }
    //}
  }
  
  void checkHovering()
  {
    for(int i = 0; i < hoveringPoints.size(); i++)
    {
      hovered[i] = false;
    }
     for(int i = 0; i < hoveringPoints.size(); i++)
    {
      ArrayList<ArrayList<PVector>> urlList = hoveringPoints.get(i);
      for(int j = 0; j < urlList.size(); j++)
      {
        ArrayList<PVector> hovPoints = urlList.get(j);
        for(int k = 0; k < hovPoints.size(); k++)
        {
          float distance = dist(mouseX, mouseY, hovPoints.get(k).x, hovPoints.get(k).y);
          if(distance < 5)
          {
            hovered[i] = true;
          }
        }
      }
    }
  }
