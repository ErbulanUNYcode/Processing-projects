import processing.sound.*;
SoundFile file;
boolean b=true;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "mp.mp3");
}      

void draw() {
}

void mousePressed()
{
  if(b)
  file.play();
  else
  file.pause();
  
  b=!b;
}
