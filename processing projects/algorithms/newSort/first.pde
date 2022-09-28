void Sort(int sort[])
{
  int i=0;
  int l=sort.length-1;
  while (i<l)
  {
    if (sort[i]>sort[i+1])
    {
      int right=sort[i];
      do
      {
        int j=i;
        int left=sort[i+=1];
        while (j>0 && left<sort[j-1])
        {
          sort[j]=sort[j-=1];
        }
        sort[j]=left;
      }while (i<l && right>sort[i+1]);
      sort[i]=right;
    }
    i++;
  }
}
