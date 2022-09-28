float cameX(float p[])
{
  float P[]=new float[3];
  P[0]=rtX(p[0]-camX,p[1]-camY,camRx,true);
  P[1]=rtY(p[0]-camX,p[1]-camY,camRx,true);
  P[2]=rtX(p[2]-camZ,P[1],camRy,true);
  P[1]=rtY(p[2]-camZ,P[1],camRy,true);
  if(P[1]<0)
  P[1]*=-1;
  return -P[0]/P[1]*sb;
}

float cameY(float p[])
{
  float P[]=new float[3];
  P[0]=rtX(p[0]-camX,p[1]-camY,camRx,true);
  P[1]=rtY(p[0]-camX,p[1]-camY,camRx,true);
  P[2]=rtX(p[2]-camZ,P[1],camRy,true);
  P[1]=rtY(p[2]-camZ,P[1],camRy,true);
  if(P[1]<0)
  P[1]*=-1;
  return -P[2]/P[1]*sb;
}
