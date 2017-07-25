interface Collider
{
  boolean checkCollision(Collider collider);
  public void setPosition(PVector position);
  public void renderCollider();
  public PVector getPosition();
}