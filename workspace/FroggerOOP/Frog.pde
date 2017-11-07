class Frog extends GameObject
{
  private AnimatedSprite sprite;
  public Frog()
  {
    super();
    sprite = new AnimatedSprite("frog_sprite_2.png", 7, 1);
  }
  
  public void createObject()
  {
    ellipseMode(CENTER);
    //ellipse(0,0, 50, 50);
    sprite.display(-sprite.getCellWidth() / 2, -sprite.getCellHeight() / 2);
  }
  
  public void moveUp()
  {
    position.y -= 10;
    sprite.animate();
  }
  public void moveDown()
  {
    position.y += 10;
    sprite.animate();
  }
  public void moveLeft()
  {
    position.x -= 10;
    sprite.animate();
  }
  public void moveRight()
  {
    position.x += 10;
    sprite.animate();
  }
}