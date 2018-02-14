JSONObject myObject;
float[] myValues;
float minValue, maxValue;
boolean isHovering;
void setup()
{
  size(800, 800);
  myObject = loadJSONObject("https://coinbin.org/lbc/history");
  JSONArray historyArray = myObject.getJSONArray("history");
  myValues = new float[50];
  for(int i = 0; i < 50; i++)
  {
    JSONObject myObjectArray = (JSONObject)historyArray.get(i);
    float myValue = myObjectArray.getFloat("value");
    myValues[i] = myValue;
  }
  
  minValue = min(myValues);
  maxValue = max(myValues);
  
  isHovering = false;
}

void draw()
{
  background(200);
  noFill();
  beginShape();
  ellipseMode(CENTER);
  if(isHovering)
  {
    strokeWeight(5);
  }
  else
  {
    strokeWeight(1);
  }
  for(int i = 0; i < myValues.length; i++)
  {
    int x = (int)map(i, 0, myValues.length, 10, 790);
    int y = (int)map(myValues[i], minValue, maxValue, 790, 10);
    curveVertex(x, y);
    //ellipse(x, y, 50, 50);
  }
  endShape();
  
  isHovering = calculateCollision();
}