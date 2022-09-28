void jMapSave(int a[][],String link)
{
  JSONObject data=new JSONObject();
  data.setInt("w",a.length);
  data.setInt("h",a[0].length);
  for(int i=0; i < a.length; i++)
  {
     for(int j=0; j < a[0].length; j++)
     {
        data.setInt("map_"+i+"_"+j,a[i][j]);
     }
  }
  saveJSONObject(data,"data/json/"+link+".json");
}

int[][] jMapLoad(String link)
{
  JSONObject data=loadJSONObject("data/json/"+link+".json");
  int[][] a=new int[data.getInt("w")][data.getInt("h")];
  for(int i=0; i < data.getInt("w"); i++)
  {
     for(int j=0; j < data.getInt("h"); j++)
     {
        a[i][j]=data.getInt("map_"+i+"_"+j);
     }
  }
  return a;
}
