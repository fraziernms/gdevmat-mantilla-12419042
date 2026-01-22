void setup()
{
  size(1280,720, P3D);
  camera(0, 0, -(height/2.0) /tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); 
  background (255);
}

void draw()
{
   if (frameCount % 300 == 0) 
   {background(255);}
  drawGaussianthing();
}

void drawGaussianthing()
{
  
  float xStandardDeviation = 200;
  float xMean = 0;
  
  float scaleStandardDeviation = 30;
  float scaleMean = 50;
  
  float strokeStandardDeviation = 1;
  float strokeMean = 2;
  
  float x = xStandardDeviation * randomGaussian() + xMean;
  float scale = abs(scaleStandardDeviation * randomGaussian() + scaleMean);
  float stroke = abs(strokeStandardDeviation * randomGaussian() + strokeMean);
  float y = -height/2 + random(height); 
  

  color randomColor = color(int(random(256)),int(random(256)),int(random(256)),int(random(10,101)));
  fill (randomColor);
  stroke(randomColor);
  strokeWeight(stroke);
  circle(x, y ,scale);
}
