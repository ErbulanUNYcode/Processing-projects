void setup()
{
  //size(600, 600);
  fullScreen();
  noStroke();
  noCursor();
  rectMode(CENTER);
  p=new planet[planets];
  for (int i=0; i<planets; i++)
  {
    p[i]=new planet();
  }
  thread("opt");
}

void draw()
{
  camCorrect();
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<planets; i++)
  {
    p[i].draw();
  }
  translate(-width/2, -height/2);
  for(float i=0; i < PI; i+=0.01)
  {
    fill(cos(i+PI)*177+177,0,cos(i)*177+177);
     rect(i*50,0,5,20);
  }
  //noLoop();
}
