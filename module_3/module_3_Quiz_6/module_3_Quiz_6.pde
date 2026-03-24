void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  PVector dir = mouse.copy().normalize();
  
  PVector saberEnd    = dir.copy().mult(300);
  PVector saberStart  = dir.copy().mult(-300);
  PVector handleEnd   = dir.copy().mult(30);
  PVector handleStart = dir.copy().mult(-30);
  
  // Red saber
  strokeWeight(10);
  stroke(255, 0, 0);
  line(handleEnd.x,   handleEnd.y,   saberEnd.x,   saberEnd.y);
  line(handleStart.x, handleStart.y, saberStart.x, saberStart.y);
  
  // White highlight
  strokeWeight(5);
  stroke(255);
  line(handleEnd.x,   handleEnd.y,   saberEnd.x,   saberEnd.y);
  line(handleStart.x, handleStart.y, saberStart.x, saberStart.y);
  
  // Black handle
  stroke(0);
  strokeWeight(8);
  line(handleStart.x, handleStart.y, handleEnd.x, handleEnd.y);
  
  println(int(saberEnd.dist(handleEnd)));
}
