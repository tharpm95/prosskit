int numShapes = 100; // Increase the number of shapes
float[] shapeX, shapeY, shapeSize, shapeSpeedX, shapeSpeedY, shapeRotation;

void setup() {
  size(800, 800);
  background(125);
  
  shapeX = new float[numShapes];
  shapeY = new float[numShapes];
  shapeSize = new float[numShapes];
  shapeSpeedX = new float[numShapes];
  shapeSpeedY = new float[numShapes];
  shapeRotation = new float[numShapes];
  
  for (int i = 0; i < numShapes; i++) {
    shapeX[i] = random(width);
    shapeY[i] = random(height);
    shapeSize[i] = random(8, 30);
    shapeSpeedX[i] = 2; // Introduce speed variables
    shapeSpeedY[i] = 2;
    shapeRotation[i] = random(.1*TWO_PI); // Introduce rotation
  }
}

void draw() {
  background(125, 50, 175);
  
  for (int i = 0; i < numShapes; i++) {
    shapeX[i] += shapeSpeedX[i]; // Update shape position based on speed
    shapeY[i] += shapeSpeedY[i];
    
    if (shapeX[i] < -50 || shapeX[i] > width + 50) { // Screen wrapping with buffer
      shapeX[i] = width - shapeX[i];
    }
    if (shapeY[i] < -50 || shapeY[i] > height + 50) {
      shapeY[i] = height - shapeY[i];
    }
    
    int shapeType = int(random(3)); // Introduce different types of shapes
    
    pushMatrix();
    translate(shapeX[i], shapeY[i]);
    rotate(shapeRotation[i]); // Rotate shapes
    
    switch(shapeType){
      case 0:
        drawCircle(shapeSize[i]);
        break;
      case 1:
        drawSquare(shapeSize[i]);
        break;
      case 2:
        drawTriangle(shapeSize[i]);
        break;
    }
    popMatrix();
  }
}

void drawCircle(float size){
  fill(random(255), random(255), random(255));
  ellipse(0, 0, size, size);
}

void drawSquare(float size){
  fill(random(255), random(255), random(255));
  rect(0, 0, size, size);
}

void drawTriangle(float size){
  fill(random(255), random(255), random(255));
  float halfSize = size / 2;
  triangle(0, -halfSize, -halfSize, halfSize, halfSize, halfSize);
}
