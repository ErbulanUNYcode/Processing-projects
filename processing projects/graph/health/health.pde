
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  translate(200, 200);
  fill(255, 0, 0);
  beginShape();
  for (float i=-150; i<150; i+=1)
  {
    vertex(i,sin(acos((i)/150))*75+75-abs(i/2));
  }
  
  for (float i=150; i>-150; i-=1)
  {
    vertex(i,-sin(acos(((-abs(i)+75)%150)/75))*75-10);
  }
  endShape(CLOSE);
  fill(0);
  //text(acos(((-abs(float(mouseX-200))+75)%150)/75),50,50);
}
