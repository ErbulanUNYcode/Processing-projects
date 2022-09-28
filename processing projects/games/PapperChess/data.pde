void loadData() {
  JSONObject data;
  try {
    data          = loadJSONObject ("data.json");
    book.set      ( data.getInt    ("book"     ));
    redLine       = data.getBoolean("redLine"  );
    if(redLine)
    rLine.set(1);
    gameMode      = data.getInt    ("gameMode" );
    runMode       = data.getInt    ("runMode"  );
    paniOn        = data.getBoolean("paniOn"   );
    if(paniOn)
    pAni.set(1);
  } 
  catch (Exception e) {
    e.printStackTrace();
    dataSave();
  }
}


void dataSave()
{
  JSONObject data;
  data=new JSONObject();
  if (gameMode==0 || gameMode==1)
    data.setInt  ("gameMode", gameMode);
  else
    data.setInt  ("gameMode", 4);
  data.setInt    ("book",     book.get());
  data.setBoolean("redLine",  redLine);
  data.setInt    ("runMode",  runMode);
  data.setBoolean("paniOn",   paniOn);
  saveJSONObject (data,       "data.json");
}

void anim()
{
  if (millis()%110>0 && millis()%110<50)
  {
    if (contTani)
    {
      contTani=false;
      touchAni=int(random(200));
      if (paniOn)
        pani=int(random(200));
    }
  }//
  else if (!contTani)
    contTani=true;
}
