//вся управление мышкой

//вызов скроллеров распределенно по урокам
void mousePressed()
{
  if(tb())
  {
    Menu=false;
    if(mode==1)
    {
      scrollDragStartL1();
    }
  }
  
  //проверка на простое нажатие
  pressMil=millis();
  pressX=mouseX;
  pressY=mouseY;
}


//если простое нажатие вызываются кнопки
void mousePress()
{
  //вызов всех кнопок
  allPressed();
  
  //проверка на нажатие кнопок принадлежащие меню
  if(btClick!=0 && btClick!=1 && btClick!=2 && btClick!=3 && btClick!=4)
  //если мимо закрыть меню
  Menu = false;
  
  //проверка каждой кнопки
  if(btClick==1)//dark theme
  {
    btClick=-1;
    if(darkTheme)
    {
      darkTheme=false;
    }
    else
    {
      darkTheme=true;
    }
  }
  else if(btClick==0)//menu
  {
    btClick=-1;
    if(Menu)
    {
      Menu = false;
    }
      else
    {
      Menu = true;
    }
  }
  else if(btClick==2)//lesson down
  {
    btClick=-1;
    if(mode<2)
      mode++;
  }
  else if(btClick==3)//lesson up
  {
    btClick=-1;
    if(mode>1)
      mode--;
  }
  else if(btClick==4)
  {
    btClick=-1;
    if(form)
    {
      form=false;
    }
    else
    {
      form=true;
    }
  }
  else
  {
    Menu = false;
  }
  if(mode==1)
  {
    form=false;
  }
}


void mouseReleased()
{
  //надо нажать не двигая долеко и не зажав дольше 0,4 секунд иначе это не считается за касание
  if(dist(mouseX,mouseY,pressX,pressY)<ss/40 && pressMil+400>millis())
  {
    mousePress();
  }
  if(mode==1)
  {
    scrollDraggStopL1();
  }
}
