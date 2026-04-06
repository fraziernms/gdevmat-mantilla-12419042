Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = random(1, 20);
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].col = color(random(255), random(255), random(255));
    walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
  }
}

void draw()
{
  background(255);

  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j)
      {
        walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
      }
    }

    walkers[i].update();
    walkers[i].render();
  }
}
