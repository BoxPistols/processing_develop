import processing.sound.*;//　音データ用の変数
SoundFile sd1;
SoundFile sd2;
SoundFile sd3;

//シーンを切り替える変数
int scene;

// 座標
float x1;
float y1;

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
  colorMode(HSB,360,100,100,100);

  if(scene == 1){
    fill(0,100,100,100);
    x1 = x1 + 20;
    ellipse(x1,height/2,400,400);

  }
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
