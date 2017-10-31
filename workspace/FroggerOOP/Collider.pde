interface Collider
{
  public boolean calculateCollision(Collider pCollider);
  public void updatePosition(PVector newPosition);
  public void renderCollider();
}