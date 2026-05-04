int cant = 5;
int sepx, sepy;

void setup() {
  size(800, 600);
  sepx = width/cant;
  sepy = height/cant;
}

void draw() {
  background(255);
  for (int i = 0; i<cant; i++) {
    line(0, 0, i*sepx, height);
    line(width, 0, i*sepx, height);
    line(0, height, i*sepx, 0);
    line(width, height, i*sepx, 0);
  }
} 
