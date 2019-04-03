abstract class Abstract3DObject
{
  protected ArrayList<String> transformations;
  
  public static final String TRANS = "TRANS";
  public static final String ROT_X = "ROT_X";
  public static final String ROT_Y = "ROT_Y";
  public static final String ROT_Z = "ROT_Z";
  public static final String SCALE = "SCALE";
  
  public Abstract3DObject()
  {
    transformations = new ArrayList<String>();
  }
  
  protected abstract void renderObject();

  /**
   * Adds a new transformation
   * @param type Type of transformation
   * @param params Params for the transformation, separated by commas.
   */
  public int addTransformation(String type, String params)
  {
    transformations.add(type + "," + params);
    return transformations.size() - 1;
  }

  /**
   * Updates the transformation params
   * @param index Index of the transformation being updated
   * @param newParams Params to be updated for the transformation, separated by commas.
   */
  public void updateTransformation(int index, String newParams)
  {
    String[] t = transformations.get(index).split(",");
    transformations.set(index, t[0] + "," + newParams);
  }

  /**
   * Updates the transformation by index
   * @param index Index of the transformation being updated
   * @param type Type of the updated transformation.
   * @param newParams Params to be updated for the transformation, separated by commas.
   */
  public void updateTransformation(int index, String type, String newParams)
  {
    transformations.set(index, type + "," + newParams);
  }
  
  /**
   * Clear all the transformations
   */
  public void clearTransformations()
  {
    transformations.clear();
  }

  /**
   * Remove transformation by index
   * @param index Index of transformation to remove
   */
  public void removeTransformation(int index)
  {
    transformations.remove(index);
  }

  /**
   * Process the list of transformations
   */
  protected void processTransformations()
  {
    for(String transformation : transformations)
    {
      String[] t = transformation.split(",");
      String type = t[0];
      if(type.equals(TRANS))
      {
        translate(float(t[1]), float(t[2]), float(t[3]));
      }
      else if(type.equals(ROT_X))
      {
        rotateX(float(t[1]));
      }
      else if(type.equals(ROT_Y))
      {
        rotateY(float(t[1]));
      }
      else if(type.equals(ROT_Z))
      {
        rotateZ(float(t[1]));
      }
      else
      {
        println("Error: no transformation set");
      }
    }
  }
  
  /**
   * Render the object, processing the transformations.
   */
  protected void render()
  {
    pushMatrix();
      processTransformations();
      renderObject();
    popMatrix();
  }
}
