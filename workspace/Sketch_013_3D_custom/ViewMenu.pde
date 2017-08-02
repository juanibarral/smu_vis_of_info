class ViewMenu extends PApplet
{ 
  private ControlP5 cp5;
  private DropdownList d1;
  
  private ArrayList<String> riderNames;
  private Controller myController;
  
  public ViewMenu(Controller _myController, ArrayList<String> _riderNames)
  {
    myController = _myController;
    riderNames = _riderNames;
  }
  public void settings()
  {
    size(300, 300);
  }
  
  public void setup()
  {
      cp5 = new ControlP5(this);
      d1 = cp5.addDropdownList("myList-d1")
        .setPosition(10, 10)
        .setSize(300, 200)
        ;
      customize(d1);
      d1.close();
  }
  
  public void draw()
  {
    background(200);
  }
  
  private void customize(DropdownList ddl)
  {
    ddl.setBackgroundColor(color(190));
    ddl.setItemHeight(20);
    ddl.setBarHeight(15);
    ddl.setCaptionLabel("Riders");
  
    for (int i=0; i<riderNames.size(); i++) {
      ddl.addItem(riderNames.get(i), i);
    }
    ddl.setColorBackground(color(60));
    ddl.setColorActive(color(255, 128));
  }

  public void controlEvent(ControlEvent theEvent) 
  {
    if (theEvent.isController()) {
      
      int index = (int)theEvent.getController().getValue();
      String riderNumber = riderNames.get(index).split(" - ")[0];
      myController.setRider(riderNumber);
    }
  }
}