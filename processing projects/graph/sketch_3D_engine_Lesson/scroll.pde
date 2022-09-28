//все идеально не трогать
class scroll
{
  scroll(boolean orient,float Width,float X,float Y,float data)
  {
    o=orient;
    w=Width;
    x=X;
    y=Y;
    d=data;
    drag=false;
  }
  
  void draw()
  {
    if(drag)
    {
      if(o)
      {
        if(mouseX<x-w/2)
        {
          d=0;
        }
        else if(mouseX>x+w/2)
        {
          d=10;
        }
        else
        {
          d=(mouseX-x)*10/w+5;
        }
      }
      else
      {
        if(mouseY<y-w/2)
        {
          d=10;
        }
        else if(mouseY>y+w/2)
        {
          d=0;
        }
        else
        {
          d=-(mouseY-y)*10/w+5;
        }
      }
    }
    scDraw(o,w,x,y,d);
  }
  
  void scSet(float Width,float X,float Y)
  {
    w=Width;
    x=X;
    y=Y;
  }
  
  void dragStart()
  {
    float size=sw/28;
    if(o)
    {
      float X=sin(atan2(mouseX-x-(d-5)*w/10,mouseY-y)+PI/4)*dist(mouseX,mouseY,x+(d-5)*w/10,y);
      float Y=cos(atan2(mouseX-x-(d-5)*w/10,mouseY-y)+PI/4)*dist(mouseX,mouseY,x+(d-5)*w/10,y);
      if(X<size && X>-size && Y<size && Y>-size)
      {
        drag=true;
      }
    }
    else
    {
      float X=sin(atan2(mouseX-x,mouseY-y-(5-d)*w/10)+PI/4)*dist(mouseX,mouseY,x,y+(5-d)*w/10);
      float Y=cos(atan2(mouseX-x,mouseY-y-(5-d)*w/10)+PI/4)*dist(mouseX,mouseY,x,y+(5-d)*w/10);
      if(X<size && X>-size && Y<size && Y>-size)
      {
        drag=true;
      }
    }
  }
  
  float get()
  {
    return d;
  }
  
  void dragStop()
  {
    drag=false;
  }
  
  private
  boolean o; //true horizont
  float w;
  float x;
  float y;
  float d;
  boolean drag;
};
