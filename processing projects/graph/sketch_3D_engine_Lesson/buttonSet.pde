//создание кнопок
// ID , X , Y , size
button menu =new button(0,1,1,1);
button dTh  =new button(1,1,1,1);
button mUp  =new button(2,1,1,1);//след урок
button mDw  =new button(3,1,1,1);//пред урок
button frm  =new button(4,1,1,1);

//расположение и размер кнопок
void buttonSet()
{
  menu. setC(sw/10,width-sw/40*3,sw/40*3);
  dTh.  setC(sw/10,width-sw/40*3-mAnim*sw/9.2,sw/40*3);
  mUp.  setC(sw/10,width-sw/40*3-mAnim*sw/9.2*2,sw/40*3);
  mDw.  setC(sw/10,width-sw/40*3-mAnim*sw/9.2*3,sw/40*3);
  frm.  setC(sw/10,width-sw/40*3-mAnim*sw/9.2*4,sw/40*3);
}

//крч не трогать
boolean tb()
{
  boolean test=true;
  if(menu.test())
    test=false;
  if(mDw.test())
    test=false;
  if(mUp.test())
    test=false;
  if(dTh.test())
    test=false;
  if(frm.test())
    test=false;
  return test;
}

//рисовка кнопок
void bDraw()
{
  if(mAnim!=0)
  {
    mDw  .draw();
    mUp  .draw();
    dTh  .draw();
    frm  .draw();
  }
  menu.   draw();
}

//команда о нажатии кнопок
void allPressed()
{
  menu  .pressed();
  mUp   .pressed();
  mDw   .pressed();
  dTh   .pressed();
  frm   .pressed();
}

//ХЗ кажется нужен
int btClick=-1;
