import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList Cloud;
Box2DProcessing box2d;
float playerX;
float playerY;
Player p1;
Enemy E;
Platform platform1;
Platform platform2;
Platform platform3;
Platform platform4;
Platform platform5;
Platform platform6;
Platform platform7;

//Images
PImage playerImg;
PImage platform;
PImage enemyImg;
void setup()
{
  fullScreen(P3D);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -200);
  box2d.setContinuousPhysics(true);
  Cloud = new ArrayList();

  playerImg = loadImage("Stationary.png");
  platform = loadImage("playground.png");
  enemyImg = loadImage("Enemy.png");
  playerImg.resize(45, 90);
  p1 = new Player(width/2, 0, playerImg, true);
  E = new Enemy(0, 0, enemyImg, true);

  int w = platform.width;

  platform1 = new Platform(0, height, platform, true);
  platform2 = new Platform(w, height, platform, true);
  platform3 = new Platform(2*w, height, platform, true);
  platform4 = new Platform(3*w, height, platform, true);
  platform5 = new Platform(0, height/2, platform, true);
  platform6 = new Platform(width, height/2, platform, true);
}

void draw()
{
  background(200);

  box2d.step();

  for (int i=0; i < Cloud.size(); i++) 
  {
    Cloud d = (Cloud) Cloud.get(i);
    d.display();
    d.run();
    if (Cloud.size() > 6)
    {
      Cloud.remove(1);
    }
  }
  Cloud.add(new Cloud());
  p1.Draw();
  p1.Update();
  E.Draw();
  E.Update();
  
  platform1.Draw();
  platform2.Draw();
  platform3.Draw();
  platform4.Draw();
  platform5.Draw();
  platform6.Draw();
}