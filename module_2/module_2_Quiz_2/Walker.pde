class Walker
{
  float x;
  float y; 
  void render()
  { 
   color randomColor = color(int(random(256)),int(random(256)),int(random(256)),int(random(50,101)));
   fill(randomColor);
   noStroke();
   circle (x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {y+=10;}
    else if (rng == 1)
    { y-=10;}
    else if (rng == 2)
    {x+=10;}
    else if (rng == 3)
    {x-=10;}
    else if (rng == 4)
    {x+=10;y+=10;}
    else if (rng == 5)
    { x-=10;y-=10;}
    else if (rng == 6)
    {x+=10;y-=10;}
    else if (rng == 7)
    {x-=10;y+=10;}
  }
  
  void randomWalkBiased()
  {
    float r = random(1);
    //bias here is not equal, 35% to the right, and around 9.29 for other sides except for the last one being 9.26 :))
    if (r < 0.35)
    { x += 10; }
    else if (r < 0.4429) 
    {y -= 10; }
    else if (r < 0.5358)
    { y += 10; } 
    else if (r < 0.6287)
    { x -= 10; }
    else if (r < 0.7216)
    { x += 10; y -= 10; }
    else if (r < 0.8145)
    { x -= 10; y -= 10; }
    else if (r < 0.9074)
    { x += 10; y += 10; }
    else
    { x -= 10; y += 10; }
  }
}
