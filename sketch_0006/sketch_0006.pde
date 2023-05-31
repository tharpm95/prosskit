int h=256;
int w=256;
float r = random(5);
float g = random(5);
float b = random(5);
void setup() {
  size(256, 256);
}
void draw() {
  background(255);
  noStroke();
  fill(0);
  float s=8.0;
  float r = random(1);
  float g = random(1);
  float b = random(1);
  for (int i=0; i<h; i++) {
    for (int j=0; j<w; j++) {
      float x=noise(s*(j+3*frameCount)/w, s*i/h);
      float y=noise(s*j/w, s*(i+2*frameCount)/h);
      float nx=j + 18*map(x, 0, 1, -.5, -.6);
      float ny=i + 18*map(y, 0, 1, -0.6, 0.6);
      float t= map(cos(0.005*frameCount), -1, 1, 0.01, 0.0005);  //0.02, 0.0005
      float theta= lerp(noise(t*nx, t*ny ), noise(2*t*nx, 2*t*ny ), 0.2);
      float fillVal = map( sin(theta*.01*(1+0.04*frameCount)/t), -1, 1, 0, 255);
      fill(fillVal/random(5)*r, fillVal/random(5)*g, fillVal/random(5)*b);
      rect( j*2, i*2, 2, 2);
    }
  }
}
