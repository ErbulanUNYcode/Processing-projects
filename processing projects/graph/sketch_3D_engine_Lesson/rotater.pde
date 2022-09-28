float rtX(float x,float y,float r,boolean d)
{
  return sin(atan2(x,y)+r)*dist(0,0,x,y);
}

float rtY(float x,float y,float r,boolean d)
{
  return cos(atan2(x,y)+r)*dist(0,0,x,y);
}

float rtX(float x,float y,float r)
{
  return sin(atan2(x,y)+r);
}

float rtY(float x,float y,float r)
{
  return cos(atan2(x,y)+r);
}
