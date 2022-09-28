
void setup() {
  size(400, 600);
  size=float(width)/fSize;
  yst=float(height-width)/2;
}

void draw() {
  background(0);
  fieldDraw();
}

void fieldDraw()
{
  noStroke();
  for (int i=0; i<fSize; i++)
  {
    for (int j=0; j<fSize; j++)
    {
      if ((i+j)%2==0)fill(156);
      else fill(99);
      rect(i*size, yst+j*size, size, size);
    }
  }
}
