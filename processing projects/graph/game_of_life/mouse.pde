void mouseClicked()
{
  player.click();
  restart.click();
  for (int i=0; i<9; i++)
  {
    Pons[i].click();
    Ppauses[i].click();
  }
}

void mouseDragged()
{
  if (mouseX<dx)
  {
    if (mouseButton==LEFT)
    {
      pro[mouseX+1][mouseY+1]=true;
    }//
    else
    {
      pro[mouseX+1][mouseY+1]=false;
    }
  }//
}

void mousePressed()
{
  play=false;
  if (mouseX<dx)
  {
    if (mouseButton==LEFT)
    {
      pro[mouseX+1][mouseY+1]=true;
    }//
    else
    {
      pro[mouseX+1][mouseY+1]=false;
    }
  }//
}

void mouseReleased()
{
  if (!pause)
  {
    play=true;
  }
}

void mouseWheel(MouseEvent event) {
  if(event.getCount()==-1 && zoom<20)
  zoom++;
  if(event.getCount()==1 && zoom>1)
  zoom--;
}
