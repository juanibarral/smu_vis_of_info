DataLoader loader;
StateVis vis01;

static final int CANVAS_W = 1000;
static final int CANVAS_H = 1000;

void settings()
{
  loader = new DataLoader();
  vis01 = new StateVis(loader.getCars());
  size(CANVAS_W, CANVAS_H);
}

void draw()
{
  background(200);
  vis01.render();
}
