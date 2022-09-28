float rtrA,rtrD;

float rX(float x,float y,float a)
{
  rtrD=dist(0,0,x,y);
  rtrA=a+atan2(x,y);
  return sin(rtrA)*rtrD;
}

float rY(float x,float y,float a)
{
  rtrD=dist(0,0,x,y);
  rtrA=a+atan2(x,y);
  return cos(rtrA)*rtrD;
}

float rX()
{
  return sin(rtrA)*rtrD;
}

float rY()
{
  return cos(rtrA)*rtrD;
}
