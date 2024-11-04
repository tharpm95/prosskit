int width = 256;
int height = 256;
int r = 100;
int g = 150;
int b = 100;

void setup() {
  size(256,256,P3D);
}

void draw() {
  lights();
  noStroke();
  background(255 - r, 255 - g, 255 - b);
  fill(r, g, b);
  for (int i = 1; i < 1000; i++) {
    fill(r+i, g, b);
  }
  translate(100, 0, 0);
  for (int i = 1; i < 1000; i++) {
    translate(0, .5, 0);
    sphere(10);
  }
}
