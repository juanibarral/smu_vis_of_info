class Clickable
{
  private boolean selected;
  private color selectedColor;
  
  public Clickable(color c)
  {
    selectedColor = c;
  }
  public void toggleSelected()
  {
    selected =! selected;
  }
  
  public boolean isSelected()
  {
    return selected;
  }
  
  public color getSelectedColor()
  {
    return selectedColor;
  }
}
