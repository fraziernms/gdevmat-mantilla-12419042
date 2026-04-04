public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public color col = color(255, 180);
 
  public Walker() {}
 
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
 
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
 
  public void render()
  {
    fill(this.col);
    noStroke();
    circle(this.position.x, this.position.y, this.scale);
  }
 
  public void checkEdges()
  {
    float r = this.scale / 2;
 
    if (this.position.x - r <= Window.left)
    {
      this.position.x = Window.left + r;
      this.velocity.x *= -1;
    }
    else if (this.position.x + r >= Window.right)
    {
      this.position.x = Window.right - r;
      this.velocity.x *= -1;
    }
 
    if (this.position.y - r <= Window.bottom)
    {
      this.position.y = Window.bottom + r;
      this.velocity.y *= -1;
    }
    else if (this.position.y + r >= Window.top)
    {
      this.position.y = Window.top - r;
      this.velocity.y *= -1;
    }
  }
}
