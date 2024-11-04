int numShapes = 600; // Increased number of shapes to be drawn in a ring
float ringRadius = 200; // Radius for the ring where shapes will be drawn
float rotateSpeed = 0.05; // Variable controlling rotation speed
float sinSpeed = 0.1; // Variable controlling the speed of sin wave motion
float cosSpeed = 0.05; // Variable controlling the speed of cos wave motion
float sizeSpeed = 0.02; // Variable controlling the size change speed

void setup() {
  size(800, 800);
  background(255);
  
  ellipseMode(RADIUS);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(0);
  
  float angleStep = TWO_PI / numShapes; // Calculate angle step for each shape
  float angleOffset = PI / 2; // Offset the angle to start at 12 o'clock position
  
  for (int i = 0; i < numShapes; i++) {
    float x = width/2 + cos(angleStep * i + angleOffset) * ringRadius + sin(frameCount * rotateSpeed + i * sinSpeed) * 50; // Integrate sin wave for x motion
    float y = height/2 + sin(angleStep * i + angleOffset) * ringRadius + cos(frameCount * rotateSpeed + i * cosSpeed) * 50; // Integrate cos wave for y motion
    
    float dynamicSize = 20 + 10 * sin(frameCount * sizeSpeed + i * 0.1); // Vary size dynamically more
    
    float fillValue = map(i, 0, numShapes, 0, 255); // Map fill color based on index
    
    fill(fillValue, 100, 200);
    
    // Add rotation effect
    pushMatrix();
    translate(x, y);
    rotate(radians(frameCount * 0.1));
    ellipse(0, 0, dynamicSize, dynamicSize);
    
    // Triple the image
    rotate(radians(120));
    ellipse(0, 0, dynamicSize, dynamicSize);
    
    rotate(radians(240));
    ellipse(0, 0, dynamicSize, dynamicSize);
    
    popMatrix();
  }
}
