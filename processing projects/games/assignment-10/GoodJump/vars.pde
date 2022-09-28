SoundFile
  menuSound,
  gameSound[]=new SoundFile[3],
  jump,
  win,
  lose;

Map map;
// Position of player center in level coordinates
float playerX, playerY;
// Velocity of player
float playerVX, playerVY;
// Speed at which the player moves
float playerSpeed = 500;
// The player is a circle and this is its radius
float playerS = 24.9999;
// Position of the playal center
// Will be set by restart
int playalX=0, playalY=0;

int level=1;
// left / top border of the screen in map coordinates
// used for scrolling
float screenLeftX, screenTopY;

int GAMEMENU=0, GAMERUNNING=1, GAMEOVER=2, GAMEWIN=3, GAMEPAUSE=4;

int gameState, f;

PImage
  menuBackground,
  menuPlayer[]=new PImage[3],
  player[]=new PImage[6];

PFont font;

boolean j=false;
