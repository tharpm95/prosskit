int h = 180;
float angle = 0;
float incr = 0.02;
float frequency = 5;
float amplitude = 100;
int stepSize = 50;
float hueValue = 0;
float deltaHue = 0.1;  // Added a variable to control hue change speed
float waveOffset = 100; // Added an offset for the wave pattern

void setup() {
  size(600, 600); // Increased canvas size for more space
  colorMode(HSB, 100);
  background(0);
  noFill();
}

void draw() {
  translate(width/2, height/2);
  rotate(angle);
  wavePattern();
  angle += incr;
}

void wavePattern() {
  for (float i = 0; i < TWO_PI; i += PI/stepSize) {
    float x1 = cos(i * frequency) * amplitude * sin(i + angle * frequency);
    float y1 = sin(i * frequency) * amplitude * sin(i + angle * frequency);
    float x2 = cos((i + PI/(stepSize*2)) * frequency) * amplitude * sin((i + PI/(stepSize*2)) + angle * frequency);
    float y2 = sin((i + PI/(stepSize*2)) * frequency) * amplitude * sin((i + PI/(stepSize*2)) + angle * frequency);

    stroke(hueValue % 100, 100, 100);
    strokeWeight(map(i, 0, TWO_PI, 1, 5));
    line(x1 + waveOffset, y1, x2 + waveOffset, y2); // Added waveOffset to x coordinates

    hueValue += deltaHue;
  }
}
