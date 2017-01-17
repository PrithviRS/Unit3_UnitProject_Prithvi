class Platform extends Entity
{
  
  Platform(float x, float y, PImage img, boolean isActive)
  {
    super(x, y, img, "playground", isActive);
    super.CreateBody(BodyType.STATIC);
  }
}