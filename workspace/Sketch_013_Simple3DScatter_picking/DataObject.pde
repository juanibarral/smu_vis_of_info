class DataObject extends Abstract3DObject
{
  private int pickingColor;
  private boolean isSelected;
  private boolean isPicking;
  private int selectedColor;
  private int baseColor;
  
  public DataObject(float x, float y, float z)
  {
    setPosition(new PVector(-x, -y, z));
    pickingColor = color(random(255), random(255), random(255));
    baseColor = color(255, 0, 0);
    selectedColor = color(0, 255, 0);
  }
  
  public void transform()
  {
    translate(position.x, position.y, position.z);
  }
  
  public void setPicking(boolean b)
  {
    isPicking = b;
  }
  
  public void checkPickedColor(int pickedColor)
  {
    if(pickedColor == pickingColor)
    {
      isSelected = !isSelected;
    }
  }
  
  protected void createObject()
  {
    fill(baseColor);
    if(isSelected)
    {
      fill(selectedColor);
    } 
    if (isPicking)
    {
      noLights();
      fill(pickingColor);
    }
    noStroke();
    sphere(10);
    fill(255);
    stroke(0);
  }
}
