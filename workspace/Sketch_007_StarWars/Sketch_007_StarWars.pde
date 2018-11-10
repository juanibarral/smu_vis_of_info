JSONObject json;
static final int CANVAS_WIDTH = 1800;
static final int CANVAS_HEIGHT = 800;
SwapiConnector connector;



void settings()
{
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  connector = new SwapiConnector();
}

void setup()
{
  loadImages();
  loadPlanets();
  loadFilms();
  createHoveringPoints();
  initStars();
}

void draw()
{
  background(0);
  drawBackground();
  drawDashboard();
  drawConnections();
  drawFilms();
  drawPlanets();
}

void mouseMoved()
{
  checkHovering();
}
