// Nov 2013
// http://jiyu-kenkyu.org
// http://kow-luck.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://kow-luck.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// If you want to use this work as more free, or encourage me,
// please contact me via http://kow-luck.com/contact

//========================================
import processing.opengl.*;

int WIDTH = 1280;
int NUM = 400;
float zStep = WIDTH/NUM;

Wave[] wave = new Wave[NUM];
float[] zPos = new float[NUM];

//========================================
void setup() {
  size(WIDTH, 720, OPENGL);
  frameRate(30);
  float angle = 0;
  for (int i = 0; i < NUM; i++) {
    float radius = height/10*2;
    float rad = radians(angle);
    angle += 2;
    float waveWidth = height/10*3 + (sin(rad)+noise(angle/30))* radius;
    int sColor      = round(random(0, 150));   
    int sAlpha      = round(random(50, 200));
    int sWeight     = round(random(3, 8));
    wave[i] = new Wave(height, waveWidth, sColor, sAlpha, sWeight);
    zPos[i] = zStep * i;
  }
}

//========================================
void draw() {
  background(255);
  translate(width/2, height/2, width/5);
  rotateX(radians(mouseY/2) + frameCount * 0.003);
  rotateY(radians(mouseX/2) + frameCount * 0.02);
  rotateZ(frameCount * 0.002);
  drawMe();
  println(frameRate);
}

//========================================
void drawMe(){
 pushMatrix();
  for (int i = 0; i < NUM; i++) {
    pushMatrix();
    translate(0, 0, zPos[i]-WIDTH/2);
    wave[i].display();
    popMatrix();
  }
  popMatrix();
}
