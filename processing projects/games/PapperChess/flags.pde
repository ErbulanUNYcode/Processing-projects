flags book=new flags(5, "Вид бумаги", 1);
flags rLine=new flags(2, "Красная линия", 0);
flags pAni=new flags(2, "Общая анимация", 0);

void fSet()
{
  book.sett(sz*20, "Чистая бумага/Клетка/Строчки/Строчки с курсивом/Детская тетрадь");
  rLine.sett(sz*92, "Выкл./Вкл.");
  pAni.sett(sz*56, "Выкл./Вкл.");
}

void fDraw()
{
  book.draw();
  if (book.get()!=0)
    rLine.draw();
  pAni.draw();
}

void fTouch()
{
  book.touch();
  rLine.touch();
  pAni.touch();
  if (rLine.get()==1)
    redLine=true;
  else
    redLine=false;
  if (pAni.get()==1)
    paniOn=true;
  else
    paniOn=false;
}

class flags
{
  flags(int Size, String Text, int N)
  {
    size = Size;
    text = Text;
    nom  = N;
    seeds=new int[Size];
    for (int i=0; i<Size; i++)
      seeds[i]=i;
  }
  void sett(float Y, String Texts)
  {
    y    = Y;
    texts=split(Texts, "/");
  }

  void set(int NOM)
  {
    nom=NOM;
  }

  void touch()
  {
    for (int i=0; i<size; i++)
    {
      if (mouseX>sz*12-sz*4+i*sz*12 && mouseX<sz*12+sz*4+i*sz*12 && mouseY>y-sz*4 && mouseY<y+sz*4)
      {
        nom=i;
        if (!paniOn)
          seeds[i]=touchAni;
      }
    }
  }

  int get()
  {
    return nom;
  }

  void draw()
  {
    textAlign(LEFT);
    textSize(sz*10);
    fill(200, 0, 0);
    text(text, sz*8, y-sz*6);
    fill(0, 0, 160);
    textSize(sz*7);
    text(texts[nom], sz*8, y+sz*14);
    stroke(0);
    textAlign(CENTER, CENTER);
    textSize(sz*10);
    for (int i=0; i<size; i++)
    {
      pg.setSeed(seeds[i]+pani);
      fill(150, 150, 250);
      pg.rect(sz*12-sz*4+i*sz*12, y-sz*4, sz*8, sz*8);
      if (nom==i)
        fill(255, 0, 0);
      else
        fill(0, 0, 160);
      text(i+1, sz*12+sz*12*i+sin(seeds[i]+pani)*sz/4, y+cos(seeds[i]+pani)*sz/4);
    }
  }

  private float  y;
  private int    size, nom;
  private String text, texts[];
  private int seeds[];
};
