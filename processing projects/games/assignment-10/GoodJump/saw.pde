saw saw[]=new saw[100];
int saws;

class saw
{
  PImage img[]=new PImage[2];

  float
    x,
    y,
    sx,
    sy;

  int
    start=millis()+100;

  saw(int dir, int X, int Y)
  {
    img[0]=loadImage("data/images/saw0.png");
    img[1]=loadImage("data/images/saw1.png");
    x=X*50;
    y=Y*50;
    float s=100;
    switch(dir)
    {
    case 0:
      sy=s;
      break;
    case 1:
      sx=s;
    }
  }

  void draw()
  {
    int a=0;
    if (millis()%500<250)
      a=1;

    image(img[a], x-playerX+width/2, y-playerY+height/2);
  }

  void update()
  {
    if (start<millis())
    {
      x+=sx/frameRate;
      y+=sy/frameRate;
      if (dist(x+25, y+25, playerX, playerY)<40)
      {
        if (gameState!=GAMEOVER)
        {
          playerVX=0;
          playerVY=0;
          lose.play();
          deTime=millis();
        }
        gameState=GAMEOVER;
      }
    }
    if (map.testTileInRect( x, y, 49.9, 49.9, "W" ))
    {
      start=millis()+500;
      sx*=-1;
      sy*=-1;
      x=round(x/50)*50;
      y=round(y/50)*50;
    }
  }
}
