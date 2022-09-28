void pcd(float a,float b,PImage img)//polygon cut draw
{
  boolean ups[]=new boolean[4];
  for(int j=0;j<4;j++)
  {
    if(rtY(p[j][0],p[j][1],-a)<b)
    {
      ups[j]=true;
    }
    else
    {
      ups[j]=false;
    }
  }
  beginShape();
  texture(img);
  for(int j=5;j<9;j++)
  {
    if(ups[j%4])
    {
      vertex(p[j%4][0]+x,p[j%4][1]+y,q[j%4][0],q[j%4][1]);
    }
    else
    {
      float[] cutP=new float[2];
      if(ups[(j-1)%4])
      {
        cutP=cCut(p[(j-1)%4],p[j%4]);
        vertex(cutP[0]+x,cutP[1]+y,(q[j%4][0]-q[(j-1)%4][0])*cutP[2]+q[(j-1)%4][0],(q[j%4][1]-q[(j-1)%4][1])*cutP[2]+q[(j-1)%4][1]);
      }
      if(ups[(j+1)%4])
      {
        cutP=cCut(p[j%4],p[(j+1)%4]);
        vertex(cutP[0]+x,cutP[1]+y,(q[(j+1)%4][0]-q[j%4][0])*cutP[2]+q[j%4][0],(q[(j+1)%4][1]-q[j%4][1])*cutP[2]+q[j%4][1]);
      }
      
    }
  }
  endShape(CLOSE);
}
