public class Wave {
  float wLength, wWidth, sColor, sAlpha, sWeight;

  float x, y, z, lastX, lastY;
  float radius;
  float waveMove, waveMoveInc;

//========================================
  Wave(float _wLength, float _wWidth, int _sColor, int _sAlpha, int _sWeight) {
    wLength = _wLength;
    wWidth  = _wWidth;
    sColor  = _sColor;
    sAlpha  = _sAlpha;
    sWeight = _sWeight;

    waveMove = 0.4;
    waveMoveInc = 0.005;
    radius = wWidth;
  }

//========================================
  public void display() {
    this.waveMe();
    this.drawMe();
  }

//========================================
  private void waveMe() {
    float rad = radians(waveMoveInc);
    waveMove = 0.4 + pow(cos(rad), 3) + noise(rad);
    waveMoveInc += 0.5;
    if (waveMoveInc > 360*4) {
      waveMoveInc = 0;
    }
  }

//========================================
  private void drawMe() {
    float angle = 0;
    for (y = -wLength/2; y <= wLength/2; y+=12) { 
      float rad = radians(angle * waveMove);
      angle += 12;
      if (angle > 360 * 4) {
        angle = 0;
      }
      float radiusNoise = noise(angle/30);
      x = 0 + pow(sin(rad), 3) * radius * radiusNoise;
      stroke(sColor, sAlpha);
      strokeWeight(sWeight);
      strokeCap(ROUND);
      if (lastY != wLength/2) {
        line(x, y, z, lastX, lastY, z);
      }
      lastY = y;
      lastX = x;
    }
  }
}

