void loadData()
{
  try
  {
    JSONObject data=new JSONObject();
    data = loadJSONObject("data.json");
//    next=data.getInt("next");
  }
  catch(Exception e)
  {
    saveData();
  }
}

void saveData()
{
  JSONObject data=new JSONObject();
//  data.setInt("next",next);
  saveJSONObject(data,"data.json");
}