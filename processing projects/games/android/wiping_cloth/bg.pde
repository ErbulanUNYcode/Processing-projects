void glass()
{
  noStroke();
  beginShape();
  fill(90, 170, 240);
  vertex(0, 0);
  fill(100, 200, 250);
  vertex(width, 0);
  fill(100, 200, 250);
  vertex(width, height);
  fill(100, 200, 250);
  vertex(0, height);
  endShape();
  stroke(105, 205, 253);
  for (float i=-size/11; i<size*1.5; i+=size/15)
  {
    strokeWeight((size*1.5-i)/32);
    line(-i/18, i, i, -i/18);
  }
}

void cloth()
{
  noStroke();
  beginShape();
  fill(240, 130, 225);
  vertex(0, 0);
  fill(255, 134, 233);
  vertex(width, 0);
  fill(255, 134, 233);
  vertex(width, height);
  fill(255, 134, 233);
  vertex(0, height);
  endShape();
  strokeWeight(size/15);
  for (float i=-10; i<10; i++)
  {
    for (float j=-10; j<10; j++)
    {
      stroke(220+i*2+j+rtY(i, j, 1));
      point(rtX(i, j, 1)*size/7+xc, rtY(i, j, 1)*size/7+yc);
    }
  }
  textSize(size/10);
  textAlign(LEFT, CENTER);
  fill(55, 55, 0);
  text("$ "+coins, size/10, height-size/10);
  fill(255, 255, 0);
  text("$ "+coins, size/10.1, height-size/10.1);
}
