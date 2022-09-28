void setup(){
  sz=width/100;
  xc=width/2;
  yc=height/2;
  loadData();
  textAlign(CENTER, CENTER);
}

void draw(){
  background(#FF00DB);
  buttonsDraw();
  if(neww)
  {
    rd1=int(random(2,9.99));
    rd2=int(random(1,10.99));
    neww=false;
  }
  if(input==0)
  {
    text(rd1+"*"+rd2+"=",xc, yc/2);
  }
  else
  {
   text(rd1+"*"+rd2+"="+input,xc, yc/2); 
  }
  int tr=0;
  for(int i=0;i<next;i++)
  {
    if(tfl[i])
    tr++;
  }
  text(next+"/"+tr,xc,yc*0.85);
  strokeWeight(sz/2);
  for(int i=0;i<200;i++)
  {
    if(i<next)
    {
      if(tfl[i])
      {
        stroke(255);
      }
      else
      {
        stroke(0);
      }
    }
    else
    {
      stroke(#6F3974);
    }
    line(xc+sz*(i-100)/2.3,yc*0.6,xc+sz*(i-100)/2,yc*0.75);
  }
}