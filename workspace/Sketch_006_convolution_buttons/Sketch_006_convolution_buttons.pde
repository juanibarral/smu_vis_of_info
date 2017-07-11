import controlP5.*;

ControlP5 cp5;

PImage img; 

int lensSize = 90;
int lensGridSize = 3;
int lensHalf = (lensGridSize - 1) / 2;

int[][] kernelBlur = 
{
  {1, 1, 1},
  {1, 1, 1},
  {1, 1, 1},
};

int[][] kernelEdgeDetection = 
{
  {0,  1, 0},
  {1, -4, 1},
  {0,  1, 0},
};

int[][] kernelSharpen = 
{
  { 0, -1,  0},
  {-1,  5, -1},
  { 0, -1,  0},
};

int[][] kernelIdentity = 
{
  { 0,  0,  0},
  { 0,  1,  0},
  { 0,  0,  0},
};

static final int IDENTITY = 1;
static final int EDGE_DETECTION = 2;
static final int SHARPEN = 3;
static final int BOX_BLUR = 4;

int kernelId = IDENTITY;

void settings()
{
  img = loadImage("bogota.jpg"); 
  size(img.width, img.height * 2); 
}

void setup() { 
 cp5 = new ControlP5(this);
 
 cp5.addButton("Identity")
     .setValue(10)
     .setPosition(20,20)
     .setSize(100,30)
     .setId(1);
     
 cp5.addButton("Edge detection")
     .setValue(10)
     .setPosition(20,55)
     .setSize(100,30)
     .setId(2);
     
 cp5.addButton("Sharpen")
     .setValue(10)
     .setPosition(20,90)
     .setSize(100,30)
     .setId(3);
     
 cp5.addButton("Box blur")
     .setValue(10)
     .setPosition(20,125)
     .setSize(100,30)
     .setId(4);

} 

void draw() { 
  
  image(img, 0, 0);
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
          int[][] convolutionKernel = new int[1][1];
          switch(kernelId)
          {
            case IDENTITY : 
              convolutionKernel = kernelIdentity;
            break;
            case EDGE_DETECTION : 
              convolutionKernel = kernelEdgeDetection;
            break;
            case SHARPEN : 
              convolutionKernel = kernelSharpen;
            break;
            case BOX_BLUR : 
              convolutionKernel = kernelBlur;
            break;
          }
          red += convolutionKernel[ky+1][kx+1] * valR;
          green += convolutionKernel[ky+1][kx+1] * valG;
          blue += convolutionKernel[ky+1][kx+1] * valB;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      if(kernelId == BOX_BLUR)
      {
        red /= 9;
        green /= 9;
        blue /= 9;
      }
      convolutedImage.pixels[y*img.width + x] = color(red, green, blue);
    }
  }
  convolutedImage.updatePixels();
  image(convolutedImage, 0, height/2); // Draw the new image
  
  //*/
  
}

public void controlEvent(ControlEvent theEvent) {
  int id = theEvent.getController().getId();
  if(id > 0 && id < 5)
    kernelId = id;
}