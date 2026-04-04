Walker[] walker = new Walker[10];
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);
 
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    walker[i].mass = i + 1;
    walker[i].scale = walker[i].mass * 15;
    walker[i].col = color(random(255), random(255), random(255), 120);
    walker[i].position = new PVector(-500, 200);
  }
}
 
void draw()
{
  background(80);
 
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].applyForce(gravity);
    walker[i].applyForce(wind);
    walker[i].update();
    walker[i].checkEdges();
    walker[i].render();
  }
}
