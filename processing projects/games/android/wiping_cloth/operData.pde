void readData()
{
  BufferedReader dt;
  String D="";
  dt=createReader("data.txt");
  try {
    D=dt.readLine();
  }
  catch(IOException e)
  {
    coins=123;
  }
  String data[]=split(D, "/");
  coins=int(data[0]);
  for (int i=1; i<=6; i++)
    if (int(data[i])==1)
      cL[i-1]=true;
    else
      cL[i-1]=false;
}

void writeData()
{
  int save[]=new int[6];
  for(int i=0;i<6;i++)
  if(cL[i])
  save[i]=1;
  else
  save[i]=0;
  PrintWriter dt;
  dt=createWriter("data/data.txt");
  dt.print(coins+"/"+save[0]+"/"+save[1]+"/"+save[2]+"/"+save[3]+"/"+save[4]+"/"+save[5]);
  dt.flush();
  dt.close();
}
