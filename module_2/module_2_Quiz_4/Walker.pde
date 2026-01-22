class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000, tScale = 0 , tRed = 250, tGreen = 500, tBlue = 750;

  
  void render()
  { 
  int r = int(map(noise(tRed), 0, 1, 0, 255));
  int g = int(map(noise(tGreen), 0, 1, 0, 255));
  int b = int(map(noise(tBlue), 0, 1, 0, 255));
  
  color perlinColor = color(r, g, b, 255);
  fill(perlinColor);
    tRed += 0.03f;
    tGreen += 0.03f;
    tBlue += 0.03f;
    
  float scale = map(noise(tScale), 0, 1, 5, 151);
    tScale += 0.02f;

   noStroke();
   circle (x, y, scale);
   
  }
  
  void perlinWalk()
  {
    
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
    
  }
}
