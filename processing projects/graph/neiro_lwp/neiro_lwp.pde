float points[][]=new float[35][2];
int ckl=0;
float crl[][]=new float[35][2];
float speed=1;
float als[]=new float[35];
int f=0;

void setup(){
  size(600,600);
  for(int i=0;i<216;i++)
  Dragged(i);
  frameRate(150);
}

void draw(){
  
  background(0);
  for(int i=0;i<34;i++)
  {
    for(int j=i+1;j<35;j++)
    {
      float dii=dist(points[i][0],points[i][1],points[j][0],points[j][1]) ;
      if(dii<100)
      {
        stroke((sin(als[j])+1)*177,(sin(als[j]+PI/3)+1)*177,(sin(als[j]+PI/3*2)+1)*177,80*(100-dii)/100);
        strokeWeight(5);
        line(points[i][0],points[i][1],points[j][0],points[j][1]);
        stroke((sin(als[j])+1)*177,(sin(als[j]+PI/3*4)+1)*177,(sin(als[j]+PI/3*2)+1)*177,(100-dii)/100*255);
        strokeWeight(1);
        line(points[i][0],points[i][1],points[j][0],points[j][1]);
      }
    }
  }
  for(int i=0;i<35;i++)
  {
    float xx=crl[i][0]*speed;
    float yy=crl[i][1]*speed;
    if(points[i][0]+xx<0 || points[i][0]+xx>width)
    crl[i][0]=-crl[i][0];
    xx=crl[i][0]*speed;
    if(points[i][1]+yy<0 || points[i][1]+yy>height)
    crl[i][1]=-crl[i][1];
    yy=crl[i][1]*speed;
    points[i][0]+=xx;
    points[i][1]+=yy;
  }
}

void Dragged(float i)
{
  if(f==6)
  {
    f=0;
    points[ckl][0]=mouseX;
    points[ckl][1]=mouseY;
    als[ckl]=random(PI*2);
    float Crl=random(i/100);
    crl[ckl][0]=sin(Crl);
    crl[ckl][1]=cos(Crl);
    ckl++;
    if(ckl==35)
    ckl=0;
  }
  f++;
}

void mouseDragged()
{
  if(f==6)
  {
    f=0;
    points[ckl][0]=mouseX;
    points[ckl][1]=mouseY;
    als[ckl]=random(PI*2);
    float Crl=random(PI*2);
    crl[ckl][0]=sin(Crl);
    crl[ckl][1]=cos(Crl);
    ckl++;
    if(ckl==35)
    ckl=0;
  }
  f++;
}
