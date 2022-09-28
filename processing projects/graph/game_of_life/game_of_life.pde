void setup()
{
  fullScreen();
  textureMode(NORMAL);
  dx=int(width-height*0.2);
  dy=height;
  restart();
  Pon[3]=true;
  Ppause[2]=true;
  player=new button(true, "pause", "play", dx+(width-dx)/3/4, (width-dx)/3/4, (width-dx)/3, 1);
  restart=new button(true, "restart", "restart", dx+(width-dx)/3/4+height/10, (width-dx)/3/4, (width-dx)/3, 2);
  for (int i=0; i<9; i++)
  {
    Pons[i]=new button(Pon[i], "Pon_on", "Pon_off", dx+(width-dx)/3/4, map(i,0,9,height*0.15,height*0.85), (width-dx)/3, 10+i);
    Ppauses[i]=new button(Ppause[i], "Ppause_on", "Ppause_off", dx+(width-dx)/3/4+height/10, map(i,0,9,height*0.15,height*0.85), (width-dx)/3, 20+i);
  }
  noSmooth();
}

void draw()
{
  background(50);
  stroke(255);
  strokeWeight(2);
  line(dx, height/10, width, height/10);
  image(screen, -mouseX*(zoom-1)-zoom/2, -mouseY*(zoom-1)-zoom/2, dx*zoom, dy*zoom);
  player.draw();
  restart.draw();
  for (int i=0; i<9; i++)
  {
    Pons[i].draw();
    Ppauses[i].draw();
    text(i,Pons[i].x,Pons[i].y);
    text(i,Ppauses[i].x,Ppauses[i].y);
  }
  if (play)
  {
    boolean p[][]=new boolean[dx+2][dy+2];
    for (int i=1; i<dx+1; i++)
    {
      for (int j=1; j<dy+1; j++)
      {
        int life=0;
        for (int k=-1; k<2; k++)
        {
          for (int l=-1; l<2; l++)
          {
            if (pro[i+k][j+l] && !(k==0 && l==0))
            {
              life++;
            }
          }
        }
        if (Pon[life])
        {
          p[i][j]=true;
        }//
        else if (Ppause[life])
        {
          p[i][j]=pro[i][j];
        }//
        else
        {
          p[i][j]=false;
        }
      }
    }
    pro=p;
  }
  for (int i=0; i<dx; i++)
  {
    for (int j=0; j<dy; j++)
    {
      color c;
      if (pro[i+1][j+1])
        c=color(255);
      else
        c=color(0);
      screen.set(i, j, c);
    }
  }
  if (!wood)
  {
    for (int i=0; i<dx; i++)
    {
      pro[i+1][0]=pro[i+1][dy];
      pro[i+1][dy+1]=pro[i+1][1];
    }
    for (int i=0; i<dy; i++)
    {
      pro[0][i+1]=pro[dx][i+1];
      pro[dx+1][i+1]=pro[1][i+1];
    }
    pro[0][0]=pro[dx][dy];
    pro[0][dy+1]=pro[dx][1];
    pro[dx+1][0]=pro[1][dy];
    pro[dx+1][dy+1]=pro[1][1];
  }
}
