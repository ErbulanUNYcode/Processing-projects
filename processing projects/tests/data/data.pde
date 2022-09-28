BufferedReader data;
JSONObject aha;
PrintWriter pip;
//String suka;

void setup()
{
  //aha=new JSONObject();
  //aha.setInt("rata",111);
  aha=loadJSONObject("data/data.json");
  
  pip=createWriter("kjkdata.txt");
  //data=createReader("data.txt");
  fill(0);
}

void draw()
{
  
  pip.println(222+"/"+111);
  /*try{
   suka=data.readLine();
  }catch(IOException e)
  {
    e.printStackTrace();
    suka=null;
  }
  if(suka==null)
  noLoop();
  else
  {
    String bla[]=split(suka,"/");
    text(bla[0],10,10);
    text(bla[1],10,50);
  }*/
}

void mouseClicked()
{
  pip.flush();
  pip.close();
  exit();
}
