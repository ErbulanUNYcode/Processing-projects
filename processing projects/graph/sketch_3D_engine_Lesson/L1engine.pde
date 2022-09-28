void L1engine()
{
  camX=sin((5-l1cam.get())/5*PI+PI)*10;
  camY=cos((5-l1cam.get())/5*PI+PI)*10;
  camRx=-(5-l1cam.get())/5*PI+PI;
  camZ=5.5;
  camRy=-0.5;
  //точки клеточной визуализации координат
  float vdp[][]=new float[80][3];
  
  for(int i=0;i<21;i++)
  {
    vdp[i][0]=i-10;
    vdp[i][1]=-10;
    vdp[i][2]=0;
    vdp[i+21][0]=i-10;
    vdp[i+21][1]=10;
    vdp[i+21][2]=0;
  }
  for(int i=0;i<19;i++)
  {
    vdp[i+42][0]=-10;
    vdp[i+42][1]=i-9;
    vdp[i+42][2]=0;
    vdp[i+61][0]=10;
    vdp[i+61][1]=i-9;
    vdp[i+61][2]=0;
  }
  
  //линии клеточной визуализации координат
  int dl[][]=new int[42][2];
  
  for(int i=0;i<21;i++)
  {
    dl[i][0]=i;
    dl[i][1]=i+21;
  }
  
  for(int i=0;i<19;i++)
  {
    dl[i+21][0]=i+42;
    dl[i+21][1]=i+61;
  }
  
  dl[40][0]=0;
  dl[40][1]=20;
  dl[41][0]=21;
  dl[41][1]=41;
  
  //импорт координат управлямеой точки
  float px=l1px.get()-5;
  float py=l1py.get()-5;
  float pz=l1pz.get()-5;
  
  //точки визуализации координат управляемой точки
  float L1pv[][]={
                 { 0,py, 0},
                 {px,py, 0},
                 {px, 0, 0},
                 { 0, 0,pz},
                 { 0,py,pz},
                 {px,py,pz},
                 {px, 0,pz}
                 };
  
  //линии визуализации координат управляемой точки
  int L1l[][]={
              {0,1},
              {1,2},
              {3,4},
              {4,5},
              {5,6},
              {6,3},
              {0,4},
              {1,5},
              {2,6},
              };
  
  if(pz<0)
  {
    stroke(255,0,255,150);
    strokeWeight(1);
    for(int i=0;i<9;i++)
    line(cameX(L1pv[L1l[i][0]])+xV,cameY(L1pv[L1l[i][0]])+yV,cameX(L1pv[L1l[i][1]])+xV,cameY(L1pv[L1l[i][1]])+yV);
    fill(0);
    stroke(255);
    strokeWeight(1);
    ellipse(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),300/dist(px,py,pz,camX,camY,camZ),300/dist(px,py,pz,camX,camY,camZ));
    fill(255);
    noStroke();
    ellipse(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),220/dist(px,py,pz,camX,camY,camZ),220/dist(px,py,pz,camX,camY,camZ));
    fill(0);
    ellipse(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),120/dist(px,py,pz,camX,camY,camZ),240/dist(px,py,pz,camX,camY,camZ));
    arc(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),240/dist(px,py,pz,camX,camY,camZ),240/dist(px,py,pz,camX,camY,camZ),-PI/2,3);
  }
  
  stroke(177);
  strokeWeight(1);
  for(int i=0;i<42;i++)
  line(cameX(vdp[dl[i][0]])+xV,cameY(vdp[dl[i][0]])+yV,cameX(vdp[dl[i][1]])+xV,cameY(vdp[dl[i][1]])+yV);
  
  //red X
  strokeWeight(ss/200);
  stroke(255,0,0);
  float zero[]={0,0,0};
  float xyz[]={3,0,0};
  line(cameX(zero)+xV,cameY(zero)+yV,cameX(xyz)+xV,cameY(xyz)+yV);
  
  //green Y
  stroke(0,255,0);
  xyz[0]=0;
  xyz[1]=3;
  line(cameX(zero)+xV,cameY(zero)+yV,cameX(xyz)+xV,cameY(xyz)+yV);
  
  //blue Z
  strokeWeight(ss/200);
  stroke(0,0,255);
  xyz[1]=0;
  xyz[2]=3;
  line(cameX(zero)+xV,cameY(zero)+yV,cameX(xyz)+xV,cameY(xyz)+yV);
  
  if(pz>=0)
  {
    stroke(255,0,255,150);
    strokeWeight(1);
    for(int i=0;i<9;i++)
    line(cameX(L1pv[L1l[i][0]])+xV,cameY(L1pv[L1l[i][0]])+yV,cameX(L1pv[L1l[i][1]])+xV,cameY(L1pv[L1l[i][1]])+yV);
    fill(0);
    stroke(255);
    strokeWeight(1);
    ellipse(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),300/dist(px,py,pz,camX,camY,camZ),300/dist(px,py,pz,camX,camY,camZ));
    fill(255);
    noStroke();
    ellipse(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),220/dist(px,py,pz,camX,camY,camZ),220/dist(px,py,pz,camX,camY,camZ));
    fill(0);
    ellipse(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),120/dist(px,py,pz,camX,camY,camZ),240/dist(px,py,pz,camX,camY,camZ));
    arc(xV+cameX(L1pv[5]),yV+cameY(L1pv[5]),240/dist(px,py,pz,camX,camY,camZ),240/dist(px,py,pz,camX,camY,camZ),-PI/2,3);
  }
  
  noStroke();
  fill(bC);
  rect(xS-sw/2,yS-sh/2,sw,sh);
}
