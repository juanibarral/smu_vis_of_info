JSONObject urlInfo;
PImage randomDog;
void settings()
{
  urlInfo = loadJSONObject("https://dog.ceo/api/breeds/image/random");
  String dogURL = urlInfo.getString("message");
  randomDog = loadImage(dogURL);
  size(randomDog.width, randomDog.height);
}

void draw()
{
  image(randomDog, 0, 0);
}
