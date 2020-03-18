abstract class Box2DHoverable extends Box2D implements Hoverable
{
  protected boolean hovered;
  protected color hoveredColor;
  protected Clickable clickable;

  public Box2DHoverable(int pBoxWidth, int pBoxHeight, color pBaseColor, color pHoveredColor)
  {
    super(pBoxWidth, pBoxHeight, pBaseColor);
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
    if(pMouseX > pos.x && pMouseX < pos.x + boxWidth &&
      pMouseY > pos.y && pMouseY < pos.y + boxHeight)
    {
      hovered = true;    
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
  }
  
  public void click()
  {
    if (clickable != null && hovered)
    {
      clickable.toggleSelected();
    }  //<>//
  }
}
