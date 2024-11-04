int h = 256;
float angle = 0;

void setup() {
  size(400, 400);
  background(0);
  noFill();
  stroke(255);
}

void draw() {
  translate(width/2, height/2);
  rotate(angle);
  wavePattern();
  angle += 0.03;
}

void wavePattern() {
  for (int i = 0; i < 100; i+=5) { 
    beginShape();
    for (float j = -PI; j < PI; j+=0.1) {
      float y = sin(j*5) * i;
      vertex(j*100, y);
    }
    endShape();
  }
}
