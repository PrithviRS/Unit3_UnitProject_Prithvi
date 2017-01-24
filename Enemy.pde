class Enemy extends Entity
{

  PImage _img;
  PVector _pos;
  PVector _velocity;
  PVector _acceleration;
  PVector v1;
  private boolean _keyLeft;
  private boolean _keyRight;
  private boolean _keyFly;
  private PVector _moveSpeed;
  float _x, _y;
  private Body _body;
  private int     _flightStrength;
  Enemy(float x, float y, PImage img, boolean isActive)
  {
    super(x, y, img, "Enemy", isActive);
    _pos = new PVector(10, 10);
    _velocity = new PVector(0, 0);
    _moveSpeed = new PVector(200, 0);
    super.CreateBody(BodyType.DYNAMIC);
    v1 = new PVector(0, 0);
    _flightStrength = 200;
  }

  public void Update()
  {
    KeyInputs();
    HandleMovement();
  }
  private void KeyInputs()
  {
     if (keyPressed)
    {
      if (key == 'l')
      {
        _keyRight = true;
      }
      if (key == 'j')
      {
        _keyLeft = true;
      }
      if (key == 'i')
      {
        _keyFly = true;
      }
    } else
    {
      _keyLeft  = false;
      _keyRight = false;
      _keyFly  = false;
    }
  }

  private void HandleMovement()
  {
    Vec2 currentVelocity = super._body.getLinearVelocity();



    if (_keyRight)
    {
      currentVelocity.x = 1 * _moveSpeed.x;
    } else if (_keyLeft)
    {
      currentVelocity.x = -1 * _moveSpeed.x;
    } else
    {
      currentVelocity.x = 0;
    }
    super._body.setLinearVelocity(currentVelocity);



    if (_keyFly == true)
    {
      super._body.applyLinearImpulse( new Vec2(0, _flightStrength), super.GetWorldCenter(), false);
    }
  }
}