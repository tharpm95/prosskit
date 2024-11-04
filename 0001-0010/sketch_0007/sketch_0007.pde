int numBars = 6;
int rInc = 20;
int gInc = 10;
int bInc = 50;
int rMult = 2;
int gMult = 2;
int bMult = 1;
int r = 70;
int b = 100;
int g = 20;
float rFluxUp = 1;
float gFluxUp = 1;
float bFluxUp = 1;
float rFluxDn = 1;
float gFluxDn = 1;
float bFluxDn = 1;
float rFluxInc = .001;
float gFluxInc = .1;
float bFluxInc = .001;
int rFluxMult = 2;
int gFluxMult = 10;
int bFluxMult = 2;
int rFluxFlip = 1;
int bFluxFlip = 1;
int gFluxFlip = 1;
int rFluxCap = 100;
int gFluxCap = 50;
int bFluxCap = 100;
int r2 = 0;
int g2 = 0;
int b2 = 0;
int mode = 1;
int rectMult = 3;

void setup() {
  size(256, 256);
}

void draw() {
background(255);
noStroke();
fill(0);
for (int x = 0; x < width/numBars; x++) {
   for (int y = 0; y < height/numBars; y++) {
      if (rFluxFlip == 1 && rFluxUp < rFluxCap) {
        r2 = r + int(rFluxUp*rFluxMult);
        rFluxUp = rFluxUp + rFluxInc;
      } else {
        rFluxFlip = -1;
        rFluxUp = 1;
      }
      if (rFluxFlip == -1 && rFluxDn < rFluxCap) {
        r2 = r - int(rFluxDn*rFluxMult);
        rFluxDn = rFluxDn + rFluxInc;
      } else {
        rFluxFlip = 1;
        rFluxDn = 1;
      }
      if (gFluxFlip == 1 && gFluxUp < gFluxCap) {
        g2 = g + int(gFluxUp*gFluxMult);
        gFluxUp = gFluxUp + gFluxInc;
      } else {
        gFluxFlip = -1;
        gFluxUp = 1;
      }
      if (gFluxFlip == -1 && gFluxDn < gFluxCap) {
        g2 = g - int(gFluxDn*gFluxMult);
        gFluxDn = gFluxDn + gFluxInc;
      } else {
        gFluxFlip = 1;
        gFluxDn = 1;
      }
      if (bFluxFlip == 1 && bFluxUp < bFluxCap) {
        b2 = b + int(bFluxUp*bFluxMult);
        bFluxUp = bFluxUp + bFluxInc;
      } else {
        bFluxFlip = -1;
        bFluxUp = 1;
      }
      if (bFluxFlip == -1 && bFluxDn < bFluxCap) {
        b2 = b - int(bFluxDn*bFluxMult);
        bFluxDn = bFluxDn + bFluxInc;
      } else {
        bFluxFlip = 1;
        bFluxDn = 1;
      }
      fill(r2, g2, b2);
      if (mode == 1) {
        int ytemp = y;
        y = x;
        x = ytemp;
      }
      rect(x*2, y*2, 100*rectMult, 100*rectMult);
    }
  }
}
