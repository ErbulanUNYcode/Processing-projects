size(512,256);
PImage i=loadImage("i.jpg");
background(177,176,176);
noStroke();
fill(0);
rect(0,0,176,136);
float
p=128f/80,
w=min(float(i.width),float(i.height)/p),
h=min(float(i.width)*p,float(i.height));
image(i.get(int(i.width-w)/2,int(i.height-h)/2,int(w),int(h)),7,7,80,128);
saveFrame("data/g.png");
