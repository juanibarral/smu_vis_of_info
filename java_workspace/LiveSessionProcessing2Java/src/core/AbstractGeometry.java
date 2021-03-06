package core;


import processing.core.*;
import java.util.ArrayList;

abstract class AbstractGeometry
{
  protected ArrayList<Vertex> vertices;
  protected ArrayList<Face> faces;
  protected ArrayList<UV> uvs;
  
  protected PImage myTexture;
  
  protected PApplet p;

  public AbstractGeometry()
  {
    p = null;
  }

  public AbstractGeometry(PApplet _p)
  {
    p = _p;
    vertices = new ArrayList<Vertex>();
    faces = new ArrayList<Face>();
  }
  
  public void setTexture(String texturePath)
  {
    myTexture = p.loadImage(texturePath);
  }
  
  public void render()
  {
    //noFill();
    p.stroke(255);
    p.noStroke();
    p.beginShape(p.TRIANGLES);
      if(myTexture != null)
      {
        p.texture(myTexture);
        for(int i = 0; i < faces.size(); i++)
        {
          Vertex[] vs = faces.get(i).getVertices();
          UV[] uvs = faces.get(i).getUVs();
          
          int s = (int)uvs[0].coordinate.x * myTexture.width;
          int t = (int)uvs[0].coordinate.y * myTexture.height;
          p.vertex(vs[0].coordinates.x, vs[0].coordinates.y, vs[0].coordinates.z, s, t);
          s = (int)uvs[1].coordinate.x * myTexture.width;
          t = (int)uvs[1].coordinate.y * myTexture.height;
          p.vertex(vs[1].coordinates.x, vs[1].coordinates.y, vs[1].coordinates.z, s, t);
          s = (int)uvs[2].coordinate.x * myTexture.width;
          t = (int)uvs[2].coordinate.y * myTexture.height;
          p.vertex(vs[2].coordinates.x, vs[2].coordinates.y, vs[2].coordinates.z, s, t);
        }
      }
      else
      {
        for(int i = 0; i < faces.size(); i++)
        {
          Vertex[] vs = faces.get(i).getVertices();
          p.vertex(vs[0].coordinates.x, vs[0].coordinates.y, vs[0].coordinates.z);
          p.vertex(vs[1].coordinates.x, vs[1].coordinates.y, vs[1].coordinates.z);
          p.vertex(vs[2].coordinates.x, vs[2].coordinates.y, vs[2].coordinates.z);
        }
      }
    p.endShape();
    
  }
}