import org.gicentre.handy.*;

void setup()
{
  size(400, 700, P2D);
  //fullScreen();
  resLoad();
  textureMode(NORMAL);
}

void draw()
{
  anim();
  winDraw();
  frameTime=millis()-frameHelp;
  frameHelp=millis();
  
}

void resLoad() 
{
  sz=float(width)/100;//переменная масштабирования одна сотняя часть ширины
  xc=width/2;//центр по X
  yc=height/2;//центр по Y
  loadData();
  pg=new HandyRenderer(this);//какой-то запуск рисовалки
  sz=float(width)/100;//переменная масштабирования одна сотняя часть ширины
  xc=width/2;//центр по X
  yc=height/2;//центр по 
  pg.setFillGap(sz*1.2);//расстояние между линиями заливки рисованной графики
  pg.setFillWeight(sz/1.5);//толщина линии заливки рисованной графики
  pg.setBackgroundColour(color(0, 0));//цвет позади заливки рисованной графики, лучше останется прозрачным
  paint=createFont("paint.ttf", 60);
  bSet();
  fSet();
  white=new PImage(width, height);
  for (int i=0; i<width; i++)
    for (int j=0; j<height; j++)
      white.set(i, j, color(random(10)+235));

  cell=new PImage(width, height);
  for (int i=0; i<width; i++)
    for (int j=0; j<height; j++)
    {
      int r=int(random(60)+120);
      color b=color(r, r, random(10)+235);
      if (i%(sz*4)>=0 && i%(sz*4)<=sz/5)
        cell.set(i, j, b);
      else if (j%(sz*4)>=0 && j%(sz*4)<=sz/5)
        cell.set(i, j, b);
      else
        cell.set(i, j, color(random(10)+235));
    }

  str=new PImage(width, height);
  for (int i=0; i<width; i++)
    for (int j=0; j<height; j++)
    {
      int r=int(random(60)+120);
      color b=color(r, r, random(10)+235);

      if (j%(sz*7)>=0 && j%(sz*7)<=sz/5)
        str.set(i, j, b);
      else
        str.set(i, j, color(random(10)+235));
    }

  cstr=new PImage(width, height);
  for (int i=0; i<width; i++)
    for (int j=0; j<height; j++)
    {
      int r=int(random(60)+120);
      color b=color(r, r, random(10)+235);
      float cor=float(i)+float(j)/3;
      float cer=int(float(i+4))+float(j)/3;
      float col=(cor)%(sz*20);
      float cel=int(cer%(sz*20));
      if (j%(sz*7)>=0 && j%(sz*7)<=sz/5)
        cstr.set(i, j, b);
      else if (col>-sz/4 && col<sz/4)
        cstr.set(i, j, color(int(r+abs(col-cel)*sz), int(r+abs(col-cel)*sz), int(random(10))+235));
      else
        cstr.set(i, j, color(random(10)+235));
    }

  ccstr=new PImage(width, height);
  for (int i=0; i<width; i++)
    for (int j=0; j<height; j++)
    {
      int r=int(random(60)+120);
      color b=color(r, r, random(10)+235);
      float cor=float(i)+float(j)/3;
      float cer=int(float(i+4))+float(j)/3;
      float col=(cor)%(sz*20);
      float cel=int(cer%(sz*20));
      if ((j+sz*2.5)%(sz*7)>=0 && (j+sz*2.5)%(sz*7)<=sz/5)
        ccstr.set(i, j, b);
      else if (j%(sz*7)>=0 && j%(sz*7)<=sz/5)
        ccstr.set(i, j, b);
      else if (col>-sz/4 && col<sz/4)
        ccstr.set(i, j, color(int(r+abs(col-cel)*sz), int(r+abs(col-cel)*sz), int(random(10))+235));
      else
        ccstr.set(i, j, color(random(10)+235));
    }
  textFont(paint);
}
