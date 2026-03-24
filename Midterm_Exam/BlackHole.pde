public class BlackHole 
{
  float x;
  float y;
  float scale = 50;

  void render() 
  {
    fill(255);
    noStroke();
    circle(x, y, scale);
  }
}
