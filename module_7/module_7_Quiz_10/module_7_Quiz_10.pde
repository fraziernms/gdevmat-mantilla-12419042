Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  float spacing = (float)(Window.right - Window.left) / (walkers.length + 1);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = random(1, 5);
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].col = color(random(255), random(255), random(255));
    walkers[i].position = new PVector(Window.left + spacing * (i + 1), Window.top + walkers[i].scale);
  }
}

void draw()
{
  background(255);
  ocean.render();

  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  PVector wind = new PVector(0.1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    PVector friction = walkers[i].velocity.copy();
    walkers[i].applyForce(friction.normalize().mult(-frictionMagnitude));

    PVector gravity = new PVector(0, -0.15 * walkers[i].mass);
    walkers[i].applyForce(gravity);

    if (ocean.isCollidingWith(walkers[i]))
    {
      PVector dragForce = ocean.calculateDragForce(walkers[i]);
      walkers[i].applyForce(dragForce);

    }
    else
    {      
      walkers[i].applyForce(wind);
    }

    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  }
}
