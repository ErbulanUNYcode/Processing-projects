void L1win()
{
  float z = l1pz.get()-5;
  
  
  if(z<0)
  L1pointDraw();
  
  stroke(177);
  strokeWeight(1);
  for(int i=-10;i<=10;i++)
  line(ss/30*i+xS,ss/30*10+yS,ss/30*i+xS,ss/30*(-10)+yS);
  for(float i=-10;i<=10;i++)
  line(ss/30*10+xS,ss/30*i+yS,ss/30*(-10)+xS,ss/30*i+yS);
  
  strokeWeight(ss/200);
  stroke(255,0,0);
  line(xS,yS,xS+ss/10,yS);
  strokeWeight(ss/200);
  stroke(0,255,0);
  line(xS,yS,xS,yS-ss/10);
  
  if(z>=0)
  L1pointDraw();
  
  stroke(0,0,255);
  strokeWeight(ss/100);
  point(xS,yS);
  camDraw(camX*ss/31+xS,-camY*ss/31+yS,-camRx+PI);
  scrollDrawL1();
  
  textSize(ss/30);
  fill(255,0,0);
  text("X",sw/18-ss/96,height-sw/6.5);
  fill(0,255,0);
  text("Y",sw/6.8-ss/96,height-sw/6.5);
  fill(0,0,255);
  text("Z",sw/4.2-ss/96,height-sw/6.5);
  fill(gC);
  text("1.Представление координат", sw/35,sw/25);
}
