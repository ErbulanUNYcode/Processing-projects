
int touchID=0;//Сигнал кнопок
boolean touching=false;

int touchAni=0;//общая анимация
boolean contTani=true;

void menuTouch()
{
  if (animateNext==1)
  {
    touchID=0;
    if (mousePressed)
    {
      if (!touching)
        touching=true;
      menuBtouch();
    }//
    else if (touching)
    {
      touching=false;
      menuBtouch();
      switch(touchID)
      {
      case 1:
        win=1;
        animateNext=0;
      }
    }
  }
}

void settTouch()
{
  if (animateNext==1)
  {
    touchID=0;
    if (mousePressed)
    {
      if (!touching)
        touching=true;
      down.touch();
    }//
    else if (touching)
    {
      touching=false;
      down.touch();
      switch(touchID)
      {
      case 2:
        dataSave();
        win=0;
        animateNext=0;
      }
    }
  }
}
