class Cloud
{
  private float x;
  private float y;
  private float xSpeed = random(-1, 1);
  private float size = 100;


  Cloud() 
  {
    x = random(width); 
    y = random(height); 

  }

  void run() 
  {
    x = x + xSpeed;

  }


  void display() 
  {
    strokeWeight(0.75);
    fill(200, 255, 255);
    ellipse(x, y, size, size);
  }

  void setSpeed()
  {
    xSpeed = random(-40, 40);
  }
}