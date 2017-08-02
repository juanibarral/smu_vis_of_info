abstract class AbstractGeometry
{
  protected ArrayList<Vertex> vertices;
  protected ArrayList<Face> faces;
  protected ArrayList<UV> uvs;
  
  protected PImage myTexture;
  
  public AbstractGeometry()
  {
    vertices = new ArrayList<Vertex>();
    faces = new ArrayList<Face>();
  }
  
  public void setTexture(String texturePath)
  {
    myTexture = loadImage(texturePath);
  }
  
  public void render()
  {
    //noFill();
    stroke(255);
    noStroke();
    beginShape(TRIANGLES);
      if(myTexture != null)
      {
        texture(myTexture);
        for(int i = 0; i < faces.size(); i++)
        {
          Vertex[] vs = faces.get(i).getVertices();
          UV[] uvs = faces.get(i).getUVs();
          
          int s = (int)uvs[0].coordinate.x * myTexture.width;
          int t = (int)uvs[0].coordinate.y * myTexture.height;
          vertex(vs[0].coordinates.x, vs[0].coordinates.y, vs[0].coordinates.z, s, t);
          s = (int)uvs[1].coordinate.x * myTexture.width;
          t = (int)uvs[1].coordinate.y * myTexture.height;
          vertex(vs[1].coordinates.x, vs[1].coordinates.y, vs[1].coordinates.z, s, t);
          s = (int)uvs[2].coordinate.x * myTexture.width;
          t = (int)uvs[2].coordinate.y * myTexture.height;
          vertex(vs[2].coordinates.x, vs[2].coordinates.y, vs[2].coordinates.z, s, t);
        }
      }
      else
      {
        for(int i = 0; i < faces.size(); i++)
        {
          Vertex[] vs = faces.get(i).getVertices();
          vertex(vs[0].coordinates.x, vs[0].coordinates.y, vs[0].coordinates.z);
          vertex(vs[1].coordinates.x, vs[1].coordinates.y, vs[1].coordinates.z);
          vertex(vs[2].coordinates.x, vs[2].coordinates.y, vs[2].coordinates.z);
        }
      }
    endShape();
    
  }
}