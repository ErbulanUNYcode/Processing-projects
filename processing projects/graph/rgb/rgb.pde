float xr, yr, xg, yg, xb, yb, xc, yc, a, d, pi, r, g, b;
PImage img;

void setup(){
  fullScreen();
  xc=width/2;
  yc=height/2;
}

void draw(){
  xr=mouseX/4;
  yr=mouseY/4;
  a=atan2(xr-xc/4, yr-yc/4);
  d=dist(xc/4,yc/4,xr,yr);
  pi=PI/3*2;
  xg=sin(a+pi)*d+xc/4;
  yg=cos(a+pi)*d+yc/4;
  xb=sin(a-pi)*d+xc/4;
  yb=cos(a-pi)*d+yc/4;
  img=new PImage(width/4, height/4);
  for(int i=0;i<width/4;i++)
  {
    for(int j=0;j<height/4;j++)
    {
      d=dist(i, j, xr, yr)*4;
      if(d<255)
      {
        r=255-(d);
      }
      else
      {
        r=0;
      }
      d=dist(i,j,xg,yg)*4;
      if(d<255)
      {
        g=255-(d);
      }
      else
      {
        g=0;
      }
      d=dist(i,j,xb,yb)*4;
      if(d<255)
      {
        b=255-(d);
      }
      else
      {
        b=0;
      }
      img.set(i,j,color(r,g,b));
    }
  }
  image(img,0,0,width, height);
}
