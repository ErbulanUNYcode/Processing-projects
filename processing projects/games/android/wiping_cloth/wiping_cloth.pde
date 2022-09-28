void setup()
{
  readData();
  fullScreen(P2D);
  textureMode(NORMAL);
  siser();
  sets();
}

void draw()
{
  switch(mode)
  {
  case 0:
    menu();
    break;
  case 1:
    shop();
    break;
  case 2:
    game();
  }
}

void siser()
{
  size=width*0.8;
  xc=width/2;
  yc=height/2;
  font=createFont("font.ttf", size/9);
  textFont(font);
  bSet();
}

void sets()
{
  for (int i=0; i<6; i++)
  {
    cl[i]=loadImage("p"+(i+1)+".png");
    scl[i]=loadImage("ps"+(i+1)+".png");
  }
}
