void setup() {
  size(1024, 1024);
  int numBars = 1;
  int rBase = 50;
  int gBase = 50;
  int bBase = 50;
  int rInc = 50;
  int gInc = 50;
  int bInc = 50;
  int rMult = 1;
  int gMult = 1;
  int bMult = 1;
  float rImgMult = .05;
  float bImgMult = .1;
  float gImgMult = .2;
  int r = 0;
  int b = 0;
  int g = 0;
  int numImgs = 10000;
  int imgStart = 1;
  float rFluxUp = 1;
  float gFluxUp = 1;
  float bFluxUp = 1;
  float rFluxDn = 1;
  float gFluxDn = 1;
  float bFluxDn = 1;
  float rFluxInc = .0001;
  float gFluxInc = .0005;
  float bFluxInc = .001;
  int rFluxMult = 1;
  int gFluxMult = 1;
  int bFluxMult = 1;
  int rFluxFlip = 1;
  int bFluxFlip = 1;
  int gFluxFlip = 1;
  int rFluxCap = 50;
  int gFluxCap = 100;
  int bFluxCap = 10;
  int rFluxCapFlip = 1;
  int gFluxCapFlip = 1;
  int bFluxCapFlip = 1;
  int rFluxCapFlipCap = 100;
  int gFluxCapFlipCap = 75;
  int bFluxCapFlipCap = 50;
  int rFluxCapCountUp = 0;
  int bFluxCapCountUp = 0;
  int gFluxCapCountUp = 0;
  int rFluxCapCountDn = 0;
  int bFluxCapCountDn = 0;
  int gFluxCapCountDn = 0;
  int r2 = 0;
  int g2 = 0;
  int b2 = 0;
  
  for (int img = imgStart; img < (imgStart + numImgs); img++) {
    background(255);
    if (rFluxCapFlip == 1 && rFluxCapCountUp < rFluxCapFlipCap) {
      rFluxCap++;
      rFluxCapCountUp++;
      print(" rfc UP");
    } else {
      rFluxCapFlip = -1;
      rFluxCapCountUp = 0;
    }
    if (rFluxCapFlip == -1 && rFluxCapCountDn < rFluxCapFlipCap) {
      rFluxCap--;
      rFluxCapCountDn++;
      print(" rfc DOWN");
    } else {
      rFluxCapFlip = 1;
      rFluxCapCountDn = 0;
    }
    if (gFluxCapFlip == 1 && gFluxCapCountUp < gFluxCapFlipCap) {
      gFluxCap++;
      gFluxCapCountUp++;
      print(" gfc UP");
    } else {
      gFluxCapFlip = -1;
      gFluxCapCountDn = 0;
    }
    if (gFluxCapFlip == -1 && gFluxCapCountDn < gFluxCapFlipCap) {
      gFluxCap--;
      gFluxCapCountDn++;
      print(" gfc DOWN");
    } else {
      gFluxCapFlip = 1;
      gFluxCapCountDn = 0;
    }
    if (bFluxCapFlip == 1 && bFluxCapCountUp < bFluxCapFlipCap) {
      bFluxCap++;
      bFluxCapCountUp++;
      print(" bfc UP ");
    } else {
      bFluxCapFlip = -1;
      bFluxCapCountUp= 0;
    }
    if (bFluxCapFlip == -1 && bFluxCapCountDn < bFluxCapFlipCap) {
      bFluxCap--;
      bFluxCapCountDn++;
      print(" bfc DOWN ");
    } else {
      bFluxCapFlip = 1;
      bFluxCapCountDn = 0;
    }
    for (int i = 1; i <= numBars; i++) {
      r = rBase;
      g = gBase;
      b = bBase;
      if (rFluxCapFlip == 1) {
        r = r + rMult*(rInc + (i-1)) + int(rImgMult*((img % 255) - imgStart)) + rFluxCapFlip*rFluxCapCountUp;
      }
      if (gFluxCapFlip == 1) {
        g = g + gMult*(gInc + (i-1)) + int(gImgMult*((img & 255) - imgStart)) + gFluxCapFlip*gFluxCapCountUp;
      }
      if (bFluxCapFlip == 1) {
        b = b + bMult*(bInc + (i-1)) + int(bImgMult*((img % 255) - imgStart)) + bFluxCapFlip*bFluxCapCountUp;
      }
      if (rFluxCapFlip == -1) {
        r = r + rMult*(rInc + (i-1)) + int(rImgMult*((img % 255) - imgStart)) + rFluxCapFlip*rFluxCapCountDn;
      }
      if (gFluxCapFlip == -1) {
        g = g + gMult*(gInc + (i-1)) + int(gImgMult*((img & 255) - imgStart)) + gFluxCapFlip*gFluxCapCountDn;
      }
      if (bFluxCapFlip == -1) {
        b = b + bMult*(bInc + (i-1)) + int(bImgMult*((img % 255) - imgStart)) + bFluxCapFlip*bFluxCapCountDn;
      }
      for (int x = 0; x < i*width/numBars; x++) {
        for (int y = 0; y < i*height/numBars; y++) {
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
            //print("rf DOWN");
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
            //print("rf DOWN");
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
            //print("rf DOWN");
          } else {
            bFluxFlip = 1;
            bFluxDn = 1;
          }
          stroke(r2, g2, b2);
          point(x, y);
        }
        //println("next");
        //println(rFluxCap, gFluxCap, bFluxCap);
        //println(rFluxFlip, gFluxFlip, bFluxFlip);
        //println(rFlux, gFlux, bFlux);
        //println(r2, g2, b2);
      }
    }
    save(img + ".png");
    println(r, g, b);
  }
}

void draw() {
}
