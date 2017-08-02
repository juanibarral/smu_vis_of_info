class Controller
{
  private ViewMenu viewMenu;
  private Model model;
  
  public Controller()
  {
    
    model = new Model();
    model.loadData("data_tour_2016.json");
    
    viewMenu = new ViewMenu(this, model.getRiderNames());
    PApplet.runSketch(new String[]{"My 3D"}, viewMenu);
    
  }
  
  public void setRider(String riderNumber)
  {
    Rider r = model.getRider(riderNumber);
    updateRider(r);
  }
}