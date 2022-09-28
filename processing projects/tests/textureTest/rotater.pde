float rtX(float x,float y,float r)
{
  return sin(atan2(x,y)+r)*dist(x,y,0,0);
}

float rtY(float x,float y,float r)
{
  return cos(atan2(x,y)+r)*dist(x,y,0,0);
}
