abstract class Circle2DHoverable extends Circle2D implements Hoverable
{
  protected boolean hovered;
  protected color hoveredColor;
  protected Clickable clickable;

  public Circle2DHoverable(int pRadius, color pBaseColor, color pHoveredColor)
  {
    super(pRadius, pBaseColor);
    baseColor = pBaseColor;
    hoveredColor = pHoveredColor;
  }
  
  public void setClickable(color c)
  {
    clickable = new Clickable(c);
  }
  public boolean isHovering()
  {
    return hovered;
  }
  public void checkHovering(int pMouseX, int pMouseY)
  {
    hovered = false;
    if(isInside(new PVector(pMouseX, pMouseY))) {
      hovered = true; //<>//
    }
  }
  
  protected void createObject()
  {
    boolean selected = clickable != null && clickable.isSelected();
    if(hovered)
    {
      if(selected)
      {
        fill(clickable.getSelectedColor());
      }
      else
      {
        fill(hoveredColor);
      }
    }
    else if(selected)
    {
      fill(clickable.getSelectedColor());
    }
    else
    {
      fill(baseColor);
    }
  } //<>//
  
  public void click()
  {
    if (clickable != null && hovered)
    {
      clickable.toggleSelected();
    }
  }
}
