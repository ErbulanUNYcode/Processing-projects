button cup0=new button(10, "$10");
button cup1=new button(11, "$100");
button cup2=new button(12, "$500");
button cup3=new button(13, "$2000");
button cup4=new button(14, "$5000");
button cup5=new button(15, "$50000");

void shop()
{
  cloth();
  sbd();
  for (int i=0; i<6; i++)
  {
    noStroke();
    noFill();
    beginShape();
    texture(scl[i]);
    vertex(width-size/5-size/6, size/2.2-size/6+i*size/4, 0, 0);
    vertex(width-size/5+size/6, size/2.2-size/6+i*size/4, 1, 0);
    vertex(width-size/5+size/6, size/2.2+size/6+i*size/4, 1, 1);
    vertex(width-size/5-size/6, size/2.2+size/6+i*size/4, 0, 1);
    endShape();
  }
}

void look(float x, float y)
{
  noStroke();
  fill(50);
  rect(x-size/20, y, size/10, size/15);
  strokeWeight(size/50);
  stroke(50);
  noFill();
  arc(x, y, size/18, size/18, -PI, 0);
}

void cup()
{
  if (cL[bt-10]==false)
    if (coins>=ccn[bt-10])
    {
      cL[bt-10]=true;
      coins-=ccn[bt-10];
    }
}
