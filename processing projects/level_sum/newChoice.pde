void newChoice(int x,int y)
{
  if((field[x][y]<0&&que)||field[x][y]>0&&!que)
  {
    int ch[][]={{x,y}};
    choice=ch;
    for(int i=0;i<4;i++)
    {
      len[i]=0;
      for(int j=0;
          j<float(abs(field[x][y]))/4&&
          x+ang[i][0]*(1+j)>=0&&
          x+ang[i][0]*(1+j)<Fsize&&
          y+ang[i][1]*(1+j)>=0&&
          y+ang[i][1]*(1+j)<Fsize&&
          field[x+ang[i][0]*(1+j)][y+ang[i][1]*(1+j)]==0
          ;j++)
      {
        len[i]++;
      }
    }
  }
  for(int i=0;i<4;i++)
  {
    if(len[i]<float(abs(field[x][y]))/4&&
       x+ang[i][0]*(1+len[i])>=0&&
       x+ang[i][0]*(1+len[i])<Fsize&&
       y+ang[i][1]*(1+len[i])>=0&&
       y+ang[i][1]*(1+len[i])<Fsize&&
       ((field[x+ang[i][0]*(1+len[i])][y+ang[i][1]*(1+len[i])]<0&&!que)||
        (field[x+ang[i][0]*(1+len[i])][y+ang[i][1]*(1+len[i])]>0&&que)))
    {
      enemy[i]=true;
    }//
    else
    {
      enemy[i]=false;
    }
  }
}