int mode=0;
float size;
float xc;//x center
float yc;//y center
int dpr;//dropper
PFont font;

int bt;//button touch
float drops[][]=new float[100][4];
int dropstart;

int coins;

boolean pause=false;
boolean cL[]=new boolean[6];//look cloth
int ccn[]={10, 100, 500, 2000, 5000, 50000};//coins cena
PImage cl[]=new PImage[6];//texture cloth
PImage scl[]=new PImage[6];//texture shop cloth
float slo[][]=new float[15][2];

boolean gs=false;//game start

float cloX;
float cloY;

float dropTx;
float dropTy;
int dropt;
boolean dropT=false;
int combo;
