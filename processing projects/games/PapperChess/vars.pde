/*
Окно
 0 - меню
 1 - настройки
 2 - окно игры
 3 - инфа
 */
int win=0;

//общая анимация дрожания
int pani=0;

int frameTime,frameHelp;

//то что можно не трогать

//экран и размер
float sz;   //size или переменная отвечающая за масштаб, 1/100 от ширины
float xc, yc;// x center & y center

//обьект рисованной графики
HandyRenderer pg;

//шрифты
PFont paint;//,medium,old,papirus;


PImage white,cell,str,cstr,ccstr;

//используется для эффекта открытия страницы как тетрадь
PImage sheet;

//значит нужен аниматор и ограничитель нажатия до конца нажатия
float animateNext=1;
