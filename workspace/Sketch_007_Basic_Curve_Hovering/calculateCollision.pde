boolean calculateCollision()
{
  boolean collision = false;
  for(int i = 0; i < myValues.length; i++)
  {
    int x = (int)map(i, 0, myValues.length, 10, 790);
    int y = (int)map(myValues[i], minValue, maxValue, 790, 10);
    
    float distance = dist(x, y, mouseX, mouseY);
    if(distance <= 50)
    {
      collision = true;
      break;
    }
  }
  return collision;
}