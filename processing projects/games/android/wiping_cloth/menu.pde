void menu()
{
  cloth();
  mbd();
  mcl();
  if (cL[clothGame]==false)
    look(xc+size/5, size/2);
}

void mcl()
{
  noStroke();
  noFill();
  beginShape();
  texture(cl[clothGame]);
  vertex(xc-size/5, size/15, 0, 0);
  vertex(xc+size/5, size/15, 1, 0);
  vertex(xc+size/5, size/1.5, 1, 1);
  vertex(xc-size/5, size/1.5, 0, 1);
  endShape();
}
