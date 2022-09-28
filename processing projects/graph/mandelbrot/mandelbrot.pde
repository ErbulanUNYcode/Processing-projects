float zoom=100, x=0, y=0, m;
float opt[]=new float[2];
PImage screen;

void setup()
{
  //fullScreen();
  size(700, 700);
  m=min(width, height);
  screen=new PImage(width, height);
  for (int i=0; i<4; i++)
  {
    for (int j=0; j<4; j++)
    {
      opt[0]=i;
      opt[1]=j;
      thread("opt"+i+""+j);
    }
  }
}

void opt(int opt[])
{
  float w[]=new float[2];
  float c[]=new float[2];
  int o[]=opt;
  while (true)
  {
    for (float i=o[0]; i<width; i+=4)
    {
      for (float j=o[1]; j<height; j+=4)
      {
        float a;
        if (mousePressed)
        {
          w[0]=map(mouseX, (width-m)/2, (width-m)/2+m, -2, 2);
          w[1]=map(mouseY, (height-m)/2, (height-m)/2+m, -2, 2);
          c[0]=map(i, (width-m)/2, (width-m)/2+m, -2, 2);
          c[1]=map(j, (height-m)/2, (height-m)/2+m, -2, 2);
          a=form(c, w, 1);
        } else
        {
          w[0]=0;
          w[1]=0;
          c[0]=map(i, (width-m)/2, (width-m)/2+m, -2, 2);
          c[1]=map(j, (height-m)/2, (height-m)/2+m, -2, 2);
          a=form(w, c, 1);
        }
        color col;
        if (a<zoom)
        {
          a=a/3;
          col=color(sin(a)*177+177, sin(a+PI/3*2)*177+177, sin(a-PI/3*2)*177+177);
        }//
        else
        {
          col=color(0);
        }
        screen.set(int(i), int(j), col);
      }
    }
    //break;
  }
}

void draw()
{
  image(screen, 0, 0, width, height);
}

int form(float w[], float c[], int iter)
{
  float d=dist(w[0], w[1], 0, 0);
  if (d<3 && iter<zoom)
  {
    float a=atan2(w[0], w[1])*2;
    d*=d;
    w[0]=sin(a)*d+c[0];
    w[1]=cos(a)*d+c[1];
    return form(w, c, iter+1);
  }//
  else
  {
    return iter;
  }
}
