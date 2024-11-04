int h = 180;
float angle = 0;
float angleVel = 0.02;
float frequency = 5;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  colorMode(HSB, 360, 100, 100); // Set color mode to HSB for a colorful background
  background(frameCount % 360, 80, 100); // Change background color based on frameCount

  float x = width/2 + cos(angle) * h;
  float y = height/2 + sin(angle) * h;
  
  fill(0);
  ellipse(x, y, 20, 20);
  
  angle += angleVel;
  angleVel += random(-0.01, 0.01);

  h = int(map(sin(angle * frequency), -1, 1, 50, 200));
  
  frequency += 0.01;
  
  if (frequency > 10) {
    frequency = 5;
  }
}
