int deTime;

void menuPlayer()
{
  int m=(millis()-deTime)%2000;
  int x=125, y=225;
  if (m>1000)
    image(menuPlayer[0], x, y);
  else
  {
    if (m<500)
      image(menuPlayer[1], x, y-sin(map(m, 0, 1000, 0, PI))*150);
    else
      image(menuPlayer[2], x, y-sin(map(m, 0, 1000, 0, PI))*150);
  }
  start.draw();
}
