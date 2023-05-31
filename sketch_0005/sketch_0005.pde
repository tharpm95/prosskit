void setup() {
  int width = 1024;
  int height = 1024;
  size(1024,1024,P3D);
  lights();
  noStroke();
  int numImgs = 10000;
  int imgStart = 1;
  float x = 0;
  float y = 0;
  int xFlip = 1;
  int yFlip = 1;
  float xAcc = 0;
  float yAcc = 0;
  float xAccInc = .1;
  float yAccInc = .2;
  float xAccCap = 10;
  float yAccCap = 20;
  int xAccFlip = 1;
  int yAccFlip = 1;
  float rgb1 = 0;
  float rgb2 = 0;
  float rgb3 = 0;
  float rgbA = 0;
  float rgbB = 0;
  float rgbC = 0;
  int rgb1Flip = 1;
  int rgb2Flip = 1;
  int rgb3Flip = 1;
  int rgbAFlip = 1;
  int rgbBFlip = 1;
  int rgbCFlip = 1;
  for (int img = imgStart; img < (imgStart + numImgs); img++) {
    x = x + 1*xFlip; //+ xAcc*xFlip*xAccFlip;
    y = y + 1*yFlip; //+ yAcc*yFlip*yAccFlip;
    if (x >= 1024) {
      xFlip = -1;
    }
    if (x <= 0) {
      xFlip = 1;
    }
    if (y >= 1024) {
      yFlip = -1;
    }
    if (y <= 0) {
      yFlip = 1;
    }
    xAcc = xAcc + xAccInc;
    yAcc = yAcc + yAccInc;
    if (xAcc >= xAccCap) {
      xAccFlip = -1;
    }
    if (xAcc <= 0) {
      xAccFlip = 1;
    }
    if (yAcc >= yAccCap) {
      yAccFlip = -1;
    }
    if (yAcc <= yAccCap) {
      yAccFlip = 1;
    }
    rgb1 = rgb1 + .5*rgb1Flip;
    rgb2 = rgb2 + 1*rgb2Flip;
    rgb3 = rgb3 + 2*rgb3Flip;
    rgbA = rgbA + 2*rgbAFlip;
    rgbB = rgbB + 1*rgbBFlip;
    rgbC = rgbC + .5*rgbCFlip;
    if (rgb1 >= 255) {
      rgb1Flip = -1;
    }
    if (rgb2 >= 255) {
      rgb2Flip = -1;
    }
    if (rgb3 >= 255) {
      rgb3Flip = -1;
    }
    if (rgbA >= 255) {
      rgbAFlip = -1;
    }
    if (rgbB >= 255) {
      rgbBFlip = -1;
    }
    if (rgbC >= 255) {
      rgbCFlip = -1;
    }
    if (rgb1 <= 0) {
      rgb1Flip = 1;
    }
    if (rgb2 <= 0) {
      rgb2Flip = 1;
    }
    if (rgb3 <= 0) {
      rgb3Flip = 1;
    }
    if (rgbA <= 0) {
      rgbAFlip = 1;
    }
    if (rgbB <= 0) {
      rgbBFlip = 1;
    }
    if (rgbC <= 0) {
      rgbCFlip = 1;
    }
    background(rgb1, rgb2, rgb3);
    translate(x*xFlip/500,y*yFlip/500,0);
    fill(rgbA, rgbB, rgbC);
    sphere(100);
    save(img + ".png");
    println(x, y);
  }
}

void draw() {
}
