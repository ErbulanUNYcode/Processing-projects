void mousePressed()
{
  int
  x=int(float(mouseX)/float(width)*Fsize),
  y=int((float(mouseY)-float(height-width)/2)/float(width)*Fsize);
  if(choice.length==0 && field[x][y]!=0)
  {
    newChoice(x,y);
  }//
  else if(choice.length==1 && field[x][y]==0)
  {
    println(x==choice[0][0]);
    if(
        ((x==choice[0][0])&&
         (y!=choice[0][1])&&
         (((len[0]>=y-choice[0][1])&&
           (y>choice[0][1]))||
          ((len[2]>=choice[0][1]-y)&&
           (y<choice[0][1]))))||
        ((y==choice[0][1])&&
         (x!=choice[0][0])&&
         ((len[1]>=x-choice[0][0])||
          (len[3]>=choice[0][0]-x)))
      )
    {
      field[x][y]=field[choice[0][0]][choice[0][1]];
      field[choice[0][0]][choice[0][1]]=0;
      choice=new int[0][2];
      que=!que;
    }//
    else
    {
      newChoice(x,y);
    }
  }
}