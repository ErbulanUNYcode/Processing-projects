float co=2;

void setup()
{
  size(512,512,P2D);
  noFill();
  background(0);
}

void draw()
{
 translate(width/2, height /2 );
 beginShape();
 hilb(0,0,128,4,1,1);
 endShape();
 noLoop();
}

void hilb(int x, int y, int d, int iter, int r, int l)
{
  int c[][]=
  {
    {-d*l+x,d*l+y},
    {-d*r+x,-d*r+y},
    {d*l+x,-d*l+y},
    {d*r+x,d*r+y}
  };
  if(iter==0)
  {
    co-=0.00003;
    stroke(sin(co)*177+177,sin(co+PI/3*2)*177+177,sin(co-PI/3*2)*177+177);
    vertex(x,y);
  }
  else
  {
    hilb(c[0][0],c[0][1],d/2,iter-1,-r,l);
    hilb(c[1][0],c[1][1],d/2,iter-1,r,l);
    hilb(c[2][0],c[2][1],d/2,iter-1,r,l);
    hilb(c[3][0],c[3][1],d/2,iter-1,r,-l);
  }
}
