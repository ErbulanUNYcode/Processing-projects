class button
{
  button(boolean Act, String On, String Off, float X, float Y, float S, int Id)
  {
    act=Act;
    on=loadImage(On+".png");
    off=loadImage(Off+".png");
    x=X;
    y=Y;
    s=S;
    id=Id;
  }

  void draw()
  {
    if (act)
      image(on, x, y, s, s);
    else
      image(off, x, y, s, s);
  }

  void click()
  {
    if (mouseX>x && mouseX<x+s && mouseY>y && mouseY<y+s)
    {
      act=!act;
      if (id>=10)
      {
        if (id>=20)
        {
          Ppause[id-20]=!Ppause[id-20];
          act=Ppause[id-20];
        }//
        else
        {
          Pon[id-10]=!Pon[id-10];
          act=Pon[id-10];
        }
      }//
      else
        switch(id)
      {
      case 1:
        pause=!act;
        play=act;
        break;
      case 2:
        restart();
      }
    }
  }

  float x, y, s;
  PImage on, off;
  boolean act;
  int id;
}
