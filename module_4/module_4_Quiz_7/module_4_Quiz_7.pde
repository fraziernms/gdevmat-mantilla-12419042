Walker[] walkers = new Walker[100];

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
}

PVector mousePos() 
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw() 
{
  background(130);

  PVector mouse = mousePos();

  for (int i = 0; i < walkers.length; i++) 
  {
    PVector direction = PVector.sub(mouse, walkers[i].position);

    direction.normalize();

    direction.mult(0.2);
    walkers[i].acceleration = direction;

    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
