import processing.sound.*;
void setup() {
  size( 700, 500 );

  //импорт, установка шрифта и выравнивание текста по центру заданных координат
  font=createFont("data/font.ttf", 60);
  textFont(font);
  textAlign(CENTER, CENTER);

  //импорт фонового изображдения меню
  menuBackground=loadImage("data/images/menuBack.png");

  //ипорт индивидуальных звуков
  menuSound=new SoundFile(this, "data/sounds/backMenu.mp3");
  jump=new SoundFile(this, "data/sounds/jump.mp3");
  win=new SoundFile(this, "data/sounds/win.mp3");
  lose=new SoundFile(this, "data/sounds/lose.mp3");

  //сночало окно меню
  gameState=GAMEMENU;

  //идентификация созданных кнопок
  start=new button("START", "data/images/button.png", 500, height/2);
  play=new button("PLAY", "data/images/button.png", width/2, height/4);
  restart=new button("RESTART", "data/images/button.png", width/2, height/2);
  menu=new button("MENU", "data/images/button.png", width/2, height/4*3);

  for (int i=0; i<3; i++)
  {
    //импорт большей текстуры персонажа для меню
    menuPlayer[i]=loadImage("data/images/Mplayer"+(i+1)+".png");
    //импорт трех фоновых звуков(музыки) уровней
    gameSound[i]=new SoundFile(this, "data/sounds/backSound"+(i+1)+".mp3");
  }

  //импорт всех спрайтов персонажа
  for (int i=0; i<6; i++)
    player[i]=loadImage("data/images/player"+i+".png");
}

//обновление игровой сцены в зависимости от уровня
void newGame () {

  //обнуление количества летящих колючек
  thorns=0;
  saws=0;
  
  //импорт *.map файла
  map = new Map( "map"+level+".map");

  //пройдёмся по карте
  for ( int x = 0; x < map.w; ++x ) {
    for ( int y = 0; y < map.h; ++y ) {

      //нахождение препятствии и создание летящих колючек
      if ( map.at(x, y) == 'U' ) {
        thorn[thorns]=new thorn(0, x, y);
        thorns++;
      }
      if ( map.at(x, y) == 'D' ) {
        thorn[thorns]=new thorn(1, x, y);
        thorns++;
      }
      if ( map.at(x, y) == 'R' ) {
        thorn[thorns]=new thorn(2, x, y);
        thorns++;
      }
      if ( map.at(x, y) == 'L' ) {
        thorn[thorns]=new thorn(3, x, y);
        thorns++;
      }
      if ( map.at(x, y) == 'V' ) {
        saw[saws]=new saw(0, x, y);
        saws++;
        map.set(x, y, 'F');
      }
      if ( map.at(x, y) == 'G' ) {
        saw[saws]=new saw(1, x, y);
        saws++;
        map.set(x, y, 'F');
      }

      //нахождение точки спавна
      if ( map.at(x, y) == 'S' ) {

        //размещение игрока в точку появления
        playerX = map.centerXOfTile (x);
        playerY = map.centerYOfTile (y);

        //замена текстуры спавна на обычный блок
        map.set(x, y, 'F');
      }
    }
  }
}

//управление с клавиатуры
void keyPressed() {
  //только если персонаж не двигается
  if (playerVY==0 && playerVX==0 && gameState==GAMERUNNING)
  {
    switch(keyCode)
    {
    case UP:
      playerVY = -playerSpeed;
      playerVX = 0;
      break;
    case DOWN:
      playerVY = playerSpeed;
      playerVX = 0;
      break;
    case RIGHT:
      playerVX = playerSpeed;
      playerVY = 0;
      break;
    case LEFT:
      playerVX = -playerSpeed;
      playerVY = 0;
    }

    //при успешном задании скорости запрос на проигрывание звука движения
    if (playerVX!=0 || playerVY!=0)
      j=true;
  }

  //при нажатии на 'P' можно поставить на паузу
  if (gameState==GAMERUNNING && keyCode=='P')
  {
    gameSound[level-1].pause();
    gameState=GAMEPAUSE;
  }
}

//обновление поведения персонажа
void updatePlayer()
{
  //просчет нового местоположения персонажа во временных переменных, чтоб он не оказался внутри стены при столкновении
  float nextX = playerX + playerVX/frameRate,
    nextY = playerY + playerVY/frameRate;

  //проверка на то, не столкнулся ли персонаж с препятствиями на карте
  if ( map.testTileInRect(nextX-playerS/4, nextY-playerS/4, playerS/2, playerS/2, "RLUD") )
  {
    //единичные процессы при столкновении
    if (gameState!=GAMEOVER)
    {
      //остановка движения
      playerVX=0;
      playerVY=0;

      //остановка фоновой музыки
      gameSound[level-1].stop();

      //проигрывание звука проигрыша
      lose.play();

      //обновление трекера времени для анимации проигрышного падения
      deTime=millis();
    }
    //изменение статуса на GAMEOVER
    gameState=GAMEOVER;
  }

  //проверка нахождения игрока внутри финиша
  if ( map.testTileFullyInsideRect (nextX-playerS, nextY-playerS, 2*playerS, 2*playerS, "AB" ) ) {
    //смена статуса на победу
    gameState=GAMEWIN;

    //остановка фоновой музыки
    gameSound[level-1].stop();

    //проигрывание звука выйгрыша
    win.play();
  }

  //проверка на столкновение со стеной
  if ( map.testTileInRect( nextX-playerS, nextY-playerS, 2*playerS, 2*playerS, "W" ) )
  {
    //обнуление скорости или остановка движения
    playerVX = 0;
    playerVY = 0;

    //округление местоположения, чтоб после столкновения игрок стоял строго по центру нынешнего блока
    nextX = int(playerX/50)*50+25;
    nextY = int(playerY/50)*50+25;
  }

  //если персонаж остановился но играет звук движения остановить его
  if (playerVX==0 && playerVY==0 && jump.isPlaying())
  {
    jump.stop();
  }//иначе если есть запрос на проигрывание звука движения играть, так оно играет только в начале любого движения
  else if (j && (playerVX!=0 || playerVY!=0))
  {
    jump.play();
  }
  j=false;

  //присваивание нового местоположения игрока
  playerX = nextX;
  playerY = nextY;
}

//рисовка карты и летящих колючек
void drawMap() {
  map.draw( -screenLeftX, -screenTopY );

  for (int i=0; i<thorns; i++)
  {
    thorn[i].update();
    thorn[i].draw();
  }
  
  for (int i=0; i<saws; i++)
  {
    saw[i].update();
    saw[i].draw();
  }
}

//рисовка игрока
void drawPlayer() {
  if (gameState!=GAMEOVER)
  {
    if (playerVY<0)
      image(player[1], width/2-25, height/2-25);
    else if (playerVY>0)
      image(player[2], width/2-25, height/2-25);
    else if (playerVX>0)
      image(player[3], width/2-25, height/2-25);
    else if (playerVX<0)
      image(player[4], width/2-25, height/2-25);
    else
      image(player[0], width/2-25, height/2-25);
  }//
  else
  {
    image(player[5], width/2-25, height/2-25-(millis()-deTime)/2+pow(float(millis()-deTime)/50, 2));
  }
}


void drawText() {
  if (gameState==GAMEOVER)
  {
    fill(255, 0, 0);
    text ("game over", width/2, height/4);
  } else if (gameState==GAMEWIN)
  {
    fill(0, 255, 0);
    text ("WIN", width/2, height/4);
  }
}

void draw() {
  switch(gameState)
  {
  case 0://GAMEMENU
    {
      if (!menuSound.isPlaying())
      {
        menuSound.play();
        deTime=millis();
      }
      image(menuBackground, 0, 0);
      menuPlayer();
    }
    break;
  case 1://GAMERUNNING
    {
      if (!gameSound[level-1].isPlaying() && !win.isPlaying() )
        gameSound[level-1].play();
      screenLeftX = playerX - width/2;
      screenTopY  = playerY -height/2;
      background(0);
      drawMap();
      updatePlayer();
      drawPlayer();

      //анимирование финиша
      f++;
      if (f==10)
        f=0;
      if (f==0)
        for ( int x = 0; x < map.w; ++x )
          for ( int y = 0; y < map.h; ++y )
            if (map.at(x, y)=='A')
              map.set(x, y, 'B');
            else if (map.at(x, y)=='B')
              map.set(x, y, 'A');
    }
    break;
  case 2://GAMEOVER
    {
      background(0);
      drawMap();
      restart.draw();
      menu.draw();
      drawText();
      drawPlayer();
    }
    break;
  case 3://GAMEWIN
    {
      if (level<3)
      {
        gameSound[level-1].stop();
        gameSound[level-1].stop();
        level++;
        newGame();
        gameState=GAMERUNNING;
      }//
      else
      {
        drawText();
        restart.draw();
        menu.draw();
      }
    }
    break;
  case 4://GAMEPAUSE
    {
      play.draw();
      restart.draw();
      menu.draw();
    }
  }
}
