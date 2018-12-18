import processing.serial.*;
import processing.sound.*;
import ddf.minim.*;
import ddf.minim.signals.*;  

Minim minim;
AudioPlayer player;
AudioOutput out; 

SineWave sine1, sine2;    //サイン波生成用の変数
float waveH = 50;    //振幅


// Add Sound
SoundFile sd1;
SoundFile sd2;
SoundFile sd3;

//int scene;

Serial port;
float []arduinoData = new float[3];

//add
float val = 0;
int mapVal = 0;

void setup() {
  size(1280, 768, P3D);
  smooth();
  background(0);

  //println(Serial.list());
  String arduinoPort = Serial.list()[7];
  port = new Serial(this, arduinoPort, 9600);

  minim = new Minim(this);  //初期化

  player = minim.loadFile("clay.mp3", 512);
  out = minim.getLineOut(Minim.STEREO);

  sine1 = new SineWave(440, 0.5, out.sampleRate());
  sine2 = new SineWave(1000, 0.2, out.sampleRate());

  sine1.portamento(200);
  sine2.portamento(200);

  out.addSignal(sine1);
  out.addSignal(sine2);
}

void draw() {
  if (port.available() > 0) {
    String inString = port.readStringUntil('\n');//Dual
    if (inString != null) {
      inString = trim(inString);// remove \n
      arduinoData = float(split(inString, ','));// add comma
      println(arduinoData);
    }
  }

  background(0);

  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  stroke(arduinoData[0], 100, 100, 100);

  // 中心の円
  ellipse(width/2, height/2, arduinoData[1], arduinoData[1]);

  //Add
  val = arduinoData[1];
  mapVal = (int)map(val, 0, width/1.5, val/8, 0);
  println(mapVal);

  int uRes = mapVal;
  int vRes = mapVal;

  pushMatrix();

  translate(width/2, height/2, 0);
  rotate(frameCount * 0.002);

  sphereDetail(uRes, vRes);
  sphere(arduinoData[0]);

  stroke(val * 2, 20, val * 2);
  sphere(arduinoData[0] * 2 + arduinoData[1] + 10);
  //popMatrix();

  // Sound
  //if (arduinoData[0] < 100) {
  //  play();
  //  sphere(arduinoData[0] * 12);
  //  stroke(val * 2, 20, val * 2);
  //}
  popMatrix();

  pushMatrix();
  stroke(255);
  translate(width/2, height/2, 0);
  rotate(frameCount * 0.02);

  // 波形を描く
  for (int i = 0; i < out.bufferSize()-1; i++)
  {
    stroke(360, 0, 100, 100);
    point(i, 00 + out.left.get(i)*waveH);  
    //point(i, 150 + out.right.get(i)*waveH);
  }

  waveH = 50 + arduinoData[0];

  //map関数は、0〜mouseXを0〜1000に変換
  float freq = map(arduinoData[0] * 2, 0, width, 0, 1000);
  //周波数を設定
  sine1.setFreq(freq);

  //0〜mouseYを0〜1.0に変換
  float amp = map(arduinoData[1], 0, height, 0, 1.0);
  //振幅を設定
  sine1.setAmp(amp);

  popMatrix();
}

//void play() {
//  player.play();
//  player.rewind();
//}

//void stop() {
//  player.close();
//  minim.stop();
//  super.stop();
//}


void mouseMoved() {
  ////map関数は、0〜mouseXを0〜1000に変換
  //float freq = map(mouseX, 0, width, 0, 1000);
  ////周波数を設定
  //sine1.setFreq(freq);

  ////0〜mouseYを0〜1.0に変換
  //float amp = map(mouseY, 0, height, 0, 1.0);
  ////振幅を設定
  //sine1.setAmp(amp);
}

void mousePressed() {
  //  //0〜mouseXを-1〜1に変換
  //  float pan = map(mouseX, 0, width, -1, 1);
  //  //左からより聞こえるか、右からより聞こえるかを設定
  //  sine1.setPan(pan);
  //
}
