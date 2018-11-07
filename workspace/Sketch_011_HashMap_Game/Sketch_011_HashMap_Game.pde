HashMap<String, GameObject> objects;
Shooter myShooter;

static final int SPEED = 5;
static final int CANVAS_WIDTH = 500;
static final int CANVAS_HEIGHT = 500;

int counter = 1;
void settings()
{
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
}
void setup()
{
  objects = new HashMap<String, GameObject>();
  myShooter = new Shooter();
  myShooter.updatePosition(new PVector(250, 400));
  objects.put("SHOOTER", myShooter); //0
  objects.put("ENEMY_1", new Enemy(new PVector(100, 0), 5)); //1
  
}

void draw()
{
  background(200);
  counter++;
  
  if(counter % 100 == 0)
  {
    objects.put("ENEMY_" + objects.size(), new Enemy(new PVector(random(500), 0), (int)random(10))); //1
  }
  
  ArrayList<String> indicesToBeRemoved = new ArrayList<String>();
  for(HashMap.Entry entry : objects.entrySet())
  {
    GameObject o = (GameObject)entry.getValue();
    if(o instanceof Enemy)
    {
      ((Enemy)o).updatePosition();
      if(o.getCurrentPosition().y > CANVAS_HEIGHT)
      {
        ((Enemy)o).setToBeRemoved();
        indicesToBeRemoved.add((String)entry.getKey());
      }
    }
    o.drawObject();
  }
  
  for(String s : indicesToBeRemoved)
  {
    objects.remove(s);
  }
  println(objects.size());
}
