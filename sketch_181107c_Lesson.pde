import processing.sound.*;

SoundFile sd1;
SoundFile sd2;
SoundFile sd3;

int scene;

float x1;
float y1;

float x2;
float y2;

float x3;
float y3;

// Action
float speedX;

void setup() {
  size(1024, 768);
  background(255);

  sd1 = new SoundFile(this, "moon.mp3");
  sd2 = new SoundFile(this, "clay.mp3");
  sd3 = new SoundFile(this, "ufo.mp3");

  scene = 0;
  speedX = 20;
}

void draw() {
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);

  if (scene == 1) {
    fill(0, 0, 100, 100);
    rect(0, 0, width, height);

    fill(0, 100, 100, 100);
    x1 = x1 + speedX;

    println(x1);

    if (x1 > width || x1 < 0) {
      speedX = speedX * -1;
    }
    //TODO
    if (x1 == 900 || x1 == 0) {
      sd2.play();
    }

    ellipse(x1, height/2, 100, 100);
  } else if (scene == 2) {
    fill(0, 0, 100, 10);
    rect(0, 0, width, height);

    fill(120, 100, 100, 100);
    y2 = y2 + 20;
    rect(0, y2, width, height);
  }
}

void keyPressed() {
  if (key == 'a') {
    sd1.play();
    scene = 1;
    //x1 = -100;
  }
  if (key == 's') {
    sd2.play();
    scene = 2;
    y2 = -500;
  }
  if (key == 'd') {
    sd3.play();
    scene = 3;
  }
}
