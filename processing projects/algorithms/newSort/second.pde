void Sort1(int sort[])
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
        i++;
        int j=1;
        int left=sort[i];
        while(i-j>0 && left<sort[i-j-1])
        {
          j++;
        }
        arrayCopy(sort,i-j,sort,i-j+1,j);
        sort[i-j]=left;
      }while (i<l && right>sort[i+1]);
      sort[i]=right;
    }
    i++;
  }
}
