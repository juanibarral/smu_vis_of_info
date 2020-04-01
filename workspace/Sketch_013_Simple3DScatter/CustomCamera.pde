class CustomCamera
{
  private PVector position;
  private PVector direction;
  private float angleX;
  private float angleY;
  
  private static final float MIN_ANGLE_X = -PI/4;
  private static final float MAX_ANGLE_X = 0;
  private static final float MIN_ANGLE_Y = -PI/2;
  private static final float MAX_ANGLE_Y = PI/2;
  private static final float ANGLE_Y_SPEED = 0.03;
  private static final float ANGLE_X_SPEED = 0.03;
  
  private float lastDragX;
  private float lastDragY;
  
  public CustomCamera()
  {
    position = new PVector(0, -100, 500);
    direction = new PVector(0, -100, 0);
    angleX = 0;
    angleY = 0;
  }
  public void use()
  {
    beginCamera();
      camera( position.x, position.y, position.z, 
              direction.x, direction.y, direction.z, 
              0, 1, 0);
      rotateY(angleY);
      rotateX(angleX);
    endCamera();
  }
  
  public void dragged()
  {
    rotateCamera();
  }
  
  private void rotateCamera()
  {
    if(mouseX > lastDragX)
    {
      lastDragX = mouseX;
      angleY += ANGLE_Y_SPEED;
      if(angleY > MAX_ANGLE_Y)
      {
        angleY = MAX_ANGLE_Y;
      }
    }
    else if (mouseX < lastDragX)
    {
      lastDragX = mouseX;
      angleY -= ANGLE_Y_SPEED;
      if(angleY < MIN_ANGLE_Y)
      {
        angleY = MIN_ANGLE_Y;
      }
    }
    if(mouseY > lastDragY)
    {
      lastDragY = mouseY;
      angleX += ANGLE_X_SPEED;
      if(angleX > MAX_ANGLE_X)
      {
        angleX = MAX_ANGLE_X;
      }
    }
    else if (mouseY < lastDragY)
    {
      lastDragY = mouseY;
      angleX -= ANGLE_X_SPEED;
      if(angleX < MIN_ANGLE_X)
      {
        angleX = MIN_ANGLE_X;
      }
    }
  }
}
