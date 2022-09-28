void bg()
{
  switch(book.get())
  {
  case 0:
    image(white, 0, 0);
    break;
  case 1:
    image(cell, 0, 0);
    break;
  case 2:
    image(str, 0, 0);
    break;
  case 3:
    image(cstr, 0, 0);
    break;
  case 4:
    image(ccstr, 0, 0);
  }
  if (redLine && book.get()!=0)
    stroke(255, 0, 0, 90);
  else
    noStroke();
  strokeWeight(sz/3);
  line(sz*84, 0, sz*84, height);
}

void nextAnimate()
{
  stroke(0,150);
  strokeWeight(sz/3);
  noFill();
  beginShape();
  texture(sheet);
  vertex(xc+rtX(-xc, -yc, animateNext/2)-animateNext*sz*150, yc+rtY(-xc, -yc, animateNext/2), 0, 0);
  vertex(xc+rtX(xc, -yc, animateNext/2)-animateNext*sz*150, yc+rtY(xc, -yc, animateNext/2), 1, 0);
  vertex(xc+rtX(xc, yc, animateNext/2)-animateNext*sz*150, yc+rtY(xc, yc, animateNext/2), 1, 1);
  vertex(xc+rtX(-xc, yc, animateNext/2)-animateNext*sz*150, yc+rtY(-xc, yc, animateNext/2), 0, 1);
  endShape();
}

float rtX(float x, float y, float a)
{
  return sin(atan2(x, y)+a)*dist(x, y, 0, 0);
}
float rtY(float x, float y, float a)
{
  return cos(atan2(x, y)+a)*dist(x, y, 0, 0);
}
