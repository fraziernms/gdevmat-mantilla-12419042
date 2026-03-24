public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;

  Walker() 
  {
    this.position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    this.scale = random(5, 20);
  }

  public void update() 
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.velocityLimit);
    this.position.add(this.velocity);
  }

  public void render() 
  {
    fill(255);
    noStroke();
    circle(this.position.x, this.position.y, this.scale);
  }

  public void checkEdges() 
  {
    if (this.position.x > Window.right) 
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left) 
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
