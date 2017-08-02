class Cone extends AbstractGeometry
{
  
  public Cone(int resolution, float radius, float apexHeight)
  {
    super();
    
    float angleStep = 2 * PI / resolution;
    
    Vertex vc = new Vertex( new PVector(0, 0, 0), null, color(0));
    Vertex va = new Vertex( new PVector(0, -apexHeight, 0), null, color(0));
    vertices.add(vc);
    vertices.add(va);
    for(int i = 0; i < resolution; i++)
    {
      float angle = angleStep * i;
      float x = radius * cos(angle);
      float z = radius * sin(angle);
      Vertex a = new Vertex( new PVector(x, 0, z), null, color(0));
      vertices.add(a);
      angle = angleStep * (i + 1);
      x = radius * cos(angle);
      z = radius * sin(angle);
      Vertex b = new Vertex( new PVector(x, 0, z), null, color(0));
      vertices.add(b);
      
      Face fc = new Face(b, a, vc);
      fc.setUVs(new UV[]{
        new UV(0, 0),
        new UV(0, 1),
        new UV(1, 0),
      });
      Face fa = new Face(a, b, va);
      fa.setUVs(new UV[]{
        new UV(1, 1),
        new UV(0, 1),
        new UV(0, 0),
      });
      faces.add(fc);
      faces.add(fa);
    }
  }
  
}