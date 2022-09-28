import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int bsize,g;
int  r = 200;
float rad = 70,db;
float waves[]=new float[1000];

void setup()
{
  size(600,600,P2D);
  minim = new Minim(this);
  player = minim.loadFile("REDRICK SHEWHART_PSEUDO [Instrumental]_527371370_456239026.mp3");
  //player = minim.loadFile("WhatsApp Audio 2022-03-14 at 22.43.31.mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
  background(0);
  //noFill();
  stroke(255);
  //strokeCap(SQUARE);
  strokeWeight(8);
}

void draw()
{
  background(0);

  beat.detect(player.mix);
  bsize = player.bufferSize();
  if (beat.isOnset())
  {
  }

  bufAnalise();
  translate(width/2+random(-50,50)*waves[99],height/2+random(-50,50)*waves[99]);
  rotate(random(-1,1)*waves[99]/2);
  //text(waves[48],0,0);
  for (int i=0; i < 1000; i+=3) {
    stroke(cos(map(i, 0, 999, 0, PI))*177+177, cos(map(i, 0, 999, 0, PI)+PI/3*2)*177+177, cos(map(i, 0, 999, 0, PI)-PI/3*2)*177+177);
    db=waves[i]*600;
    //for (int j=-50; j<50; j-=10)
    //{
    //  g=i+j;
    //  if (g>-1 && g<1000)
    //  {
    //    db+=waves[g];
    //  }
    //}
    //db*=100;
    line(sin(map(i, 0, 999, 0, PI))*100,-cos(map(i, 0, 999, 0, PI))*100,sin(map(i, 0, 999, 0, PI))*(100+db),-cos(map(i, 0, 999, 0, PI))*(100+db));
    line(-sin(map(i, 0, 999, 0, PI))*100,-cos(map(i, 0, 999, 0, PI))*100,-sin(map(i, 0, 999, 0, PI))*(100+db),-cos(map(i, 0, 999, 0, PI))*(100+db));
  }
}


//преобразование Фурье
void bufAnalise()
{
  for (int i=0; i < 1000; i+=3) {
    float
      x=0, 
      y=0;
    for (int j=0; j <bsize; j++) {
      x+=sin(float(j)*float(i)/10000)*player.left.get(j);
      y+=cos(float(j)*float(i)/10000)*player.left.get(j);
    }
    x/=bsize;
    y/=bsize;
    waves[i]=mag(x, y);
  }
}
