PImage img;
float rgb[][][];
int w, h, wi, hi;

void setup()
{
  fullScreen();
  img=loadImage("image.jpg");
  img.filter(GRAY);
  w=img.width;
  h=img.height;
  rgb=new float[w][h][3];
  noStroke();
}

void draw()
{
  convertToFloat();
  imageView(img,0);
  dith();
  imageView(img,1);
  noLoop();
}

void dith()
{
  img=new PImage(w,h);
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      for(int k=0;k<3;k++)
      {
      float old=rgb[i][j][k];
      rgb[i][j][k]=round(old/255)*255;
      float error=(old-rgb[i][j][k])/16;
      if(i<w-1)
      {
        rgb[i+1][j][k]+=error*7;
        if(j<h-1)
        {
          rgb[i+1][j+1][k]+=error;
        }
      }
      if(j<h-1)
      {
        rgb[i][j+1][k]+=error*5;
        if(i>0)
        {
          rgb[i-1][j+1][k]=error*3;
        }
      }
      }
      float r=rgb[i][j][0];
      float g=rgb[i][j][1];
      float b=rgb[i][j][2];
      color c=color(r,g,b);
      img.set(i, j, c) ;
    }
  }
}

void convertToFloat()
{
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      color c=img.get(i,j);
      rgb[i][j][0]=red(c);
      rgb[i][j][1]=green(c);
      rgb[i][j][2]=blue(c);
    }
  }
}

void imageView(PImage i,int x)
{
  float pro=float(h)/float(w); 
  float wk = min( width, height/pro);// image x
  float hk = min( width*pro, height); // image y
  image(i, wk*x, 0, wk, hk);
}
