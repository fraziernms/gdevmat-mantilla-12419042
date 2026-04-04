Walker[] walkers = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initWalkers();
}

void draw()
{
  background(80);

  stroke(100);
  strokeWeight(2);
  line(0, Window.top, 0, Window.bottom);
  noStroke();

  for (int i = 0; i < walkers.length; i++)
  {
    float mew = 0.01f;
    if (walkers[i].position.x >= 0)
      mew = 0.4f;

    float frictionMagnitude = mew * walkers[i].mass;
    PVector friction = walkers[i].velocity.copy();
    friction.normalize();
    friction.mult(-1);
    friction.mult(frictionMagnitude);
    walkers[i].applyForce(friction);

    PVector desiredAcceleration = new PVector(0.2, 0);
    PVector force = PVector.mult(desiredAcceleration, walkers[i].mass);

    walkers[i].applyForce(force);
    walkers[i].update();
    walkers[i].render();
  }
}

void mousePressed()
{
  initWalkers();
}

void initWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = 1 + i * 0.8;
    walkers[i].scale = walkers[i].mass * 12;
    walkers[i].col = color(random(255), random(255), random(255), 180);

    int n = i + 1;
    float posY = 2 * (Window.windowHeight / (float) walkers.length) * (n - (walkers.length / 2.0));
    walkers[i].position = new PVector(Window.left, -posY);
  }
}
