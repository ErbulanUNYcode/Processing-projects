void setup(){
  test=loadImage("test.jpg");
  sz=width/100;
  xc=width/2;
  yc=height/2;
  b_set();
  smooth();
//  montserrat_light=createFont("montserrat_light.ttf",10);
//  montserrat_medium=createFont("montserrat_medium.ttf",10);
}

void draw(){
  switch(window)
  {
    case 1:
    pass_win();
    break;
    case 2:
    homeWin();
    break;
  }
}

void mousePressed()
{
  switch(window)
  {
    case 1:
    pbTouch();
    break;
  }
}