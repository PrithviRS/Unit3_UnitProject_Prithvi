class Enemy extends Entity
{
  
  PImage _img;
  PVector _pos;
  PVector _velocity;
  PVector _acceleration;
  float _x, _y;
   private Body _body;
  Enemy(float x, float y, PImage img, boolean isActive)
  {
    super(x, y, img, "Player", isActive);
    _pos = new PVector(10, 10);
    _velocity = new PVector(0,0);

    super.CreateBody(BodyType.DYNAMIC);
    
  }
 

void Move()
{

}


  
  
}