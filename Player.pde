class Player extends Entity
{
  private boolean _keyLeft;
  private boolean _keyRight;
  private boolean _keyFly;
  private PVector _moveSpeed;
  private int     _flightStrength;
  public PVector pos;

  Player(float x, float y, PImage img, boolean isActive)
  {
    super(x, y, img, "Player", isActive);
    super.CreateBody(BodyType.DYNAMIC);
    _moveSpeed = new PVector(50, 0);

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
      if (key == 'd')
      {
        _keyRight = true;
      }
      if (key == 'a')
      {
        _keyLeft = true;
      }
      if (key == 'w')
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