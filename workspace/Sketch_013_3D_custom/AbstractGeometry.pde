abstract class AbstractGeometry
{
  protected ArrayList<Vertex> vertices;
  protected ArrayList<Face> faces;
  protected PVector position;
  protected PVector rotation;
  
  protected PImage textureImage;
  
  public AbstractGeometry()
  {
    vertices = new ArrayList<Vertex>();
    faces = new ArrayList<Face>();
    position = new PVector(0,0,0);
    rotation = new PVector(0,0,0);
  }
  
  public void setTexture(String texturePath)
  {
    textureImage = loadImage(texturePath);
  }
  
  public void setPosition(PVector _position)
  {
    position = _position;
  }
  public void setRotation(PVector _rotation)
  {
    rotation = _rotation;
  }
  
  public PVector getRotation()
  {
    return rotation;
  }
  
  public void render()
  {
    stroke(255);
    //noFill();
    noStroke();
    
    emissive(200,0,0);
    specular(255, 255, 255);
    shininess(5.0);
    
    pushMatrix();
      translate(position.x, position.y, position.z);
      rotateX(rotation.x);
      rotateY(rotation.y);
      rotateZ(rotation.z);
      beginShape(TRIANGLES);
      if(textureImage != null)
      {
        texture(textureImage);
      }
      for(int i = 0; i < faces.size(); i++)
      {
        Face f = faces.get(i);
        PVector v0 = f.getVertex(0).getPos();
        PVector v1 = f.getVertex(1).getPos();
        PVector v2 = f.getVertex(2).getPos();
        if(textureImage == null)
        {
          vertex(v0.x, v0.y, v0.z);
          vertex(v1.x, v1.y, v1.z);
          vertex(v2.x, v2.y, v2.z);
        }
        else
        {
          UV[] uvs = f.getUVs();
          int textWidth = textureImage.width;
          int textHeight = textureImage.height;
          vertex(v0.x, v0.y, v0.z, uvs[0].getU() * textWidth, uvs[0].getV() * textHeight); //<>//
          vertex(v1.x, v1.y, v1.z, uvs[1].getU() * textWidth, uvs[1].getV() * textHeight);
          vertex(v2.x, v2.y, v2.z, uvs[2].getU() * textWidth, uvs[2].getV() * textHeight);
        }
      }
      endShape();
    popMatrix();
  }
}