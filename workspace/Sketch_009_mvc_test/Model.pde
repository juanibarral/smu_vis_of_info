class Model
{
  private int[] sizes;
  
  public Model()
  {
    sizes = new int[5];
    sizes[0] = 100;
    sizes[1] = 150;
    sizes[2] = 200;
    sizes[3] = 250;
    sizes[4] = 300;
  }
  
  public int getSize(int index)
  {
    return sizes[index];
  }
  
}