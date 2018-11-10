PVector getPosition()
{
  float[] tMatrix = new float[6];
  PMatrix2D m = (PMatrix2D)getMatrix();
  m.get(tMatrix);
  return new PVector(tMatrix[2], tMatrix[5]);
}
