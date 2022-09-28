void winDraw()
{
  bg();
  switch(win)
  {
  case 0:
    menu();
    break;
  case 1:
    sett();
    break;
  }
  
  if(animateNext<1)
  {
    if(animateNext==0)
    {
      saveFrame("1");
      sheet=loadImage("1.tif");
    }
    nextAnimate();
    animateNext+=float(frameTime)/800;
  }
  else
  {
    animateNext=1;
  }
}
