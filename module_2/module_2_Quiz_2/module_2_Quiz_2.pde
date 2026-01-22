void setup()
{
  size(1280,720, P3D);
  camera(0, 0, -(height/2.0) /tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

Walker randomWalker = new Walker();
Walker biasedWalker = new Walker();

void draw()
{
  randomWalker.randomWalk();  
  randomWalker.render();
  
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
}
