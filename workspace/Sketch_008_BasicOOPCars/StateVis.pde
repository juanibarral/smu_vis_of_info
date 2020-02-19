class StateVis
{
  private IntDict data;
  private int minValue;
  private int maxValue;
  private String[] keys;
  private ArrayList<ColoredRect> rects;
  private static final int MIN_R = 0;
  private static final int MAX_R = 255;
  
  public StateVis(ArrayList<Car> cars)
  {
    data = new IntDict();
    rects = new ArrayList<ColoredRect>();
    for(Car c : cars)
    {
      String state = c.getState();
      if(!data.hasKey(state))
      {
        data.set(state, 0);
      }
      int current = data.get(state);
      current++;
      data.set(state, current);
    }
    data.sortValues();
    keys = data.keyArray();
    minValue = data.get(keys[0]);
    maxValue = data.get(keys[data.size()-1]);
    
    data.sortKeys();
    keys = data.keyArray();
    
    int step = (CANVAS_W - 200)/8;
    int index = 0;
    for(int i = 0; i < 8; i++)
    {
      for(int j = 0; j < 8; j++)
      {
        if(index < keys.length)
        {
          String keyString = keys[index];
          int value = data.get(keyString);
          int red = (int)map(value, minValue, maxValue, MIN_R, MAX_R);
          color rectColor = color(red, 0, 0);
          ColoredRect c = new ColoredRect(
                                  new PVector(100 + (step*i), 100 + (step*j)),
                                  rectColor,
                                  step,
                                  keyString,
                                  value
                                  );
          rects.add(c);
          index++;
        }
      }
    }
    println(rects.size());
  }
  
  public void render()
  {
    for(ColoredRect r : rects)
    {
      r.render();
    }
    renderLegend();
  }
  
  public void renderLegend()
  {
    int levels = 10;
    int step = (CANVAS_W - 200) / levels;
    int stepV = (maxValue - minValue) / levels;
    for(int i = 0; i < levels; i++)
    {
      noStroke();
      int red = (int)map(stepV * i, minValue, maxValue, MIN_R, MAX_R);
      fill(red, 0, 0);
      rect(100 + (step*i), CANVAS_H - 50, step, 10);
      fill(0);
      textSize(12);
      text(stepV * i, 100 + (step*i), CANVAS_H - 20);
    }
  }
}
