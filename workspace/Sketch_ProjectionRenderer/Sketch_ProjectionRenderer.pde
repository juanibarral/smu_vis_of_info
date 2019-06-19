ProjectionRenderer projectionRenderer;

void settings()
{
  // Change projection between MERCATOR and EQUIRECTANGULAR
  projectionRenderer = new ProjectionRenderer(ProjectionRenderer.MERCATOR);
  int[] imageSize = projectionRenderer.getImageSize();
  size(imageSize[0], imageSize[1]);
}

void draw()
{
  projectionRenderer.renderImage();
}
