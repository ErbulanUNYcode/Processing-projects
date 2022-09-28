float[] rt(float i[],float rt)
{
  float a=atan2(i[0],i[1])+rt;
  float d=dist(0,0,i[0],i[1]);
  i[0]=sin(a)*d;
  i[1]=cos(a)*d;
  return i;
}