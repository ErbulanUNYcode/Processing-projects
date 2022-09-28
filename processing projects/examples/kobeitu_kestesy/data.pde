void loadData()
{
  try
  {
    JSONObject data=new JSONObject();
    data = loadJSONObject("data.json");
    next=data.getInt("next");
    if(next!=0)
    {
      for(int i=0;i<next;i++)
      {
        tfl[i]=data.getBoolean("tfl"+i);
      }
    }
  }
  catch(Exception e)
  {
    saveData();
  }
}

void saveData()
{
  JSONObject data=new JSONObject();
  data.setInt("next",next);
  if(next!=0)
  {
    for(int i=0;i<next;i++)
    {
      data.setBoolean("tfl"+i,tfl[i]);
    }
  }
  saveJSONObject(data,"data.json");
}