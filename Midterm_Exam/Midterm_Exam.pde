BlackHole blackHole = new BlackHole();
Walker[] walkers = new Walker[100];
int frame = 0;

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  gravPull();
}

void gravPull() 
{
  blackHole = new BlackHole();
  blackHole.x = random(Window.left, Window.right);
  blackHole.y = random(Window.bottom, Window.top);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].x = randomGaussian() * Window.windowWidth * 0.4;
    walkers[i].y = randomGaussian() * Window.windowHeight * 0.4;
  }

  frame = 0;
}

PVector mousePos() 
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw() 
{
  background(0);

  PVector mouse = mousePos();
  blackHole.x = mouse.x;
  blackHole.y = mouse.y;
  blackHole.render();

  for (int i = 0; i < walkers.length; i++) 
  {
    if (!walkers[i].alive) 
    {
      continue;
    }
    
    PVector walkerPos = new PVector(walkers[i].x, walkers[i].y);
    PVector blackHolePos = new PVector(blackHole.x, blackHole.y);
    PVector direction = PVector.sub(blackHolePos, walkerPos);

    float distance = direction.mag();

    if (distance < blackHole.scale / 2) 
    {
      walkers[i].alive = false;
      continue;
    }

    direction.normalize();
    direction.mult(500 / distance);

    walkers[i].x += direction.x + map(noise(walkers[i].x * 0.01, frame * 0.01), 0, 1, -1, 1);
    walkers[i].y += direction.y + map(noise(walkers[i].y * 0.01, frame * 0.01), 0, 1, -1, 1);
    walkers[i].render();
  }

  frame++;
  if (frame >= 300) 
  {
    gravPull();
  }
}
