PImage img2, img, sobel;
boolean b=true;
float rgb[][][];
int w, h, wi, hi;
float p=PI/3*2;
float A=0;

void setup()
{
  size(1152, 648);
  img=loadImage("img.jpg");
  img2=loadImage("img.jpg");
  img.filter(GRAY);
  sobel();
  //w=img.width;
  //h=img.height;
  //rgb=new float[w][h][3];
  //convertToFloat();
  //dith();
}

void draw()
{
  sobel();
  A+=0.2;
  image(img2, 0, 0);
  if (b)
    image(sobel, 1, 1);
}

void mousePressed()
{
  b=!b;
}

void sobel()
{
  sobel=new PImage(img.width-2, img.height-2);
  for (int i=0; i<sobel.width; i++)
    for (int j=0; j<sobel.height; j++)
    {
      float x=red(img.get(i+2, j+2))+red(img.get(i+2, j+1))*2+red(img.get(i+2, j))-red(img.get(i, j+2))-red(img.get(i, j+1))*2-red(img.get(i, j));
      float y=red(img.get(i+2, j+2))+red(img.get(i+1, j+2))*2+red(img.get(i, j+2))-red(img.get(i+2, j))-red(img.get(i+1, j))*2-red(img.get(i, j));
      float a=atan2(x, y)+A;
      float d=dist(x, y, 0, 0)/2;
      color c=color(sin(a)*d+d, sin(a+p)*d+d, sin(a-p)*d+d);
      sobel.set(i, j, c);
    }
}

void dith()
{
  img=new PImage(w, h);
  for (int i=0; i<w; i++)
  {
    for (int j=0; j<h; j++)
    {
      for (int k=0; k<3; k++)
      {
        float old=rgb[i][j][k];
        rgb[i][j][k]=round(old/255)*255;
        float error=(old-rgb[i][j][k])/16;
        if (i<w-1)
        {
          rgb[i+1][j][k]+=error*7;
          if (j<h-1)
          {
            rgb[i+1][j+1][k]+=error;
          }
        }
        if (j<h-1)
        {
          rgb[i][j+1][k]+=error*5;
          if (i>0)
          {
            rgb[i-1][j+1][k]=error*3;
          }
        }
      }
      float r=rgb[i][j][0];
      float g=rgb[i][j][1];
      float b=rgb[i][j][2];
      color c=color(r, g, b);
      img.set(i, j, c) ;
    }
  }
}

void convertToFloat()
{
  for (int i=0; i<w; i++)
  {
    for (int j=0; j<h; j++)
    {
      color c=img.get(i, j);
      rgb[i][j][0]=red(c);
      rgb[i][j][1]=green(c);
      rgb[i][j][2]=blue(c);
    }
  }
}
