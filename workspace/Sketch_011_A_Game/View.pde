class View
{
  private Controller controller;
  private HashMap<String, GameObject> objects;
  public View(Controller controller)
  {
    this.controller = controller;
  }
  
  public void drawScene()
  {
    background(255);
    //println(objects.size());
    ArrayList<GameObject> colliders = new ArrayList<GameObject>();
    for(HashMap.Entry<String, GameObject> entry : objects.entrySet())
    {
      GameObject go = entry.getValue();
      go.renderObject();
      if(go.isCollider())
      {
        colliders.add(go);
      }
    }
    
    controller.updateMousePos(mouseX, mouseY);
    controller.checkCollisions(colliders);
    controller.checkBounds();
  }
  
  public void updateObjects(HashMap<String, GameObject> _objects)
  {
    objects = _objects;
  }
}