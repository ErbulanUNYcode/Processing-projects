void mousePressed()
{
  if (mode==2 && dist(mouseX, mouseY, cloX, cloY)<size/10 && !pause)
    gs=true;
  bTouch();
}

void mouseReleased()
{
  gs=false;
}
