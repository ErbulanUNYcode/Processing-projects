float 
rotaterA,
rotaterD;

float rX(float x,float y,float a)
{
  rotaterA=atan2(x,y)+a;
  rotaterD=mag(x,y);
  return sin(rotaterA)*rotaterD;
}

float rY(float x,float y,float a)
{
  rotaterA=atan2(x,y)+a;
  rotaterD=mag(x,y);
  return cos(rotaterA)*rotaterD;
}

float rX()
{
  return sin(rotaterA)*rotaterD;
}

float rY()
{
  return cos(rotaterA)*rotaterD;
}
