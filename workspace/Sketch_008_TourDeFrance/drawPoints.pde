void drawPoints(int[] points, int[] riderDiffs)
{
  drawnPoints.clear();
  drawnDiffPoints.clear();
  int map_ini_Y = 0;
  int map_end_Y = chartHeight / 2;
  int curvesIniY = height / 2;
  
  int maxDiff = max(riderDiffs);
  int mapIniDiffY = 0;
  int mapEndDiffY = chartHeight / 2;
  
  ArrayList<int[]> curvePoints = new ArrayList<int[]>();
  ArrayList<int[]> diffCurvePoints = new ArrayList<int[]>();
  
  
  rectMode(CENTER);
  noFill();
  noStroke();
  textSize(12);
  textAlign(CENTER, BOTTOM);
  int posX = (int)map(0, 0, 20, 0, chartWidth);
  int posY = (int)map(points[0], 0, 198, map_ini_Y, map_end_Y);
  int posDiffY = (int)map(riderDiffs[0], 0, maxDiff, mapEndDiffY, mapIniDiffY);
  diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + posDiffY});
  curvePoints.add(new int[]{iniPosX + posX,  curvesIniY + posY});
  int lastIndex = 0;
  for(int i = 0; i < points.length; i++)
  {
    if(points[i] == -1)
    {
      lastIndex = i - 1;
      break;
    }
    else
    {
      lastIndex = i;
      posX = (int)map(i, 0, 20, 0, chartWidth);
      posY = (int)map(points[i], 0, 198, map_ini_Y, map_end_Y);
      posDiffY = (int)map(riderDiffs[i], 0, maxDiff, mapEndDiffY, mapIniDiffY);
      diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + posDiffY + posY});
      curvePoints.add(new int[]{iniPosX + posX,  curvesIniY + posY});
    } //<>//
  }
  posX = (int)map(lastIndex, 0, 20, 0, chartWidth);
  posY = (int)map(points[lastIndex], 0, 198, map_ini_Y, map_end_Y);
  posDiffY = (int)map(riderDiffs[lastIndex], 0, maxDiff, mapEndDiffY, mapIniDiffY);
  diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + posDiffY + posY});
  diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + posDiffY + posY});
  curvePoints.add(new int[]{iniPosX + posX,  curvesIniY + posY});
  curvePoints.add(new int[]{iniPosX + posX,  curvesIniY + posY});
  
  curvePoints.add(new int[]{iniPosX + posX, iniPosY + chartHeight});
  curvePoints.add(new int[]{iniPosX + posX, iniPosY + chartHeight});
  curvePoints.add(new int[]{iniPosX + posX, iniPosY + chartHeight});
  
  curvePoints.add(new int[]{iniPosX, iniPosY + chartHeight});
  curvePoints.add(new int[]{iniPosX, iniPosY + chartHeight});
  curvePoints.add(new int[]{iniPosX, iniPosY + chartHeight});
  
  diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + chartHeight});
  diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + chartHeight});
  diffCurvePoints.add(new int[]{iniPosX + posX, iniPosY + chartHeight});
  
  diffCurvePoints.add(new int[]{iniPosX, iniPosY + chartHeight});
  diffCurvePoints.add(new int[]{iniPosX, iniPosY + chartHeight});
  diffCurvePoints.add(new int[]{iniPosX, iniPosY + chartHeight});
  
  
  
  fill(color(255,255,191));
  beginShape();
  for(int i = 0; i < diffCurvePoints.size(); i++)
  {
    int[] pt = diffCurvePoints.get(i);
    curveVertex(pt[0], pt[1]);
    if(i < points.length)
    {
      drawnDiffPoints.add(diffCurvePoints.get(i + 1));
    }
  }
  endShape();
  
  fill(color(145,191,219));
  beginShape();
  for(int i = 0; i < curvePoints.size(); i++)
  {
    int[] pt = curvePoints.get(i);
    curveVertex(pt[0], pt[1]);
  }
  endShape();
  
  lastIndex = points.length - 1;
  for(int i = 0; i < points.length; i++)
  {
    if(points[i] != -1)
    {
      int[] pt = curvePoints.get(i + 1);
      ellipseMode(CENTER);
      stroke(0);
      fill(255);
      ellipse(pt[0], pt[1], radius, radius);
      drawnPoints.add(new int[]{pt[0], pt[1]});
      fill(0);
      textAlign(CENTER, TOP);
      text((i + 1), pt[0], iniPosY + chartHeight);
    }
    else
    {
      lastIndex = i - 1;
      break;
    }
  }
  
  textAlign(CENTER, TOP);
  int[] ptText = curvePoints.get(0);
  text(points[0], ptText[0],  ptText[1]); 
  ptText = curvePoints.get(lastIndex + 1);
  text(points[lastIndex], ptText[0],  ptText[1]); 
   //<>//
  for(int i = 0; i < riderDiffs.length; i++)
  {
    if(maxDiff != 0 && riderDiffs[i] == maxDiff)
    //if(i % 2 == 0 && riderDiffs[i] > 0)
    {
      int[] pt = diffCurvePoints.get(i + 1);
      fill(0);
      int seconds = riderDiffs[i];
      int hours = seconds/3600;
      int mins = (seconds / 60) % 60;
      int secs = seconds % 60;
      textAlign(CENTER, BOTTOM);
      text("+" + hours + "h " + mins + ":" + secs, pt[0],  pt[1]); 
      break;
    }
  }
  
  
  fill(255);
}