import controlP5.*; //<>//
import java.util.Collections;

Controller myController;
ArrayList<String> riderNames;

ControlP5 cp5;
DropdownList d1;

void settings()
{
  size(400, 400);
}

void setup()
{
  
  myController = new Controller();
  riderNames = myController.getRiderNames();
  
  cp5 = new ControlP5(this);
  // create a DropdownList
  d1 = cp5.addDropdownList("myList-d1")
    .setPosition(10, 10)
    .setSize(300, 200)
    ;
  customize(d1);
  d1.close();

}

void customize(DropdownList ddl)
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

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    
    int index = (int)theEvent.getController().getValue();
    String riderNumber = riderNames.get(index).split(" - ")[0];
    myController.setRider(riderNumber);
  }
}

void draw()
{
  background(200);

}