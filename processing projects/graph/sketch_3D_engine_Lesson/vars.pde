int mode=1;//режим урока

//все связанное с экраном
int sw;//масштаб экрана по горизонтали
int sh;//масштаб экрана по вертикали
int ss;
float sb;

float xS,yS;//центр окна визуализации схематической части урока
float xV,yV;//центр окна визуализации движка

//все связанное с темой
boolean darkTheme=false;//
int bC;//bacground color
int gC;//graphick color

//упарвление меню кнопок
boolean Menu=false;
float mAnim=0;//menu animate var

//formula on/off
boolean form=false;

//переменные связанные с простым нажатием
int pressMil;
float pressX;
float pressY;

//camera
float camX;
float camY;
float camZ;
float camRx;
float camRy;
float fee;//fish eye
float los;
