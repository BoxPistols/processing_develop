import processing.sound.*;//　音データ用の変数
SoundFile sd1;
SoundFile sd2;
SoundFile sd3;

void setup() {
  size(500, 500);
  background(255);

  sd1 = new SoundFile(this, "ufo.mp3");
  sd2 = new SoundFile(this, "splits.mp3");
  sd3 = new SoundFile(this, "bubbles.mp3");

  // 1st scene
  scene = 0;
}

void draw() {
  background(255);
  noStroke();
}

void keyPressed() {
  if (key == 'a') {
    sd1.play();
    scene = 1;
  }
  if (key == 's') {
    sd2.play();
    scene = 2;
  }
  if (key == 'd') {
    sd3.play();
    scene = 3;
  }
}
