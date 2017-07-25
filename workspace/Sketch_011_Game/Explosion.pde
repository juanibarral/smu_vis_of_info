class Explosion extends GameObject
{
  
  private PImage sprite;
  private PImage[] images;
  private int imageToRender;
  
  public Explosion()
  {
    sprite = loadImage("explosion_001.png");  
    
    sprite.loadPixels();
    color[] pixs = sprite.pixels;
    
    images = new PImage[38];
    
    int spritesRows = 5;
    int spritesColumns = 8;
    int spriteIndex = 0;
    for(int i = 0; i < spritesRows - 1; i++)
    {
      for(int j = 0; j < spritesColumns - 1; j++)
      {
        int spriteIStart = i * 128;
        int spriteIEnd = (i+1) * 128;
        int spriteJStart = j * 128;
        int spriteJEnd = (j+1) * 128;
        
        color[] newPixs = new color[16384];
        int newPixsIndex = 0;
        for(int spriteI = spriteIStart; spriteI < spriteIEnd; spriteI++)
        {
          for(int spriteJ = spriteJStart; spriteJ < spriteJEnd; spriteJ++)
          {
            int globalPos = (spriteI * 1024) + spriteJ;
            newPixs[newPixsIndex] = pixs[globalPos];
            newPixsIndex++;
          }
        }
        images[spriteIndex] = createImage(128, 128, ARGB);
        images[spriteIndex].pixels = newPixs;
        images[spriteIndex].updatePixels();
        spriteIndex++;
      }
    }
    
    println(images.length);
    println(spriteIndex);
    
  }
  protected void createObject()
  {
    //imageToRender++;
    //if(imageToRender > 27)
    //  imageToRender = 0;
    //image(images[imageToRender], globalPosition.x - 64, globalPosition.y - 64);
    
    noStroke();
    fill(255, 0, 0);
    rect(position.x, position.y, 128, 128);
  }
}