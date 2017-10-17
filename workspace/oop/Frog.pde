class Frog
{
  private PVector position;
  private int frogColor;
  
  public Frog(PVector pPosition, int pColor)
  {
    position = pPosition;
    frogColor = pColor;
  }
  
  public void moveUp()
  {
    position.y -= 10;
  }
  
  public void moveDown()
  {
    position.y += 10;
  }
  
  public void drawFrog()
  {
    ellipseMode(CENTER);
    stroke(0);
    fill(frogColor);
    pushMatrix();
    translate(position.x, position.y);
    ellipse(0,0, 20, 40);
    popMatrix();
  }
}