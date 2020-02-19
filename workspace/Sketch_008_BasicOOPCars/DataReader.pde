class DataLoader
{
  private static final String DATA_URL = "honda_civic.csv";
  private Table rawData;
  private ArrayList<Car> cars;
  
  public DataLoader()
  {
    cars = new ArrayList<Car>();
    rawData = loadTable(DATA_URL, "header, csv");
    for (TableRow row : rawData.rows()) {
      int price = row.getInt("Price");
      int year = row.getInt("Year");
      int mileage = row.getInt("Mileage");
      String city = row.getString("City");
      String state = row.getString("State");
      String vin = row.getString("Vin");
      Car car = new Car(price, year, mileage, city, state, vin);
      cars.add(car);
    }
    println("Data loaded: " + cars.size() + " records loaded.");
  }
  
  public ArrayList<Car> getCars()
  {
    return cars;
  }
}
