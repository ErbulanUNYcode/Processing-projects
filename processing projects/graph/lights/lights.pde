float x, y, sx, sy;
PImage screen;
void setup()
{
  size(600, 600);
  screen=new PImage(width, height);
  for (int i=0; i<width; i++)
  {
    for (int j=0; j<height; j++)
    {
      screen.set(i, j, color(0));
    }
  }
  thread("darker");
  x=random(width);
  y=random(height);
  float a=random(PI*2);
  sx=sin(a)*0.5;
  sy=cos(a)*0.5;
}

void draw()
{
  for (int i=0; i<25; i++)
  {
    if (mousePressed)
    {
      x+=(mouseX-x)/(25-i);
      y+=(mouseY-y)/(25-i);
    } else
    {
      x+=sx;
      y+=sy;
      if (x<0 || x>width)
        sx*=-1;
      if (y<0 || y>height)
      {
        if (y>height)
          y=height*2-y;
        sy*=-1;
      }
      sy+=0.0015;
    }
    lighter(x, y);
  }
  image(screen, 0, 0);
}

void mouseReleased()
{
  float a=random(PI*2);
  sx=sin(a)*0.75;
  sy=cos(a)*0.75;
}

void lighter(float x, float y)
{
  for (float i=x-50; i<x+50; i++)
  {
    for (float j=y-50; j<y+50; j++)
    {
      if (int(i)>=0 && int(i)<width && int(j)>=0 && int(j)<height)
      {
        if (dist(int(i), int(j), x, y)<49 && red(screen.get(int(i), int(j)))<255)
        {
          screen.set(int(i), int(j), color(red(screen.get(int(i), int(j)))+50/(dist(int(i), int(j), x, y)/49*50)));
        }
      }
    }
  }
}

void darker()
{
  while (true)
  {
    for (int i=0; i<width; i++)
    {
      for (int j=0; j<height; j++)
      {
        screen.set(i, j, color(red(screen.get(i, j))-1));
      }
    }
  }
}
