void setup() {
  size(1024, 1024);
  background(255);
  int r = 0;
  int g = 100;
  int b = 100;
  for (int i = 1; i <= 100; i++) {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        stroke(r, g, b);
        point(x, y);
        r = r + 1;
        if (r >= 255) {
          r = 0;
        }
      }
    }
    save("00" + i + ".png");
    g = g + 1;
  }
}

void draw() {
}
