import processing.core.*;
class Cylinder extends AbstractGeometry
{
  private float topRadius;
  private float bottomRadius;
  private int resolution;
  private float myHeight;
  
  public Cylinder(PApplet _p, float _topRadius, float _bottomRadius, int _resolution, float _height)
  {
    super(_p);
    topRadius = _topRadius;
    bottomRadius = _bottomRadius;
    resolution = _resolution;
    myHeight = _height;
  }
  
  public void init()
  {
    float angleStep = 2 * p.PI / resolution;
    
    for(int i = 0; i < resolution; i++)
    {
      //Calculates the bottom cap of the cylinder
      float x = bottomRadius * p.cos(angleStep * i);
      float z = bottomRadius * p.sin(angleStep * i);
      
      Vertex v0 = new Vertex(new PVector(x, 0, z));
      x = bottomRadius * p.cos(angleStep * (i + 1));
      z = bottomRadius * p.sin(angleStep * (i + 1));
      Vertex v1 = new Vertex(new PVector(x, 0, z));
      Vertex v2 = new Vertex(new PVector(0,0,0));
      vertices.add(v0);
      vertices.add(v1);
      vertices.add(v2);
      
      Face f = new Face(new Vertex[]{v0, v1, v2});
      UV[] uvs = new UV[3];
      uvs[0] = new UV(new PVector(0, 1, 0));
      uvs[1] = new UV(new PVector(1, 1, 0));
      uvs[2] = new UV(new PVector(1, 0, 0));
      f.setUVs(uvs);
      faces.add(f);
      
      //calculate the top cap of the cylinder
      x = topRadius * p.cos(angleStep * i);
      z = topRadius * p.sin(angleStep * i);
      Vertex v3 = new Vertex(new PVector(x, -myHeight, z));
      x = topRadius * p.cos(angleStep * (i + 1));
      z = topRadius * p.sin(angleStep * (i + 1));
      Vertex v4 = new Vertex(new PVector(x, -myHeight, z));
      Vertex v5 = new Vertex(new PVector(0, -myHeight, 0));
      vertices.add(v3);
      vertices.add(v4);
      vertices.add(v5);
      
      Face f2 = new Face(new Vertex[]{v3, v4, v5});
      UV[] uvs2 = new UV[3];
      uvs2[0] = new UV(new PVector(0, 1, 0));
      uvs2[1] = new UV(new PVector(1, 1, 0));
      uvs2[2] = new UV(new PVector(1, 0, 0));
      f2.setUVs(uvs2);
      faces.add(f2);
      
      Face f3 = new Face(new Vertex[]{v0, v1, v3});
      UV[] uvs3 = new UV[3];
      uvs3[0] = new UV(new PVector(1, 1, 0));
      uvs3[1] = new UV(new PVector(0, 1, 0));
      uvs3[2] = new UV(new PVector(1, 0, 0));
      f3.setUVs(uvs3);
      faces.add(f3);
      
      Face f4 = new Face(new Vertex[]{v3, v4, v1});
      UV[] uvs4 = new UV[3];
      uvs4[0] = new UV(new PVector(1, 0, 0));
      uvs4[1] = new UV(new PVector(0, 0, 0));
      uvs4[2] = new UV(new PVector(0, 1, 0));
      f4.setUVs(uvs4);
      faces.add(f4);
      
    }
    
  }
}