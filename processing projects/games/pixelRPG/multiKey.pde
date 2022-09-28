boolean 
  keyS[]=new boolean[10000], 
  keyC[]=new boolean[100];

void keyPressed()
{
  if (key<10000)
  {
    keyS[key]=true;
  } else
  {
    keyC[keyCode]=true;
  }
}

void keyReleased()
{
  if (key<10000)
  {
    keyS[key]=false;
  } else
  {
    keyC[keyCode]=false;
  }
}
