void game()
{
  glass();
  droper();
  dropDraw();
  cloDraw();
  gbd();
  textSize(size/10);
  textAlign(LEFT, CENTER);
  fill(55, 55, 0);
  text("$ "+coins, size/10, height-size/10);
  fill(255, 255, 0);
  text("$ "+coins, size/10.1, height-size/10.1);
}

void cloDraw()
{
  if (gs)
  {

    cloX=mouseX;
    if(mouseY>size/3)
    cloY=mouseY;
    else
    cloY=size/3;
  }

  slo[0][0]=cloX;
  slo[0][1]=cloY;
  for (int i=1; i<15; i++)
  {
    slo[i][0]=slo[i][0]+(slo[i-1][0]-slo[i][0])/1.6;
    slo[i][1]=slo[i][1]+(slo[i-1][1]+size/20-slo[i][1])/1.6;
  }
  noStroke();
  noFill();
  beginShape();
  texture(cl[clothGame]);
  for (int i=0; i<15; i++)
    vertex(slo[i][0]+size/4, slo[i][1]-size/10, 1, float(i)/14);
  for (int i=14; i>=0; i--)
    vertex(slo[i][0]-size/4, slo[i][1]-size/10, 0, float(i)/14);
  endShape();
}
