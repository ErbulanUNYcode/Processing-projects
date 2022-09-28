   float s, m, h, d1=0.6, d2=0.5, d3=0.4;
   int xc, yc, sz;
   String z;
   PFont font;
   color sc=color(255,0,0), mc=color(0,255,0), hc=color(0,0,255);
    void setup(){
      size(500,1000);
      xc=width/2;
      yc=height/2;
      sz=width/100;
      frameRate(1);
      font=createFont("font.ttf",100);
      textFont(font);
      textAlign(CENTER, CENTER);
      textSize(sz*8);
      strokeCap(SQUARE);
    }
    
    void draw(){
      background(0);
      s=PI/30*second();
      m=PI/30*minute();
      h=PI/6*hour();
      fracTree(width /2, height /2, s, width*0.30, sc);
      fracTree(width /2, height /2, m, width*0.25, mc);
      fracTree(width /2, height /2, h, width*0.20, hc);
      fill(255,0,0);
      if(second()<10)
      z="0";
      else
      z="";
      text(z+second(),xc+sz*14,yc-xc-sz*10);
      fill(0,255,0);
      if(minute()<10)
      z="0";
      else
      z="";
      text(z+minute(),xc,yc-xc-sz*10);
      fill(0,0,255);
      if(hour()<10)
      z="0";
      else
      z="";
      text(z+hour(),xc-sz*14,yc-xc-sz*10);
      fill(255);
      text(":",xc-sz*7,yc-xc-sz*10);
      text(":",xc+sz*7,yc-xc-sz*10);
      stroke(255);
      strokeWeight(sz*2);
      point(xc, yc);
      stroke(70);
      for(int i=0;i<12;i++)
      {
        if(i%3==0)
        {
          strokeWeight(sz*2);
        }
        else
        {
          strokeWeight(sz);
        }
        line(xc+sin(PI/6*i)*sz*35,yc+cos(PI/6*i)*sz*35,xc+sin(PI/6*i)*sz*40,yc+cos(PI/6*i)*sz*40);
      }
      fill(255,0,0,30);
      text("©AnthonyErik",xc,sz*30);
    }
    
    void fracTree(float x, float y, float a, float d, color c)
    {
      stroke(c,d/sz/30*180+57);
      strokeWeight(d/30+1);
      line(x, y, x+sin(a)*d,y-cos(a)*d); 
      if(d>4)
      {
        fracTree(x+sin(a)*d,y-cos(a)*d,a+s,d*d1, sc);
        fracTree(x+sin(a)*d,y-cos(a)*d,a+m,d*d2, mc);
        fracTree(x+sin(a)*d,y-cos(a)*d,a+h,d*d3, hc);
      }
    }
