int
field[][],
Fsize=8,
rows=2,
choice[][]={};
boolean que,
enemy[]=new boolean[4];
int len[]=new int[4];
void setup()
{
  size(500,500);
  strokeWeight(width/100);
  newGame();
}

void draw()
{
  noStroke();
  for(int i=0;i<Fsize;i++)
  {
    for(int j=0;j<Fsize;j++)
    {
      if((i+j)%2==0)
        fill(95);
      else
        fill(159);
      rect(width/Fsize*i,
         height/2-width/2+width/Fsize*j,
         width/Fsize,
         width/Fsize);
    }
  }
  
  if(choice.length==1)
  {
    fill(100,100,255);
    rect(width/Fsize*choice[0][0],
         height/2-width/2+width/Fsize*choice[0][1],
         width/Fsize,
         width/Fsize);
    for(int i=0;i<4;i++)
    {
      fill(0,255,0,50);
      for(int j=1;j<=len[i];j++)
      {
        rect(width/Fsize*(choice[0][0]+j*ang[i][0]),
             height/2-width/2+width/Fsize*(choice[0][1]+j*ang[i][1]),
             width/Fsize,
             width/Fsize);
      }
      fill(255,0,0,50);
      if(enemy[i])
      {
        rect(width/Fsize*(choice[0][0]+(len[i]+1)*ang[i][0]),
             (height-width)/2+width/Fsize*(choice[0][1]+(len[i]+1)*ang[i][1]),
             width/Fsize,
             width/Fsize);
      }
    }
  }
  
  
  for(int i=0;i<Fsize;i++)
  {
    for(int j=0;j<Fsize;j++)
    {
      if(field[i][j]!=0)
      stone(i,j,field[i][j]);
    }
  }
}

void newGame()
{
  choice=new int[0][0];
  field=new int[Fsize][Fsize];
  for(int i=0;i<Fsize;i++)
  {
    for(int j=0;j<Fsize;j++)
    {
      field[i][j]=0;
//      if(j<rows)
//      {
//        field[i][j]=(i+j*8)%stones.length+1;
//      }//
//      else if(j<Fsize-rows)
//      {
//        field[i][j]=0;
//      }//
//      else
//      {
//        field[i][j]=-(i+8+j*8)%stones.length-1;
//      }
    }
  }
  field[0][0]=-24;
  field[5][1]=-4;
  field[3][4]=-11;
  field[3][1]=2;
  field[5][2]=10;
  que=true;
}
