button start, play, restart, menu;

class button
{
  button(String T, String te, float X, float Y)
  {
    tex=loadImage(te);
    w=tex.width;
    h=tex.height;
    x=X;
    y=Y;
    t=T;
  }

  void draw()
  {
    image(tex, x-w/2, y-h/2);
    fill(255);
    text(t, x, y);
  }

  void click()
  {
    if (mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2)
    {
      switch(t)
      {
      case "START":
        newGame ();
        gameState=GAMERUNNING;
        menuSound.stop();
        break;
      case "PLAY":
        gameState=GAMERUNNING;
        gameSound[level-1].play();
        break;
      case "RESTART":
        if (gameState!=GAMEPAUSE)
          level=1;
        newGame();
        gameState=GAMERUNNING;
        break;
      case "MENU":
        if (gameState!=GAMEPAUSE)
          level=1;
        gameSound[level-1].stop();
        gameState=GAMEMENU;
      }
    }
  }

  float x, y, w, h;
  PImage tex;
  String t;
}

void mousePressed()
{
  if (gameState==0)
    start.click();
  if (gameState==GAMEPAUSE || gameState==GAMEOVER || gameState==GAMEWIN)
  {
    if (gameState==GAMEPAUSE)
      play.click();
    restart.click();
    menu.click();
  }
}
