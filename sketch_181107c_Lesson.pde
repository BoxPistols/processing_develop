import processing.sound.*;

//　音データ用の変数
SoundFile sd1;
SoundFile sd2;
SoundFile sd3;

//シーンを切り替える変数
int scene;


// 座標
float x1;
float y1;

float x2;
float y2;

float x3;
float y3;


void setup() {
  size(1024, 768);
  background(255);

  // 音のデータを読み込み
  sd1 = new SoundFile(this, "moon.mp3");
  sd2 = new SoundFile(this, "clay.mp3");
  sd3 = new SoundFile(this, "ufo.mp3");

  // 最初のシーン
  scene = 0;
}

void draw() {
  //background(255);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);


  if (scene == 1) {
    // backgroundの代わり
    fill(0, 0, 100, 100);
    rect(0, 0, width, height);

    //シーンが1だったら
    fill(0, 100, 100, 100);
    x1 = x1 + 20;
    ellipse(x1, height/2, 400, 400);
  } else if (scene == 2) {
    // backgroundの代わり
    fill(0, 0, 100, 10);
    rect(0, 0, width, height);


    fill(120, 100, 100, 100);
    y2 = y2 + 20;
    rect(0, y2, width, height);
  }
}


void keyPressed() {
  //押した
  if (key == 'a') {
    // aを押したら再生
    sd1.play();
    scene = 1; //シーンを1
    //　シーン1の初期値
    x1 = -100;
  }
  if (key == 's') {
    // sを押したら再生
    sd2.play();
    scene = 2; //シーンを2
    //　シーン2の初期値
    y2 = -500;
  }
  if (key == 'd') {
    // dを押したら再生
    sd3.play();
    scene = 3; //シーンを3
  }
}
