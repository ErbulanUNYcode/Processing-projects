void pass_win()
{
  background(255,216,0);
//  image(test, 0,0);
  pass_stat();
  
  pbDraw();
  //textFont(montserrat_medium);
  textSize(sz*3.2);
  text("Fingerprint или код доступа",xc, yc-sz*66.2);
  fill(138,116,0);
  textAlign(LEFT);
  text("Забыли код доступа?",sz*5, height-sz*9.3);
  textAlign(CENTER, CENTER) ;
}

void pass_stat()
{
  if(fpAni>0)
  {
    if(fakePass[3]==0)
    {
      fpAni=0;
      window=2;
    }
    fpAni-=PI/1.5;
    if(fpAni<0)
    {
      fpAni=0;
      pass_weight=0;
    }
  }else if(pass_weight!=0&&fpAni<0)
  {
    pass_weight=0;
  }
  
  stroke(0 );
  strokeWeight(sz/2);
  float dis=sz*9.4;
  float rad=sz*3.7;
  for(int i=0;i<4;i++)
  {
    if(pass_weight<=i)
    {
      noFill();
    }//
    else
    {
      fill(0);
    }
    ellipse(xc+i*dis-dis*1.5+sin(fpAni)*sz*3, yc-sz*51.5,rad,rad);
  }
}