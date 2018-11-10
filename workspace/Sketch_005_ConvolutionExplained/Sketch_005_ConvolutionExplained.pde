PImage img; 

int canvasWidth = 0;
int canvasHeight = 0;
int lensSize = 90;
int lensGridSize = 3;
int lensHalf = (lensGridSize - 1) / 2;
final static int BLUR = 0;
final static int EDGE_DETECTION = 1;
final static int SHARPEN = 2;
final static int JUAN = 3;
int currentKernel = 0;

final static int[][] BLUR_KERNEL = {
  {1, 1, 1},
  {1, 1, 1},
  {1, 1, 1},
};

final static int[][] EDGE_DETECTION_KERNEL = {
  {0,  1, 0},
  {1, -4, 1},
  {0,  1, 0}
};

final static int[][] SHARPEN_KERNEL = {
  { 0, -1,  0},
  {-1,  5, -1},
  { 0, -1,  0},
};

final static int[][] JUAN_KERNEL = {
  { 9,  0,  0},
  { 0,  0,  0},
  { 0,  0, -8}
};

int[][] convolutionKernel = null;

void settings()
{
  img = loadImage("bogota_big.jpg");
  canvasWidth = img.width;
  canvasHeight = img.height;
  size(canvasWidth, canvasHeight * 2); 
}

void setup() { 
 
} 

void draw() { 
  switch(currentKernel)
  {
    case BLUR:
      convolutionKernel = BLUR_KERNEL;
    break;
    case EDGE_DETECTION:
      convolutionKernel = EDGE_DETECTION_KERNEL;
    break;
    case SHARPEN:
      convolutionKernel = SHARPEN_KERNEL;
    break;
    case JUAN:
      convolutionKernel = JUAN_KERNEL;
    break;
  }
  image(img, 0, 0);
  color[][] colors = new color[lensGridSize][lensGridSize];
  int posX = mouseX;
  int posY = mouseY > canvasHeight ? canvasHeight : mouseY;
  for(int i = 0; i < lensGridSize; i ++)
  {
   for(int j = 0; j < lensGridSize; j ++)
   {
     colors[i][j] = img.get(posX + i - lensHalf, posY + j - lensHalf);   
   } 
  }

  ///*
  img.loadPixels();

  PImage convolutedImage = createImage(img.width, img.height, RGB);
  for (int y = 1; y < img.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) {  // Skip left and right edges
      float red = 0; // Kernel sum for this pixel
      float green = 0; // Kernel sum for this pixel
      float blue = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*img.width + (x + kx);
          float valR = red(img.pixels[pos]);
          float valG = green(img.pixels[pos]);
          float valB = blue(img.pixels[pos]);
          red += convolutionKernel[ky+1][kx+1] * valR;
          green += convolutionKernel[ky+1][kx+1] * valG;
          blue += convolutionKernel[ky+1][kx+1] * valB;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      if(currentKernel == BLUR)
      {
        convolutedImage.pixels[y*img.width + x] = color(red / 9, green / 9, blue / 9);
      }
      else
      {
        convolutedImage.pixels[y*img.width + x] = color(red, green, blue);
      }
    }
  }
  convolutedImage.updatePixels();
  image(convolutedImage, 0, height/2); // Draw the new image
  
  //*/

  drawConvolution(posX, posY, colors);
}

void keyPressed()
{
  if(key == ' ')
  {
    currentKernel++;
    if(currentKernel > 3)
    {
      currentKernel = 0;
    }
  }
}
