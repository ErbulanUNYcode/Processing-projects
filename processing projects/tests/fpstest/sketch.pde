float fps;
void setup(){
  background(0);
  textSize(40);
  frameRate(100);
}

void draw(){
  fps=1000/(millis()-fps);
  fill(0);
  rect(200,450,200,160);
  fill(255);
  text(fps, 200,500);//500,500 координаты текста
  text(frameRate, 200,600);
  fps=millis();
}