import controlP5.*; //<>// //<>//
import java.util.Collections;
import java.util.HashMap;

ControlP5 cp5;
ArrayList<String> riderNames;
JSONObject json;
DropdownList d1;
int currentIndex = 0;

int iniPosX = 50;
int iniPosY = 50;
int chartWidth = 0;
int chartHeight = 0;

int[] riderPoints = new int[21];
int[] riderDiffs = new int[21];

ArrayList<int[]> drawnPoints = new ArrayList<int[]>();
ArrayList<int[]> drawnDiffPoints = new ArrayList<int[]>();
int radius = 5;

void setup() {

  json = loadJSONObject("data_tour_2016.json");

  riderNames = getRiderNames();

  size(800, 600);

  chartWidth = width - 100;
  chartHeight = height - 100;
  cp5 = new ControlP5(this);
  // create a DropdownList
  d1 = cp5.addDropdownList("myList-d1")
    .setPosition(10, 10)
    .setSize(300, 200)
    ;
  customize(d1);
  d1.close();
}

void customize(DropdownList ddl)
{
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.setCaptionLabel("Riders");

  for (int i=0; i<riderNames.size(); i++) {
    ddl.addItem(riderNames.get(i), i);
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    int index = (int)theEvent.getController().getValue();
    currentIndex = index; //<>//
    String riderNumber = riderNames.get(index).split(" - ")[0];

    HashMap<String, int[]> info = getRiderDataFromJSON(riderNumber);
    riderPoints = info.get("positions");
    riderDiffs = info.get("differences");
  }
}

void draw()
{
  background(200);
  cursor(CROSS);
  rectMode(CORNER);
  drawPoints(riderPoints, riderDiffs);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Stages", width/2, height - 25);
  
  for(int i = 0; i < drawnPoints.size(); i++)
  {
    int[] pts = drawnPoints.get(i);
    float distance = sqrt(pow(mouseX - pts[0], 2) + pow(mouseY - pts[1], 2));
    //println(distance);
    if(distance < radius)
    {
      int[] diffPts = drawnDiffPoints.get(i);
      ellipseMode(CENTER);
      stroke(0);
      fill(255);
      line(diffPts[0], diffPts[1], diffPts[0], iniPosX + chartHeight);
      ellipse(pts[0], pts[1], 10, 10);
      ellipse(diffPts[0], diffPts[1], 10, 10);
      textAlign(CENTER, TOP);
      fill(0);
      text(riderPoints[i], pts[0], pts[1] + radius);
      textAlign(CENTER, BOTTOM);
      fill(0);
      int seconds = riderDiffs[i];
      int hours = seconds/3600;
      int mins = (seconds / 60) % 60;
      int secs = seconds % 60;
      textAlign(CENTER, BOTTOM);
      text("+" + hours + "h " + mins + ":" + secs, diffPts[0], diffPts[1] - radius);
      noCursor();
      
      
    }

  }
}