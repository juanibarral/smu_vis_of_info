class Controller
{
  private ViewCurves view1;
  private Model model;
  
  private ViewBezier view2;
  
  private boolean hovered1;
  private boolean hovered2;
  private boolean hovered;
  
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
    
    hovered1 = false;
    hovered2 = false;
    hovered = false;
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
  
  public void updateHoveredStage(int viewId, boolean _hovered, int stageIndex)
  {
    
     switch(viewId)
     {
     case 1:
       if(hovered1 != _hovered)
         hovered1 = _hovered;
     break;
     case 2:
       if(hovered2 != _hovered)
         hovered2 = _hovered;
     break;
     }
    
    boolean h = hovered1 || hovered2;
    if(hovered != h)
    {
      hovered = h;
      println(hovered);
      view1.updateHovered(hovered, stageIndex);
      view2.updateHovered(hovered, stageIndex);
    }
   
  }
}