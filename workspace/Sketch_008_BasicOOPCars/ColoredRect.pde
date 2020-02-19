class ColoredRect
{
  private PVector position;
  private color rectColor;
  private int size;
  private String state;
  private int value;
  
  public ColoredRect(PVector position, color rectColor, int size, String state, int value)
  {
    this.position = position;
    this.rectColor = rectColor;
    this.size = size;
    this.state = state;
    this.value = value;
  }
  
  public void render()
  {
    fill(rectColor);
    stroke(255);
    rect(position.x, position.y, size, size);
    fill(200);
    textSize(40);
    
    
    if(mouseX >= position.x && mouseX <= position.x + size &&
      mouseY >= position.y && mouseY <= position.y + size)
      {
        text(value, position.x + 5, position.y + 40);
      }
      else
      {
        text(state, position.x + 5, position.y + 40);
      }
  }
}
