class Controller
{
  private ViewCurves view1;
  private ViewCurves view2;
  private Model model;
  
  private boolean hovered;
  
  private boolean hovered1;
  private boolean hovered2;
  
  public Controller()
  {
    model = new Model();
    view1 = new ViewCurves(this);
    view1.setId(1);
    view2 = new ViewBezier(this);
    view2.setId(2);
    
    
    model.loadData("data_tour_2016.json");
    
    PApplet.runSketch(new String[]{"My view 1"}, view1);
    PApplet.runSketch(new String[]{"My view 2"}, view2);
    
    hovered = false;
    hovered1 = false;
    hovered2 = false;
    
  }
  
  public ArrayList<String> getRiderNames()
  {
    return model.getRiderNames();
  }
  
  public void setRider(String riderNumber)
  {
    Rider rider = model.getRider(riderNumber);
    view1.setRider(rider);
    view2.setRider(rider);
  }
  
  public void updateHovered(int id, boolean h, int indexStage)
  {
    switch(id)
    {
      case 1 :
        if(hovered1 != h)
          hovered1 = h;
      break;
      case 2 :
        if(hovered2 != h)
          hovered2 = h;
      break;
    }
    
    boolean check = hovered1 || hovered2; 
    println(h);
    if(hovered != check)
    {
      hovered = check;
      println(hovered + " " + indexStage);
      view1.updateHover(hovered, indexStage);
      view2.updateHover(hovered, indexStage);
    }
  }
}