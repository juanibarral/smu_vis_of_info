class Controller
{
  private Model model;
  private View1 view1;
  private View2 view2;
  
  private int counter;
  
  public Controller()
  {
    model = new Model();
    view1 = new View1(this);
    view2 = new View2();
    
    PApplet.runSketch(new String[]{"My view 1"}, view1);
    PApplet.runSketch(new String[]{"My view 2"}, view2);
    
    counter = 0;
  }
  
  public void update(int view, boolean inside)
  {
    if(view == 1)
    {
      view2.update(inside);
    }
    else if(view == 2)
    {
      view1.update(inside);
    }
  }
  
  public void updateSize()
  {
    counter++;
    if(counter >= 5)
    {
      counter = 0;
    }
    int size = model.getSize(counter);
    view1.setRadius(size);
    view2.setSide(size);
  }
}