class Controller
{
 private View view1;
 private View2 view2;
 private Model myModel;
 
 public Controller()
 {
   view1 = new View();
   view2 = new View2();
   myModel = new Model();
   
   PApplet.runSketch(new String[]{"View 1"}, view1);
   PApplet.runSketch(new String[]{"View 2"}, view2);
   view1.setController(this);
   view1.setPoints(myModel.getData());
   view1.update(true);
   view2.setPoints(myModel.getData());
   view2.update(true);
 }
 
 public void updateLine(int index)
 {
   println("updating " + index);
   view2.changeLine(index);  
 }
 
 public void update()
 {
   
 }
}