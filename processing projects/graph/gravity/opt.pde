void opt()
{
  while (true)
  {
    for (int i=0; i<planets; i++)
    {
      for (int j=0; j<planets; j++)
      {
        if (i!=j)
        {
          float d=pow(dist(p[i].x, p[i].y, p[i].z, p[j].x, p[j].y, p[j].z)+1000, 2);
          float gm=G*p[j].m;
          p[i].updateS(gm*(p[i].x-p[j].x)/d, gm*(p[i].y-p[j].y)/d, gm*(p[i].z-p[j].z)/d);
        }
      }
    }
    for (int i=0; i<planets; i++)
    {
      p[i].update();
    }
  }
}
