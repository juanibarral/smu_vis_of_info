import java.net.*;
class SwapiConnector
{
  private static final String BASE_URL = "https://swapi.co/api/"; 
  /**
   * This method was created due that swapi does not allow requests directly
   * with loadStrings or loadJSONObject
   */
  public JSONObject loadSwapi(String request)
  {
    if(request.contains(BASE_URL))
    {
      request = request.replace(BASE_URL, "");
    }
    JSONObject jsonObject = null;
    try
    {
      URL url= new URL(BASE_URL + request);
      URLConnection connection = url.openConnection();
      connection.setRequestProperty("User-Agent", "SWAPI-Processing-Client/1.0" );
      connection.setRequestProperty("Accept", "application/json" );
      
      String[] results = loadStrings(connection.getInputStream());  
      jsonObject = parseJSONObject(results[0]);
    } catch(Exception e)
    {
      e.printStackTrace();
    }
    return jsonObject;
  }
}
