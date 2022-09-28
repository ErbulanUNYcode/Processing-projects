thorn thorn[]=new thorn[100];
int thorns;

class thorn
{
  PImage img;

  float
    x,
    y,
    sx,
    sy;

  int
    startX,
    startY,
    start=millis()+1000;

  thorn(int dir, int X, int Y)
  {
    img=loadImage("data/images/thorn"+dir+".png");
    startX=X;
    startY=Y;
    float s=300;
    switch(dir)
    {
    case 0:
      sy=s;
      break;
    case 1:
      sy=-s;
      break;
    case 2:
      sx=-s;
      break;
    case 3:
      sx=s;
    }
  }

  void draw()
  {
    if (start<millis())
      image(img, x-playerX+width/2, y-playerY+height/2);
  }

  void update()
  {
    if (start<millis())
    {
      if (!map.testTileInRect( x+30, y+30, -5, -5, "W" ))
      {
        x+=sx/frameRate;
        y+=sy/frameRate;
        if (dist(x+25, y+25, playerX, playerY)<25)
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
      }//
      else
      {
        x=startX*50;
        y=startY*50;
        start=millis()+1000;
      }
    }
  }
}

float dist(float a, float b)
{
  return max(a, b)-min(a, b);
}
