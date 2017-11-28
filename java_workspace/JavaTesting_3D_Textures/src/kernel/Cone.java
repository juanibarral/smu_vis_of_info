package kernel;

import processing.core.PApplet;
import processing.core.PVector;

public class Cone extends AbstractObject_3D{

	private float rotAngle;
	private float rotSpeed;
	public Cone(PApplet pApplet, int resolution, float radius, float apexHeight) {
		super(pApplet);
		float angleStep = 2 * PApplet.PI / resolution;

		PVector vc = new PVector(0, 0, 0);
		PVector va = new PVector(0, -apexHeight, 0);
		vertices.add(vc);
		vertices.add(va);
		for(int i = 0; i < resolution ; i++)
		{
			float angle = angleStep * i;
			float x = radius * (float)Math.cos(angle);
			float z = radius * (float)Math.sin(angle);
			PVector a = new PVector(x, 0, z);
			vertices.add(a);
		}

		for(int i = 0; i < resolution; i++)
		{
			int vertA = i + 2;
			int vertB = i + 3 == resolution + 2 ? 2 : i + 3;
			int[] fc = new int[]{vertB, vertA, 0};
			PVector[] uvc = new PVector[] {new PVector(0,0), new PVector(0,1), new PVector(1,0)};
			int[] fa = new int[]{vertA, vertB, 1};
			PVector[] uva = new PVector[] {new PVector(1,1), new PVector(0,1), new PVector(0,0)};
			faces.add(fc);
			uvs.add(uvc);
			faces.add(fa);
			uvs.add(uva);
		}

	}

	@Override
	protected void createObject() {
		p.noStroke();
		p.noFill();
		p.beginShape(PApplet.TRIANGLES);
		if(textureImage != null)
		{
			p.texture(textureImage);
		}
		for(int i = 0; i < faces.size(); i++)
		{
			int[] f = faces.get(i);
			PVector v0 = vertices.get(f[0]);
			PVector v1 = vertices.get(f[1]);
			PVector v2 = vertices.get(f[2]);

			if(textureImage == null)
			{
				p.vertex(v0.x, v0.y, v0.z);
				p.vertex(v1.x, v1.y, v1.z);
				p.vertex(v2.x, v2.y, v2.z);
			}
			else
			{
				PVector[] uv = uvs.get(i);
				int textWidth = textureImage.width;
				int textHeight = textureImage.height;
				p.vertex(v0.x, v0.y, v0.z, uv[0].x * textWidth, uv[0].y * textHeight);
				p.vertex(v1.x, v1.y, v1.z, uv[1].x * textWidth, uv[1].y * textHeight);
				p.vertex(v2.x, v2.y, v2.z, uv[2].x * textWidth, uv[2].y * textHeight);
			}

		}
		p.endShape();
	}

	public void setRotSpeed(float speed)
	{
		rotSpeed = speed;
	}

	protected void applyTransformations()
	{
		rotAngle += rotSpeed;
		p.rotateX(rotAngle);
	}
}
