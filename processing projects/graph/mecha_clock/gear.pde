void gear(float x,float y,int q,float m,float al,float r)
{
  gear(x,y,q,m,al);
  strokeWeight(1);
  ellipse(x,y,r*0.4,r*0.4);
  line(x,y-r*0.6,x,y-r*0.5);
  line(x,y+r*0.6,x,y+r*0.5);
  line(x,y-r*0.4,x,y+r*0.4);
  line(x-r*0.6,y,x-r*0.5,y);
  line(x+r*0.6,y,x+r*0.5,y);
  line(x-r*0.4,y,x+r*0.4,y);
}

void gear(float x,float y,int q,float m,float al)
{
  stroke(255);
  strokeWeight(1.5);
  float q1=PI*2/q;
  float minR=m*3*q/PI/2;
  float maxR=minR+m*2;
  float cR=(maxR+minR)/2;
  float a1=PI*2/q/3;
  float a2=1/(maxR/m/3)/5;
  float a3=(q1-a1-a2)/2;
  beginShape();
  for(float i=al;i<PI*2+al;i+=q1)
  {
    for(float j=0;j<=a1;j+=a1)
    {
      vertex(x+sin(i+j)*minR,y+cos(i+j)*minR);
    }
    float sin=x+sin(i+a1+a3/3)*cR;
    float cos=y+cos(i+a1+a3/3)*cR;
    bezierVertex(sin,cos,
                 sin,cos,
                 x+sin(i+a3+a1)*maxR,y+cos(i+a3+a1)*maxR);
    for(float j=0;j<=a2;j+=a2)
    {
      vertex(x+sin(i+j+a3+a1)*maxR,y+cos(i+j+a3+a1)*maxR);
    }
    sin=x+sin(i+q1-a3/3)*cR;
    cos=y+cos(i+q1-a3/3)*cR;
    bezierVertex(sin,cos,
                 sin,cos,
                 x+sin(i+q1)*minR,y+cos(i+q1)*minR);
  }
  endShape();
}
