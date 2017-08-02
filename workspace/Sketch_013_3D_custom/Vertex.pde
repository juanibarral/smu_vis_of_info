class Vertex
{
  private PVector pos;
  private PVector n;
  private color col;
  
  public Vertex(PVector _pos, PVector _n, color _col)
  {
    pos = _pos;
    n = _n;
    col = _col;
  }
  
  public PVector getPos()
  {
    return pos;
  }
}