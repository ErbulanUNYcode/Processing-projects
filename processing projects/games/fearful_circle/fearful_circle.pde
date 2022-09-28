float x=0,y=0,mx,my;

void setup(){
  size(600,600);
}

void draw(){
  translate(300,300);
  background(0);
  mx=mouseX-300;
  my=mouseY-300;
  float x1=x+sin(atan2(sin(atan2(mx,my)+PI+5/dist(mx,my,x,y))*(200-mag(mx,my)/2)-x,cos(atan2(mx,my)+PI)*(200-mag(mx,my)/2)-y))*pow(dist(sin(atan2(mx,my)+PI)*(200-dist(mx,my,0,0)/2),cos(atan2(mx,my)+PI)*(200-mag(mx,my)/2),x,y)/200,0.5)*25;
          y+=cos(atan2(sin(atan2(mx,my)+PI+5/dist(mx,my,x,y))*(200-mag(mx,my)/2)-x,cos(atan2(mx,my)+PI)*(200-mag(mx,my)/2)-y))*pow(dist(sin(atan2(mx,my)+PI)*(200-dist(mx,my,0,0)/2),cos(atan2(mx,my)+PI)*(200-mag(mx,my)/2),x,y)/200,0.5)*25;
  x=x1;
  ellipse(x,y,30,30);
}

void mousePressed()
{
  if(dist(mouseX-300,mouseY-300,x,y)<15)
  noLoop();
}
