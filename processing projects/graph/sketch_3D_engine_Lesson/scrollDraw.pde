//все идеально не трогать
void scDraw(boolean o,float w,float x,float y,float d)
{
  float qs=ss/40;
  float dat=(d-5)*w/10;
  if(o)
  {
    strokeWeight(ss/40+2);
    stroke(bC);
    fill(bC);
    line(x-w/2,y,x+w/2,y);
    quad(x+qs+dat, y, x+dat, y+qs , x-qs+dat, y, x+dat, y-qs);
    strokeWeight(ss/40);
    stroke(gC);
    fill(gC);
    line(x-w/2,y,x+w/2,y);
    quad(x+qs+dat, y, x+dat, y+qs , x-qs+dat, y, x+dat, y-qs);
    strokeWeight(ss/60);
    stroke(bC);
    fill(gC);
    line(x-w/2,y,x+w/2,y);
    quad(x+qs+dat, y, x+dat, y+qs , x-qs+dat, y, x+dat, y-qs);
  }
  else
  {
    strokeWeight(ss/40+2);
    stroke(bC);
    fill(bC);
    line(x,y-w/2,x,y+w/2);
    quad(x+qs, y-dat, x, y+qs-dat , x-qs, y-dat, x, y-qs-dat);
    strokeWeight(ss/40);
    stroke(gC);
    fill(gC);
    line(x,y-w/2,x,y+w/2);
    quad(x+qs, y-dat, x, y+qs-dat , x-qs, y-dat, x, y-qs-dat);
    strokeWeight(ss/60);
    stroke(bC);
    fill(gC);
    line(x,y-w/2,x,y+w/2);
    quad(x+qs, y-dat, x, y+qs-dat , x-qs, y-dat, x, y-qs-dat);
  }
}
