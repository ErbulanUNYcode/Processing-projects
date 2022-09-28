void setup()
{
  size(800, displayHeight);
  scale=width/100;
  saveHeavyFrame=new PImage(width, height);
  saveHeavyFrame=new PImage();
  textAlign(CENTER, CENTER);
  stroke(255);
  strokeJoin(BEVEL);
  noFill();
  //fill(0);
  minPendulumGearRadius=10*scale;
  maxPendulumGearRadius=15*scale;
  textSize(scale*10);
  thread("timeAdjustment");
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  if (timeAdjustment)
  {
    image(saveHeavyFrame, 0, 0);
    pp=(millis()-adTime);
    pp=map(pp, 0, 1000, 0, PI/12)-pow(pow(sin(map(pp, 0, 1000, 0, PI)), 2), 0.5)/3.8;
    //маятник и его шестерня
    pendulum();
    //обычная шестерня из маятника против
    gear(0, scale*22, 12, 1*scale, pp, scale*8);
    //принимающая секундная по
    gear(0, 0, 30, 1*scale, -pp/15*6+0.035);
    //передающая секундная по
    gear(0, 0, 10, 0.815*scale, -pp/15*6, scale*8);
    //первая переходная принимающая к минутной против
    gear(19.6*scale, -15.6*scale, 50, 0.815*scale, pp/25*2+0.703);
    //первый переходной передающая к минутной против
    gear(19.6*scale, -15.6*scale, 10, 1*scale, pp/25*2, scale*8);
    //вторая переходная принимающая к минутной по
    gear(-2*scale, -30*scale, 40, 1*scale, -pp/50);
    //вторая переходная передающая к минутной по
    gear(-2*scale, -30*scale, 15, 0.79*scale, -pp/50, scale*8);
    //третья переходная к минутной против
    gear(-25.6*scale, -24.6*scale, 45, 0.79*scale, pp/150-0.025, scale*8);
    //минутная принимающая по
    gear(0, 0, 45, 0.79*scale, -pp/150+0.055);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, 0, rX(scale*40, 0, -pp/15*6+0.035+PI/2-0.05), rY());
    text(second(), 0, 55*scale);
  } else
  {
    tcAnim+=0.02;
    gear(-10*scale, -25*scale, 20, 3*scale, tcAnim+0.035, scale*20);
    gear(23*scale, 21*scale, 15, 3*scale, -tcAnim/3*4, scale*20);
    text("корректировка в��ем��ни", 0, 55*scale);
  }
}
