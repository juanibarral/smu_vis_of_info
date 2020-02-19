class Car
{
  private int price;
  private int year;
  private int mileage;
  private String city;
  private String state;
  private String vin;
  
  public Car(int price, int year, int mileage, String city, String state, String vin)
  {
    this.price = price;
    this.year = year;
    this.mileage = mileage;
    this.city = city;
    this.state = state;
    this.vin = vin;
  }
  
  public int getPrice(){return price;};
  public int getYear(){return year;};
  public int getMileage(){return mileage;};
  public String getCity(){return city;};
  public String getState(){return state;};
  public String getVin(){return vin;};
  
}
