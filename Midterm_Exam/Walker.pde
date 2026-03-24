public class Walker 
{
  float x;
  float y;
  float scale;
  color col;
  boolean alive = true;

  Walker() 
  {
    scale = random(5, 20);
    col = color(random(255), random(255), random(255));
  }

  void render() 
  {
    fill(col);
    noStroke();
    circle(x, y, scale);
  }
}
