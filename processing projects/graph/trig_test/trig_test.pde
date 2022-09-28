float a=0,r=50, X, Y, xz, yz;
boolean one=true;
boolean pause=false;
void setup() {
  size(600,600);
}
void draw(){
  if(one){
    X=width;
    Y=height;
    xz=X/2;
    yz=Y/2;
    one=false;
  }
  background(0);
  stroke(120);
  for(float al=0;al<2*PI+0.01;al+=0.01){
    stroke(120);
    line(cos(al)*r+xz, sin(al)*r+yz,cos(al+0.01)*r+xz, sin(al+0.01)*r+yz);
  }
  stroke(255);
  line(0,yz,X,yz);
  line(xz,0,xz,Y);
  a+=1;
  for(float x=-xz;x<xz;x++){
    stroke(255,0,0);
    line(x+xz,sin((x+a)/r*PI/4)*r+yz,x+xz+1,sin((x+a+1)/r*PI/4)*r+yz);
  }
  for(float y=-yz;y<yz;y++){
    stroke(0,0,255);
    line(cos((y+a)/r*PI/4)*r+xz,y+yz,cos((y+a+1)/r*PI/4)*r+xz,y+yz+1);
  }
  fill(0,255,0);
  ellipse(cos(a/r*PI/4)*r+xz, sin(a/r*PI/4)*r+yz,10, 10);
  stroke(255);
  line(xz-r,sin(a/r*PI/4)*r+yz,xz+r,sin(a/r*PI/4)*r+yz);
  line(cos(a/r*PI/4)*r+xz,yz-r,cos(a/r*PI/4)*r+xz,yz+r); 
  fill(0,0,255);
  ellipse(xz,sin(a/r*PI/4)*r+yz,10, 10);
  fill(255,0,0);
  ellipse(cos(a/r*PI/4)*r+xz,yz,10, 10);
}

void mousePressed()
{
  if( pause) 
  {
    pause =false ;
    loop() ;
  }
  else
  { 
    pause =true ;
    noLoop () ;
  }
}
