
button st=new button(1, "начать");   //start
button sp=new button(2, "магазин");  //shop
button p=new button(3, "");          //pause
button g=new button(4, "продолжить");//resume
button m=new button(5, "в меню");    //save & next to menu
int clothGame=0;
button cc=new button(6, "");   //cloth cancel
button cn=new button(7, "");   //cloth next


class button
{
  button(int ID, String T)
  {
    id=ID;
    t=T;
  }
  void draw()
  {
    bDraw(x, y, w, t, id);
  }
  void set(float X, float Y, float W)
  {
    x=X;
    y=Y;
    w=W;
  }
  void touch()
  {
    if (mouseX>x-w-size/20 && mouseX<x+w+size/20 && mouseY>y-size/15-size/20 && mouseY<y+size/15+size/20)
      bt=id;
  }
  private
    int id;
  String t;
  float x;
  float y;
  float w;
};

//draws

void mbd()
{
  sp.draw();
  st.draw();
  cc.draw();
  cn.draw();
}

void sbd()
{
  m.draw();
  if (cL[0]==false)
    cup0.draw();
  if (cL[1]==false)
    cup1.draw();
  if (cL[2]==false)
    cup2.draw();
  if (cL[3]==false)
    cup3.draw();
  if (cL[4]==false)
    cup4.draw();
  if (cL[5]==false)
    cup5.draw();
}

void gbd()
{
  if (pause)
  {
    g.draw();
    m.draw();
  } else {
    p.draw();
  }
}

//sets

void bSet()
{
  st.set(xc, yc-size/8, size/1.9);
  sp.set(xc, yc+size/8, size/1.8);
  cc.set(xc-size/3, size/4, size/10);
  cn.set(xc+size/3, size/4, size/10);
  m.set(xc, size/5, size/2);
  cup0.set(size/6*2, size/2.2, size/2);
  cup1.set(size/6*2, size/2.2+size/4, size/2);
  cup2.set(size/6*2, size/2.2+size/4*2, size/2);
  cup3.set(size/6*2, size/2.2+size/4*3, size/2);
  cup4.set(size/6*2, size/2.2+size, size/2);
  cup5.set(size/6*2, size/2.2+size/4*5, size/2);
  p.set(size/6, size/6, size/8);
  g.set(xc, size/2, size);
}

void bTouch()
{
  switch(mode)
  {
  case 0:
    st.touch();
    sp.touch();
    cc.touch();
    cn.touch();
    break;
  case 1:
    m.touch();
    cup0.touch();
    cup1.touch();
    cup2.touch();
    cup3.touch();
    cup4.touch();
    cup5.touch();
    break;
  case 2:
    if (!pause)
      p.touch();
    else
    {
      m.touch();
      g.touch();
    }
  }

  switch(bt)
  {
  case 1:
    if (cL[clothGame])
    {
      cloX=xc;
      cloY=yc;
      slo[0][0]=xc;
      slo[0][1]=yc;
      for (int i=1; i<15; i++)
      {
        slo[i][0]=xc;
        slo[i][1]=yc+i*size/20;
      }
      dpr=millis()+int(random(150,400));
      dropstart=0;
      combo=clothGame+1;
      mode=2;
    }
    break;
  case 2:
    mode=1;
    break;
  case 3:
    pause=true;
    break;
  case 4:
    pause=false;
    break;
  case 5:
    mode=0;
    if (pause)
      pause=false;
    break;
  case 6:
    if (clothGame>0)
      clothGame--;
    break;
  case 7:
    if (clothGame<5)
      clothGame++;
    break;
  }
  if (bt>=10 && bt <=15)
    cup();
  if (bt!=0)
    writeData();
  bt=0;
}
