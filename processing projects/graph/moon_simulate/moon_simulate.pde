float
G=40000,
x=5500,
y=6000,
m=200,
sx=70,
sy=-60,
x1=500,
y1=0,
m1=2000,
sx1=-7,
sy1=5.999;
PGraphics sc;

void setup()
{
  size(600,600);
  noStroke();
  fill(0);
  rect(0,0,600,600);
  thread("darker");
  frameRate(100);
}

void draw()
{
  sc=createGraphics(width,height);
  sc.beginDraw();
  sc.noStroke();
  sc.translate(300,300);
  float d=pow(dist(x1,y1,x,y),3);
  sx-=G*m1*(x-x1)/d;
  sy-=G*m1*(y-y1)/d;
  sx1-=G*m*(x1-x)/d;
  sy1-=G*m*(y1-y)/d;
  x+=sx;
  y+=sy;
  x1+=sx1;
  y1+=sy1;
  sc.fill(200);
  sc.ellipse(x/30,y/30,5,5);
  sc.ellipse(x1/30,y1/30,50,50);
  sc.endDraw();
    image(sc, 0, 0);
}
