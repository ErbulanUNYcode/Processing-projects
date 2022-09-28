float
  cx,
  cy,
  cz,
  rx,
  ry,
  cd=10000,
  cX,
  cY;

boolean cIf(float x, float y, float z)
{
  x-=cx;
  y-=cy;
  z-=cz;
  float
    a=atan2(x, y)-rx,
    d=mag(x, y);
  x=sin(a)*d;
  y=cos(a)*d;
  a=atan2(y, z)-ry;
  d=mag(y, z);
  y=sin(a)*d;
  if (y<2000)
    return false;
  else
  {
    z=cos(a)*d;
    cX=z/y*200;
    cY=x/y*200;
    return true;
  }
}

void camCorrect()
{
  cd=mouseY*1000;
  ry=float(mouseX)/float(width)*PI*2;
  cz=sin(ry)*cd;
  cx=-sin(rx)*cos(ry)*cd;
  cy=-cos(rx)*cos(ry)*cd;
}
