//скоро добавятся кнопки не принадлежащие меню
class button
{
  button(int ident,float size,float X,float Y)
  {
    ID = ident;
    s = size;
    x = X;
    y = Y;
  }
  void setC(float size,float X,float Y)
  {
    s = size;
    x = X;
    y = Y;
  }
  void draw()//рисовка кнопки
  {
    buttonDraw(ID,s,x,y);
    if(Menu && mAnim<1)
    {
      if(mAnim<0.995)
      {
        mAnim+=(1-mAnim)/10;
      }
      else
      {
        mAnim=1;
      }
    }
    else if(!Menu && mAnim>0)
    {
      if(mAnim>0.005)
      {
        mAnim-=mAnim/10;
      }
      else
      {
        mAnim=0;
      }
    }
  }
  
  boolean test()
  {
    if( mouseX >= x - s/2 && mouseX < x + s/2 && mouseY >= y-s/2 && mouseY < y + s/2 )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void pressed()
  {
    if( mouseX >= x - s/2 && mouseX < x + s/2 && mouseY >= y-s/2 && mouseY < y + s/2 )
    {
      if(ID==0)//меню
      {
      btClick=0;
      }
      else if(Menu)
      {
        if(ID==1)
        {
          btClick=1;
        }
        else if(ID==2)
        {
          btClick=2;
        }
        else if(ID==3)
        {
          btClick=3;
        }
        else if(ID==4)
        {
          btClick=4;
        }
      }
    }
  }
private
  int ID;
  float s;
  float x;
  float y;
}
