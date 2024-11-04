int numShapes = 800;
float circleRadius = 300;
float rotateSpeed = 0.05;
float sinSpeedX = 0.1;
float sinSpeedY = 0.05;
float sizeSpeed = 0.02;

float twistFactor = 0.1;

float waveAmplitude = 10;
float waveFrequency = 0.05;

float colorOffset = 0; // Variable controlling the color offset

void setup() {
  size(800, 800);
  background(16, 78, 139);
  ellipseMode(RADIUS);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(16, 78, 139);

  float angleStep = TWO_PI / numShapes;
  float angleOffset = -HALF_PI;

  for (int i = 0; i < numShapes; i++) {
    float x = width/2 + cos(angleStep * i + angleOffset) * circleRadius + sin(frameCount * sinSpeedX + i * sinSpeedY) * 50;
    float y = height/2 + sin(angleStep * i + angleOffset) * circleRadius + cos(frameCount * sinSpeedY + i * sinSpeedX) * 50;

    float dynamicSize = 20 + 10 * sin(frameCount * sizeSpeed + i * 0.1);
    
    float fillValue = map(i, 0, numShapes, 0, 255);

    // Introduce color variation
    colorOffset += 0.0001; // Update color offset
    float red = sin(fillValue + colorOffset) * 255;
    float green = sin(fillValue + 2*colorOffset) * 255;
    float blue = sin(fillValue + 3*colorOffset) * 255;
    
    fill(red, green, blue); // Set dynamic fill color

    pushMatrix();
    translate(x, y);
    rotate(radians(frameCount * 0.1));

    float twist = sin(frameCount * twistFactor + i * 0.1);
    scale(1, twist);

    float waveOffset = sin(frameCount * waveFrequency + i * 0.1) * waveAmplitude;
    translate(0, waveOffset);
    ellipse(0, 0, dynamicSize, dynamicSize);

    popMatrix();
  }
}
