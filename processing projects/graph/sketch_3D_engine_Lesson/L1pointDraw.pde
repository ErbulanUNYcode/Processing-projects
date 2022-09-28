void L1pointDraw()
{
  float sis=ss/30;
  float x=(l1px.get()-5)*sis;
  float y=(-l1py.get()+5)*sis;
  float spo=l1pz.get()/25+float(ss)/2000;
  
  strokeWeight(1);
  stroke(255,0,255,200);
  line(xS,y+yS,x+xS,y+yS);
  line(x+xS,yS,x+xS,y+yS);
  
  strokeWeight(ss/40*spo+1);
  stroke(255);
  point(x+xS,y+yS);
  strokeWeight(ss/40*spo);
  stroke(0);
  point(x+xS,y+yS);
  strokeWeight(ss/55*spo);
  stroke(255);
  point(x+xS,y+yS);
  noStroke();
  fill(0);
  ellipse(x+xS,y+yS,ss/55*spo/1.6,ss/47*spo);
  arc(x+xS,y+yS,ss/51*spo,ss/40*spo,-PI/2,PI*0.9);
}
