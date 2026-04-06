public class Liquid
{
  public float x, y;
  public float horizon, depth;
  public float cd;

  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }

  public boolean isCollidingWith(Walker w)
  {
    PVector pos = w.position;
    return pos.x > this.x - this.horizon &&
           pos.x < this.x + this.horizon &&
           pos.y < this.y;
  }

  public PVector calculateDragForce(Walker w)
  {
    float speed = w.velocity.mag();
    float dragMag = 0.5 * this.cd * speed * speed;
    PVector dragForce = w.velocity.copy();
    dragForce.normalize();
    dragForce.mult(-dragMag);
    return dragForce;
  }

  public void render()
  {
    noStroke();
    fill(28, 120, 186, 180);
    beginShape();
    vertex(this.x - this.horizon, this.y, 0);
    vertex(this.x + this.horizon, this.y, 0);
    vertex(this.x + this.horizon, this.y + this.depth, 0);
    vertex(this.x - this.horizon, this.y + this.depth, 0);
    endShape(CLOSE);
  }
}
