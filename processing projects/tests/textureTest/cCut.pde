float[] cCut(float[] p1,float[] p2)
{
  float Y1=rtY(p1[0],p1[1],-a);
  float Y2=rtY(p2[0],p2[1],-a);
  float md=(b-Y1)/(Y2-Y1);
  float[] rt={
    p1[0]+((p2[0]-p1[0])*md),
    p1[1]+((p2[1]-p1[1])*md),
    md
    };
  return rt;
}
