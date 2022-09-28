sp sp[]=new sp[1000];
int f=0,p=0;

void setup()
{
  fullScreen();
}

void draw()
{
  if(f==60)
  {
    f=0;
    sp[p]=new sp();
    p++;
  }
  f++;
  translate(width/2, height/2);
  for(int i=0;i<p;i++)
  sp[i].draw();
}

class sp
{
  sp()
  {
    x=sin(ar+PI)*r;
    y=cos(ar+PI)*r;
    float a=random(PI*2);
    sx=sin(a)*s;
    sy=cos(a)*s;
    a=random(PI*2);
    c=color(sin(a)*177+177,sin(a+PI/3*2)*177+177,sin(a-PI/3*2)*177+177);
  }
  float
    ar=random(PI*2),
    as=random(-0.03,0.03),
    r=random(30, 100),
    s=random(0.2, 0.8),
    w=random(1, 5),
    x, y,
    sx,sy
    ;
    color c;
  void draw()
  {
    strokeWeight(w);
    stroke(c);
    beginShape();
    vertex(x+sin(ar)*r, y+cos(ar)*r);
    ar+=as;
    x+=sx;
    y+=sy;
    vertex(x+sin(ar)*r, y+cos(ar)*r);
    endShape();
    if(x<-width/2 || x>width/2)
    sx=-sx;
    if(y<-height/2 || y>height/2)
    sy=-sy;
  }
}
