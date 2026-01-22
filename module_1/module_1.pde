int globalVariable = 100;
float time = 1000; 
float amplitude = 75.0;
float frequency = 0.05;

void setup()
{
  size(1280,720, P3D);
  camera(0, 0, -(height/2.0) /tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

void draw()
{
  background(0);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  //drawCircle();
  drawSineWave();
  drawKeystrokes();

  
 //circle(0,0,15); // x,y,thickness
 
}

void drawCartesianPlane()
{
   strokeWeight(2);
  color white = color(255, 255, 255);
  fill (white);
  stroke (white);
  
  line(-300, 0, 300, 0);//x1,y1,x2,y2
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  /* 
    f(x) = x^2  - 15x-3
     let x be 4, then y = -41 (4,-41)
    f(x) = -5x + 30
      let x be 5, then y = 5 (5,5);
   */
 
   color purple = color(128, 0, 128);
   fill (purple);
   noStroke();
   
   for (int x = -200; x <= 200; x++)
   {
     circle(x, (-5*x + 30), 5);
   }
}


void drawQuadraticFunction()
{
  color yellow = color (255, 255, 0);
  fill (yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x, (float)Math.pow(x, 2) + (15 * x) -3, 5);
  }
}

//void drawCircle()
//{
//  color red = color (255, 0 , 0);
//  fill (red);
//  stroke (red);
//  float radius = 50;
  
//  for (int x = 0; x <= 360; x++)
//  {
//     circle((float)Math.cos(x) * radius, (float)Math.sin(x) *radius, 5);
//  }
//}

void drawSineWave()
{
  color blue = color (0, 0, 255);
  fill (blue);
  stroke(blue);
  
  time+= 0.05; //increase per frame
    
  for (int x = -300; x<=300; x+=1)
  {
    float y = sin(x * frequency + time) * amplitude;
    circle(x, y, 4);
  }
}

void drawKeystrokes()
{
  float delta = 5;
  float freqDelta =0.01;
  
  if(keyPressed){
  
    if (key == 'w' || key == 'W') amplitude += delta;
    if (key == 's' || key == 'S')
    {
      amplitude -= delta;
      if (amplitude <1) amplitude = 1 ;
    }
  
    if (key == 'a' || key == 'A') frequency += freqDelta;
    if (key == 'd' || key == 'D')
    {
      frequency -= freqDelta;
      if (frequency < 0.001) frequency = 0.001 ;
    }
  }
}
