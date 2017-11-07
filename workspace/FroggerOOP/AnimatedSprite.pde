class AnimatedSprite
{
  PImage[] images;
  int currentFrame;
  boolean animate;
  int frameSpeed;
  
  public AnimatedSprite(String spritePath, int gridWidth, int gridHeight)
  {
    currentFrame = -1;
    animate = false;
    PImage sprite = loadImage(spritePath);
    int spriteWidth = sprite.width;
    int spriteHeight = sprite.height;
    int spriteCellWidth = spriteWidth / gridWidth;
    int spriteCellHeight = spriteHeight / gridHeight;
    sprite.loadPixels();
    images = new PImage[gridWidth * gridHeight];
    int imagesCount = 0;
    for(int j = 0; j < gridHeight; j++)
    {
      for(int i = 0; i < gridWidth ; i++)
      {
        PImage image_i = createImage(spriteCellWidth, spriteCellHeight, ARGB);
        int imagePos = 0;
        int initialPosI = i * spriteCellWidth;
        int initialPosJ = j * spriteCellHeight;
        for(int spriteJ = initialPosJ; spriteJ < initialPosJ + spriteCellHeight; spriteJ++)
        {
          for(int spriteI = initialPosI; spriteI < initialPosI + spriteCellWidth; spriteI++)
          {
            int pos = spriteI + (spriteJ * spriteWidth);
            image_i.pixels[imagePos] = sprite.pixels[pos];
            imagePos++;
          }
        }
        image_i.updatePixels();
        images[imagesCount] = image_i;
        imagesCount++;
      }
    }
  }
  
  public void display(int posX, int posY)
  {
    if(animate)
    {
      currentFrame++;
      if(currentFrame < images.length)
      {
        image(images[currentFrame], posX, posY);
      }
      else
      {
        currentFrame = -1;
        animate = false;
      }
    }
    else
    {
      image(images[0], posX, posY);
    }
  }
  
  public void animate()
  {
    animate = true;
  }
  
  public int getCellWidth()
  {
    return images[0].width;
  }
  
  public int getCellHeight()
  {
    return images[0].height;
  }
}