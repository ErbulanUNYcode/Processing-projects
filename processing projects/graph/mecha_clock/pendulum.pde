void pendulum()
{
  stroke(255);
  strokeWeight(1.5);
  float a=-sin(float(millis()-adTime+180)/1000*PI)/6+PI;
  beginShape();
  vertex(rX(0,7*scale,a) ,rY());
  vertex(rX(-18*scale,-11*scale,a) ,rY());
  bezierVertex(rX(-16*scale,-13.5*scale,a) ,rY(),rX() ,rY(),rX(-11.7*scale,-13.3*scale,a) ,rY());
  vertex(rX(-15*scale,-10*scale,a) ,rY());
  vertex(rX(-5*scale,0,a) ,rY());
  vertex(rX(-5*scale,0,a) ,rY());
  text(mouseX+""+mouseY,200,200);
  endShape();
  beginShape();
  for (float i=0; i<PI*2; i+=PI*2/12)
  {
    vertex(sin(i+pp)*minPendulumGearRadius, cos(i+pp)*minPendulumGearRadius+scale*22);
    vertex(sin(i+pp)*maxPendulumGearRadius, cos(i+pp)*maxPendulumGearRadius+scale*22);
    vertex(sin(i+pp+PI*2/24)*minPendulumGearRadius, cos(i+pp+PI*2/24)*minPendulumGearRadius+scale*22);
  }
  endShape();
}
