void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker Bounce = new Walker();

void draw()
{
  Bounce.moveAndBounce();
  Bounce.render();
}
