//будут новые кнопки, рисунки разные, изменения будут
void buttonDraw(int ID, float s, float x, float y)
{
  if (ID==0)
  {
    noStroke();
    fill(gC);
    rect( x - s/2, y-s/2, s, s );
    stroke(bC);
    strokeWeight(sw/60);
    float rs=s/3.5;
    if(mAnim==0)
    {
      line(x-rs,y,x+rs,y);
      line(x-rs,y-rs,x+rs,y-rs);
      line(x-rs,y+rs,x+rs,y+rs);
    }
    else if(mAnim==1)
    {
      line(x-rs,y,x+rs,y);
      line(x,y-rs,x+rs,y);
      line(x,y+rs,x+rs,y);
    }
    else
    {
      float nim;
      float an=1-mAnim;
      if (Menu)
      {
        nim=-mAnim*PI+PI;
      }
      else
      {
        nim=mAnim*PI+PI;
      }
      line(sin(nim+PI/2)*rs+x,cos(nim+PI/2)*rs+y,sin(nim-PI/2)*rs+x,cos(nim-PI/2)*rs+y);
      float pitX=sin(nim+PI)*rs;
      float pitY=cos(nim+PI)*rs;
      line(sin(nim+PI/2)*rs+pitX*an+x,cos(nim+PI/2)*rs+pitY*an+y,sin(nim-PI/2)*rs*an+pitX+x,cos(nim-PI/2)*rs*an+pitY+y);
      line(sin(nim+PI/2)*rs-pitX*an+x,cos(nim+PI/2)*rs-pitY*an+y,sin(nim-PI/2)*rs*an-pitX+x,cos(nim-PI/2)*rs*an-pitY+y);
    }
  }
  else if (ID==1)//darkTheme button
  {
    if (darkTheme)
    {
      noStroke();
      fill(255);
      rect( x - s/2, y-s/2, s, s );
      strokeWeight(1);
      stroke(0);
      ellipse(x, y, s/2, s/2);
      strokeWeight(sw/100);
      for (float i=0; i<2*PI; i=i+PI/4)
      {
        line(x+sin(i)*(s/3.2), y+cos(i)*(s/3.2), x+sin(i)*(s/2.2), y+cos(i)*(s/2.2));
      }
      strokeWeight(sw/155);
      stroke(255);
      for (float i=0; i<2*PI; i=i+PI/4)
      {
        line(x+sin(i)*(s/3.2), y+cos(i)*(s/3.2), x+sin(i)*(s/2.2), y+cos(i)*(s/2.2));
      }
    }
    else
    {
      noStroke();
      fill(0);
      rect( x - s/2, y-s/2, s, s );
      fill(255);
      ellipse(x, y, s/1.2, s/1.2);
      fill(0);
      ellipse(x+s/6, y, s/1.6, s/1.6);
    }
  }
  else if (ID==2)
  {
    noStroke();
    fill(gC);
    rect( x - s/2, y-s/2, s, s );
    fill(bC);
    triangle(x + s/3, y, x - s/3, y-s/3, x - s/3, y+s/3);
  } else if (ID==3)
  {
    noStroke();
    fill(gC);
    rect( x - s/2, y-s/2, s, s );
    fill(bC);
    triangle(x - s/3, y, x + s/3, y-s/3, x + s/3, y+s/3);
  }
  else if(ID==4)
  {
    int drr;
    if(form)
    {
      drr=gC;
    }
    else
    {
      drr=127;
    }
    noStroke();
    fill(drr);
    textSize(s/1.5);
    rect( x - s/2, y-s/2, s, s );
    fill(bC);
    text("F=",x-s/2.3,y+s/4.5);
  }
}
