planet p[];
float rad=10000;
class planet
{
  float
    x,
    y,
    z,
    sx,
    sy,
    sz,
    m=random(1,1000),
    M=map(m,1,1000,0,PI);
  planet()
  {
    if(random(1000)<1){
       //m=100000000;
       //M=PI/2*3;
    }
    
    float x1=random(-rad, rad);
    float y1=random(-rad, rad);
    float z1=random(-rad, rad);
    while (mag(x1, y1,z1)>rad)
    {
      x1=random(-rad, rad);
      y1=random(-rad, rad);
      z1=random(-rad, rad);
    }
    x=x1;
    y=y1;
    z=z1/2;
    sx=sin(atan2(x,y)-PI/2)*sq(mag(x,y))/100000;
    sy=cos(atan2(x,y)-PI/2)*sq(mag(x,y))/100000;
  }
  void updateS(float ax, float ay,float az)
  {
    sx-=ax;
    sy-=ay;
    sz-=az;
  }

  void update()
  {
    x+=sx;
    y+=sy;
    z+=sz;
  }

  void draw()
  {
    float d=dist(cx,cy,cz,x,y,z);
    fill(cos(M+PI)*177+177,0,cos(M)*177+177);
    if(cIf(x,y,z))
    if(m<1000)
    rect(cX,cY,50000/d,50000/d);
    else
    ellipse(cX,cY,250000/d,250000/d);
  }
}
