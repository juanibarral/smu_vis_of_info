class Face
{
  private Vertex[] vertices;
  private UV[] uvs;
  
  public Face(Vertex[] _vertices)
  {
    vertices = _vertices;
  }
  
  public Face(Vertex v0, Vertex v1, Vertex v2)
  {
    vertices = new Vertex[3];
    vertices[0] = v0;
    vertices[1] = v1;
    vertices[2] = v2;
  }
  
  public void setUV(UV[] _uvs)
  {
    uvs = _uvs;
  }
  
  public Vertex getVertex(int index)
  {
    return vertices[index];
  }
  
  public PVector getNorm()
  {
    PVector a = new PVector();
    a.set(vertices[1].getPos());

    PVector b = new PVector();
    b.set(vertices[2].getPos());

    a.sub(vertices[0].getPos());
    b.sub(vertices[0].getPos());
    
    a.normalize();
    b.normalize();
    
    return a.cross(b);
  }
  
  public void setUVs(UV[] _uvs)
  {
    uvs = _uvs;
  }
  
  public UV[] getUVs()
  {
    return uvs;
  }
  

}