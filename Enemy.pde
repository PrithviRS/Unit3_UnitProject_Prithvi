class Enemy
{
  
  
  PVector _pos;
  PVector _velocity;
  PVector _acceleration;
  
  Enemy()
  {
    _pos = new PVector(10, 10);
    _velocity = new PVector(0,0);
    
    
  }
  
  void Draw()
  {
    fill(0,0,0);
    ellipse(_pos.x, _pos.y, 50, 50);
  }
  


  void Move()
  {
    
    
    _velocity.add(_acceleration);

    _pos.add(_velocity);
  }
  void Update()
  {
    Move();
    Draw();
  }
  
}