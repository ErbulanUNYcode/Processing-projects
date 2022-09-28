
//линия по центру

void cLine()
{
  stroke(bC);
  strokeWeight(ss/200+2);
  if(width>height)
  {//горизонталь
    line(sw,0,sw,height);
  }
  else
  {//вертикаль
    line(0,sh,width,sh);
  }
  stroke(gC);
  strokeWeight(ss/200);
  if(width>height)
  {//горизонталь
    line(sw,0,sw,height);
  }
  else
  {//вертикаль
    line(0,sh,width,sh);
  }
}
