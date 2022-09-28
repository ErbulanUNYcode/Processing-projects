float tcAnim=0;
int adTime;
boolean timeAdjustment=false;
void timeAdjustment()
{
  int s=second();
  while(second()==s)
  {}
  timeAdjustment=true;
  adTime=millis()%1000-second()*1000;
}
