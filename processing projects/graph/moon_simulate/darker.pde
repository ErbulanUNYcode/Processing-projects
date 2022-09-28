void darker()
{
  while (true)
  {
    for (int i=0; i<width; i++)
      for (int j=0; j<height; j++)
        set(i, j, color(red(get(i, j))-1));
  }
}
