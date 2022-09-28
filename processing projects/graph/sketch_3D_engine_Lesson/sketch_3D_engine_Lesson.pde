/*
Этот урок учит только правильно визуализировать точки в пространстве на экране и креплять углы полигонов к ним,
с возможностью двигать камеру
||
*/

void setup()
{
  fullScreen();
  //size(500,730);
  if(width>height)
  {//горизонталь
    sh=height;
    sw=int(float(width)/2);
    xS=width/4;
    yS=height/2;
    xV=width/4*3;
    yV=height/2;
  }
  else
  {//вертикаль
    sw=width;
    sh=int(float(height)/2);
    xS=width/2;
    yS=height/4*3;
    xV=width/2;
    yV=height/4;
  }
  if(sw>sh)
  {
    ss=sh;
    sb=sw;
  }
  else
  {
    ss=sw;
    sb=sh;
  }
}

void draw()
{
  //применение темы
  if(darkTheme)
  {bC=0;gC=255;}else{bC=255;gC=0;}
  
  //запрос на рисовку по урокам
  modeDraw();
//  fill(255,0,0);
//  textSize(40);
//  text(int(frameRate),500,500);
}
