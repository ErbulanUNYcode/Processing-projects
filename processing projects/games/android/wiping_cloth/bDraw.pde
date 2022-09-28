void bDraw(float x, float y, float w, String t, int id)
{
  stroke(0);
  strokeWeight(size/200);
  //noStroke();
  float rq=size/50;
  float rs=size/20;
  beginShape();
  noFill();
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(-PI/2-i*PI/20)*rs, y-size/15+cos(-PI/2-i*PI/20)*rs);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(PI-i*PI/20)*rs, y-size/15+cos(PI-i*PI/20)*rs);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(PI/2-i*PI/20)*rs, y+size/15+cos(PI/2-i*PI/20)*rs);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(-i*PI/20)*rs, y+size/15+cos(-i*PI/20)*rs);
  }
  endShape(CLOSE);

  noStroke();
  beginShape();
  fill(255, 100, 255);
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(-PI/2-i*PI/20)*rs, y-size/15+cos(-PI/2-i*PI/20)*rs);
  }
  for (float i=0; i<=10; i++)
  {
    fill(255-i*5, 100-i*10, 255-i*5);
    vertex(x+w/2+sin(PI-i*PI/20)*rs, y-size/15+cos(PI-i*PI/20)*rs);
  }
  fill(205, 0, 205);
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(PI/2-i*PI/20)*rs, y+size/15+cos(PI/2-i*PI/20)*rs);
  }
  for (float i=0; i<=10; i++)
  {
    fill(205+i*5, i*10, 205+i*5);
    vertex(x-w/2+sin(-i*PI/20)*rs, y+size/15+cos(-i*PI/20)*rs);
  }
  fill(255, 0, 255);
  vertex(x-w/2+sin(-PI/2)*rs, y-size/15+cos(-PI/2)*rs);
  fill(235, 0, 235);
  vertex(x-w/2+sin(-PI/2)*rq, y-size/15+cos(-PI/2)*rq);
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(-PI/2+i*PI/20)*rq, y+size/15+cos(-PI/2+i*PI/20)*rq);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(i*PI/20)*rq, y+size/15+cos(i*PI/20)*rq);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(PI/2+i*PI/20)*rq, y-size/15+cos(PI/2+i*PI/20)*rq);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(PI+i*PI/20)*rq, y-size/15+cos(PI+i*PI/20)*rq);
  }
  endShape();
  beginShape();
  fill(235, 0, 235);
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(-PI/2+i*PI/20)*rq, y+size/15+cos(-PI/2+i*PI/20)*rq);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(i*PI/20)*rq, y+size/15+cos(i*PI/20)*rq);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x+w/2+sin(PI/2+i*PI/20)*rq, y-size/15+cos(PI/2+i*PI/20)*rq);
  }
  for (float i=0; i<=10; i++)
  {
    vertex(x-w/2+sin(PI+i*PI/20)*rq, y-size/15+cos(PI+i*PI/20)*rq);
  }
  endShape();

  textAlign(CENTER, CENTER);
  textSize(size/7);
  fill(255);
  text(t, x, y-size/60);
  switch(id)
  {
  case 3://pause
    noStroke();
    rect(x-size/60*3,y-size/60*3,size/60*2,size/60*6);
    rect(x+size/60,y-size/60*3,size/60*2,size/60*6);
    break;
  case 6://cancel cloth
    noStroke();
    triangle(x-size/20, y, x+size/35, y-size/20, x+size/35, y+size/20);
    break;
  case 7://next cloth
    noStroke();
    triangle(x+size/20, y, x-size/35, y-size/20, x-size/35, y+size/20);
    break;
  }
}
