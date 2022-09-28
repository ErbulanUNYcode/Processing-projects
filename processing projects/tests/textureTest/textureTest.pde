PImage i;
float x,y,a,b;
float p[][]=new float[4][2];
float q[][]={
             {0,0},
             {1,0},
             {1,1},
             {0,1}
             };

boolean play=true;

void setup()
{
  fullScreen(P2D);
  textureMode(NORMAL);
  i=loadImage("a.PNG");
  x=width/2;
  y=height/2;
  strokeWeight(5);
  p[0][0]=-y/2;
  p[0][1]=-y/2;
  p[1][0]=y/2;
  p[1][1]=-y/2;
  p[2][0]=y/2;
  p[2][1]=y/2;
  p[3][0]=-y/2;
  p[3][1]=y/2;
}

void draw()
{
  background(0,255,0);
  a=float(mouseX)/150;
  b=mouseY-y;
  stroke(0,0,255);
  line(sin(a+PI/2)*300+x+sin(a)*(b-6),cos(a+PI/2)*300+y+cos(a)*(b-6),sin(a-PI/2)*300+x+sin(a)*(b-6),cos(a-PI/2)*300+y+cos(a)*(b-6));
  stroke(255,0,0);
  line(sin(a+PI/2)*300+x+sin(a)*(b+6),cos(a+PI/2)*300+y+cos(a)*(b+6),sin(a-PI/2)*300+x+sin(a)*(b+6),cos(a-PI/2)*300+y+cos(a)*(b+6));
  noStroke();
  pcd(a,b,i);
  fill(0);
}

void mouseClicked()
{
  if(play)
  {
    play=false;
    noLoop();
  }
  else
  {
    play=true;
    loop();
  }
}
