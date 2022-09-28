import com.onlylemi.processing.android.capture.*;
AndroidSensor as;
float x, y, s, r, rd;
PGraphics world,w;
void setup() {
  fullScreen(P3D);
  as = new AndroidSensor(0);
  as.start();
  stroke(255,0,0);
  world=createGraphics(2000,2000);
  x=world.width;
  y=world.height;
  w=createGraphics(1000,500);
  imageMode(CENTER);
  background(0);
  world.beginDraw();
  world.background(0);
  world.endDraw();
}
void draw() {
  float[] v=as.getAccelerometerSensorValues();
  s=v[2];
  r+=v[1]/500*s;
  x+=sin(r)*s;
  y-=cos(r)*s;
  world.beginDraw();
  
  world.strokeWeight(10);
  world.stroke(255,0,0);
  world.fill(0,40);
  world.rectMode(CENTER);
  world.rect(world.width/2,world.height/2,world.width,world.height);
  
  
  world.strokeWeight(1);
  world.translate(x/2, y/2);
  world.rotate(r);
  
  world.fill(255);
  world.noStroke();
  world.rect(0, 0, 24, 74);
  
  world.endDraw();
  
  w.beginDraw();
  w.background(0);
  w.rectMode(CENTER);
  w.translate(w.width/2,w.height/2);
  w.rotate(-r);
  w.image(world,-x,-y,world.width*2,world.height*2);
  w.rotate(r);
  w.fill(255);
  w.noStroke();
  w.rect(0, 0, 50, 150);
  w.stroke(0);
  w.fill(0, 255, 255);
  w.rect(0, -25, 40, 50);
  w.endDraw();
  
  
  image(world.get(),world.width/20,world.height/20,world.width/10,world.height/10);
  translate(width/2,height/3,-1000);
  rotateX(0.8);
  image(w,0,0,4000,2000);
}
