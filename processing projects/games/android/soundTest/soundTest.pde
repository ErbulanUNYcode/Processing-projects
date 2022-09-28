//Sound file from: http://soundbible.com/2083-Crickets-Chirping-At-Night.html
boolean isPlay=false;
import cassette.audiofiles.SoundFile;

SoundFile music;

void setup() {
    music = new SoundFile(this, "pi.mp3");
}

void draw() {
}

void mousePressed() {
    if(isPlay)
    music.stop();
    else
    music.play();
    isPlay=!isPlay;
} 
