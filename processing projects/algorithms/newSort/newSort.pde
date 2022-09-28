int r[];
int s[];
int len=200;
int m;
int g=0;
void setup()
{
  r=new int[len];
  s=new int[len];
  size(700, 700);
  for (int i=0; i<len; i++)
    r[i]=i;
  background(0);
}

void draw()
{
  int a, b, c;
  for (int i=0; i<100; i++)
  {
    a=int(random(len));
    b=int(random(len));
    c=r[b];
    r[b]=r[a];
    r[a]=c;
  }
  noStroke();
  fill(0);
  rect(0,0,300,50);
  arrayCopy(r,s);
  fill(255,0,0);
  m=millis();
  sort(s);
  m=millis()-m;
  text(m, 50, 30);
  rect(g,600-m*4,2,2);
  arrayCopy(r,s);
  fill(0,255,0);
  m=millis();
  Sort(s);
  //background(0);
  //for(int i=0;i<len;i++)
  //{
  //  text(s[i],300,20+i*15);
  //}
  m=millis()-m;
  text(m, 100, 30);
  rect(g,600-m*4+2,2,2);
  arrayCopy(r,s);
  fill(0,0,255);
  m=millis();
  Sort1(s);
  m=millis()-m;
  text(m, 150, 30);
  rect(g,600-m*4+4,2,2);
  g++;
  //noLoop();
}
