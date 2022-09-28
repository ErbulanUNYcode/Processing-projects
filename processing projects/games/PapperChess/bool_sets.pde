/*
1 - settings
*/
bool sett=new bool(1,"Настройки",color(0),      color(0,180,0),  color(255,0,0));
bool down=new bool(2,"Готово"   ,color(0,0,120),color(250,125,0),color(0,100,0));

void bSet()
{
  sett.set(xc,int(yc/sz/4)*sz*4,sz*60,sz*16,sz*10);
  down.set(width-sz*28,int((height-sz*12)/sz/4)*sz*4,sz*48,sz*16,sz*10);
}

void menuBdraws()
{
  sett.draw();
}

void menuBtouch()
{
  sett.touch();
}
