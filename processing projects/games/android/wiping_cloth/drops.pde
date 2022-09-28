void droper()
{
  if (!pause && millis()>dpr)
  {
    dpr=millis()+int(random(700, 1200));
    if (dropstart<100)
    {
      drops[dropstart][0]=random(size/15, width-size/15);
      drops[dropstart][1]=-size/10;
      drops[dropstart][2]=random(PI*2)-PI;
      drops[dropstart][3]=1;
      dropstart++;
    } else
    {
      boolean drr=true;
      int dro=0;
      while (drr)
      {
        if (drops[dro][3]==0)
        {
          drops[dro][0]=random(size/15, width-size/15);
          drops[dro][1]=-size/10;
          drops[dro][2]=random(PI*2)-PI;
          drops[dro][3]=1;
          drr=false;
        } else
          dro++;
      }
    }
  }
}

void dropDraw()
{
  if (dropstart<100)
  {
    for (int i=0; i<dropstart-1; i++)
    {
      if (drops[i][1]>height+size/2 && drops[i][3]==1)
      {
        drops[i][3]=0;
        combo=clothGame+1;
        coins--;
      }
      if (drops[i][3]==1)
      {
        if (!pause)
          drops[i][1]+=size/120;
        drdr(drops[i], i);
      }
    }
  } else
  {
    for (int i=0; i<100; i++)
    {
      if (drops[i][1]>height+size/2 && drops[i][3]==1)
      {
        drops[i][3]=0;
        combo=clothGame+1;
        coins--;
      }
      if (drops[i][3]==1)
      {
        if (!pause)
          drops[i][1]+=size/120;
        drdr(drops[i], i);
      }
    }
  }
}

void drdr(float prm[], int d)
{
  if (dist(cloX, cloY, prm[0], prm[1])<size/13 && gs && prm[3]==1 && !dropT)
  {
    dropt = d;
    dropTx=cloX;
    dropTy=cloY;
    dropT=true;
  }
  if (dropt==d && dropT && dist(cloX, cloY, prm[0], prm[1])>size/13)
  {
    drops[d][3]=0;
    dropT=false;
    float a=atan2(cloX-dropTx, cloY-dropTy);
    if (prm[2]+0.5>a && prm[2]-0.5<a)
    {
      coins+=combo;
      combo++;
    } else if (prm[2]+0.5-PI*2>a && prm[2]+PI*2-0.5<a)
    {
      coins+=combo;
      combo++;
    }else
    {
      combo=clothGame+1;
    }
  }


  noStroke();
  for (float i=0; i<20; i++)
  {
    fill(0, 230, 230, sq(19-i));
    ellipse(prm[0], prm[1]-i*size/60, size/7700*sq(35-i), size/7700*sq(35-i));
  }
  fill(255);
  ellipse(prm[0], prm[1], size/8, size/8);

  fill(0, 230, 230);
  ellipse(prm[0]+size/120, prm[1]-size/65, size/7.5, size/7.5);
  fill(0, 100, 255);
  quad(
    rtX(0, size/16, prm[2])+prm[0], 
    rtY(0, size/16, prm[2])+prm[1], 
    rtX(size/40, -size/19, prm[2])+prm[0], 
    rtY(size/40, -size/19, prm[2])+prm[1], 
    rtX(0, -size/30, prm[2])+prm[0], 
    rtY(0, -size/30, prm[2])+prm[1], 
    rtX(-size/40, -size/19, prm[2])+prm[0], 
    rtY(-size/40, -size/19, prm[2])+prm[1]
    );
}
