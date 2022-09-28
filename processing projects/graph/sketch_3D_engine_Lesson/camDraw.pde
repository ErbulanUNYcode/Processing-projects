void camDraw(float x,float y,float r)
{
  fill(bC);
  stroke(gC);
  strokeWeight(ss/350);
  float sis=ss/60;
  triangle(rtX(0,sis/2,-r,true)+x,rtY(0,sis/2,-r,true)+y,rtX(sis*0.8,-sis*0.8,-r,true)+x,rtY(sis*0.8,-sis*0.8,-r,true)+y,rtX(-sis*0.8,-sis*0.8,-r,true)+x,rtY(-sis*0.8,-sis*0.8,-r,true)+y);
  quad(rtX(-sis,0,-r,true)+x , rtY(-sis,0,-r,true)+y , rtX(sis,0,-r,true)+x , rtY(sis,0,-r,true)+y , rtX(sis,sis*2,-r,true)+x , rtY(sis,sis*2,-r,true)+y , rtX(-sis,sis*2,-r,true)+x , rtY(-sis,sis*2,-r,true)+y);
}
