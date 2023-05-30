void setup() {
  size(1024, 1024);
  int numBars = 4;
  int rBase = 200;
  int gBase = 50;
  int bBase = 100;
  int rInc = 50;
  int gInc = 50;
  int bInc = 50;
  int rMult = 0;
  int gMult = 0;
  int bMult = 1;
  int rImgMult = 1;
  int bImgMult = 0;
  int gImgMult = 0;
  int r = 0;
  int b = 0;
  int g = 0;
  int numImgs = 100;
  int imgStart = 201;
  int rFlux = 1;
  int gFlux = 1;
  int bFlux = 1;
  int rFluxMult = 1;
  int gFluxMult = 0;
  int bFluxMult = 1;
  int rFluxFlip = 1;
  int bFluxFlip = 1;
  int gFluxFlip = 1;
  int rFluxCap = 10;
  int bFluxCap = 10;
  int gFluxCap = 10;
  
  for (int img = imgStart; img < (imgStart + numImgs); img++) {
    background(255);
    for (int i = 1; i <= numBars; i++) {
      r = rBase;
      g = gBase;
      b = bBase;
      r = r + rMult*(rInc + (i-1)) + rImgMult*(img - imgStart);
      g = g + gMult*(gInc + (i-1)) + gImgMult*(img - imgStart);
      b = b + bMult*(bInc + (i-1)) + bImgMult*(img - imgStart);
      for (int x = 0; x < i*width/numBars; x++) {
        for (int y = 0; y < i*height/numBars; y++) {
          if (rFluxFlip == 1 && rFlux < rFluxCap) {
            rFlux++;
          } else {
            rFluxFlip = -1;
          }
          if (rFluxFlip == 1 && rFlux > 0) {
            rFlux--;
          } else {
            rFluxFlip = 1;
          }
          
          r = r + rFlux*rFluxMult;
          g = g + gFlux*gFluxMult;
          b = b + bFlux*bFluxMult;
          stroke(r, g, b);
          point(x, y);
        }
      }
    }
    save(img + ".png");
    println(r, g, b);
  }
}

void draw() {
}
