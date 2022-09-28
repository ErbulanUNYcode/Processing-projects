int xc, yc,min;
float f;
PImage g=new PImage(500, 500);
color c;
void setup() {
  fullScreen();
  xc=width/2;
  yc=height/2;
  min=min(width,height);
  background(255, 0, 0);
  noSmooth();
}

void draw() {
  for (int i=-250; i<250; i++) {
    for (int j=-250; j<250; j++) {
      //формула
      float a=atan2(i-(mouseX-xc)/3*2, j-(mouseY-yc)/3*2);
      float x=sin(a)*sq(mag(i-(float(mouseX)-xc)/3*2, j-(mouseY-yc)/3*2)+16)/1000+(mouseX-xc)/3*2;
      float y=cos(a)*sq(mag(i-(float(mouseX)-xc)/3*2, j-(mouseY-yc)/3*2)+16)/1000+(mouseY-yc)/3*2;
      if (round((abs(x+4))/7)%2-round((abs(y+4))/7)%2==0) {
        c=color(0);
      } else {
        c=color(50,150,50);
      }
      g.set(i+250, j+250, color(c));
    }
  }
  image(g, xc-min/2, yc-min/2, min, min);
}
