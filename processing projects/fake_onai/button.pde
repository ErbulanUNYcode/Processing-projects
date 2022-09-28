class button
{
  void draw()
  {
    
  }
};

//c button create
circleButton passButton0=new circleButton();
circleButton passButton1=new circleButton();
circleButton passButton2=new circleButton();
circleButton passButton3=new circleButton();
circleButton passButton4=new circleButton();
circleButton passButton5=new circleButton();
circleButton passButton6=new circleButton();
circleButton passButton7=new circleButton();
circleButton passButton8=new circleButton();
circleButton passButton9=new circleButton();

class circleButton
{
  void draw()
  {
    //textFont(montserrat_light);
    textAlign(CENTER, CENTER) ;
    textSize(sz*8);
    fill(255,216,0);
    stroke(0);
    strokeWeight(sz/3);
    ellipse(x, y, r, r);
    fill(0);
    text(t, x, y) ;
  }
  
  void set(float X, float Y, float R, int T)
  {
    x=X;
    y=Y/1.1-sz*6.25+yc;
    r=sz*18.5;
    t=T;
  }
  
  void touch()
  {
    if(dist(mouseX, mouseY, x, y)<r/2&&fpAni==0)
    {
      if(pass_weight<4)
      {
        fakePass[pass_weight]=t;
        pass_weight++;
        fpAni=0;
      }
      if(pass_weight==4)
      fpAni=20;
    }
  }
  
  float x, y, r;
  int t;
};

void b_set()
{
  float dis=sz*25.4;
  float pr[][]=
  {
    { 0, 2},
    {-1,-1},
    { 0,-1},
    { 1,-1},
    {-1, 0},
    { 0, 0},
    { 1, 0},
    {-1, 1}, 
    { 0, 1},
    { 1, 1}
  };
  passButton0.set(xc+pr[0][0]*dis,pr[0][1]*dis,sz/4,0);
  passButton1.set(xc+pr[1][0]*dis,pr[1][1]*dis,sz/4,1);
  passButton2.set(xc+pr[2][0]*dis,pr[2][1]*dis,sz/4,2);
  passButton3.set(xc+pr[3][0]*dis,pr[3][1]*dis,sz/4,3);
  passButton4.set(xc+pr[4][0]*dis,pr[4][1]*dis,sz/4,4);
  passButton5.set(xc+pr[5][0]*dis,pr[5][1]*dis,sz/4,5);
  passButton6.set(xc+pr[6][0]*dis,pr[6][1]*dis,sz/4,6);
  passButton7.set(xc+pr[7][0]*dis,pr[7][1]*dis,sz/4,7);
  passButton8.set(xc+pr[8][0]*dis,pr[8][1]*dis,sz/4,8);
  passButton9.set(xc+pr[9][0]*dis,pr[9][1]*dis,sz/4,9);
}

void pbTouch()//pass button touch
{
  passButton0.touch();
  passButton1.touch();
  passButton2.touch();
  passButton3.touch();
  passButton4.touch();
  passButton5.touch();
  passButton6.touch();
  passButton7.touch();
  passButton8.touch();
  passButton9.touch();
}

void pbDraw()//pass button draw
{
  passButton0.draw();
  passButton1.draw();
  passButton2.draw();
  passButton3.draw();
  passButton4.draw();
  passButton5.draw();
  passButton6.draw();
  passButton7.draw();
  passButton8.draw();
  passButton9.draw();
}