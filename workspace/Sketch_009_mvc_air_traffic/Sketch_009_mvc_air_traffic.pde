import java.util.Map;
Controller control;
PImage worldMap;
Window window;
Converter converter;
ArrayList<Country> origins;
int[] minMaxOrigins;

void settings()
{
  worldMap = loadImage("world_map.jpg");
  window = new Window();
  size(worldMap.width, worldMap.height);
  converter = new Converter(worldMap.width, worldMap.height);
  origins = new ArrayList<Country>();
}

void setup()
{
  surface.setTitle("Main View");
  control = new Controller(this);
}

void draw()
{
  image(worldMap, 0, 0);
  window.drawWindow();
  for(int i = 0; i < origins.size(); i++)
  {
    Country c = origins.get(i);
    PVector latlon = c.getPosition();
    PVector xy = converter.convert2Pixels(latlon.x, latlon.y);
    fill(255);
    String selOrigin = control.getSelectedOrigin();
    strokeWeight(1);
    if(selOrigin != null && selOrigin.equals(c.getName()))
    {
      fill(255, 0, 0);
      strokeWeight(3);
    }
    
    stroke(0);
    float radius = map(c.getOrigins(), minMaxOrigins[0], minMaxOrigins[1], 20, 40);
    ellipse(xy.x, xy.y, radius, radius);
    fill(0);
    textAlign(CENTER, CENTER);
    text(c.getOrigins(), xy.x, xy.y);
  }
}

void mouseMoved()
{
  window.updatePos(mouseX, mouseY);
  //float minLat   = map(mouseY, worldMap.height, 0, -90, 90); 
  //float minLon  = map(mouseX, 0, worldMap.width, -180, 180);
  //println(minLat + " " + minLon);
}

void mouseClicked()
{
  PVector windowCorner = window.getWindowCorner();
  cutImage(windowCorner);
  origins = control.getOrigins();
  minMaxOrigins = control.getMinMaxOrigins();
}

void cutImage(PVector windowCorner)
{
  if(windowCorner.x >= 0 && windowCorner.y >= 0)
  {
    PImage zoomImage = createImage(Window.WINDOW_SIZE_PX, Window.WINDOW_SIZE_PX, RGB); //<>//
    zoomImage.loadPixels();
    int zoomPxIndex= 0;
    for(int j = 0; j < worldMap.height; j++)
    {
      for(int i = 0; i < worldMap.width; i++)
      {
        int pixelIndex = i + (j * worldMap.width);
        if(i >= windowCorner.x 
            && i < (windowCorner.x + Window.WINDOW_SIZE_PX)
            && j >= windowCorner.y
            && j < (windowCorner.y +Window.WINDOW_SIZE_PX))
            {
              zoomImage.pixels[zoomPxIndex] = worldMap.pixels[pixelIndex];
              zoomPxIndex++;
            }
      }
    }
    zoomImage.updatePixels();
    control.updateZoomView(zoomImage, windowCorner);
    PVector min = converter.convert2latlon(windowCorner.x, windowCorner.y + Window.WINDOW_SIZE_PX);
    PVector max = converter.convert2latlon(windowCorner.x + Window.WINDOW_SIZE_PX, windowCorner.y);
    control.updateCoordinates(min.x, min.y, max.x, max.y);
  }

}
