int maxCirculos = 10;

// Arrays para guardar posiciones
float[] posX = new float[maxCirculos];
float[] posY = new float[maxCirculos];

int indice = 0;

int cantidad = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);

  for (int i = 0; i < cantidad; i++) {
    fill(0, 150, 255);
    noStroke();
    ellipse(posX[i], posY[i], 30, 30);
  }
}

void mousePressed() {

  posX[indice] = mouseX;
  posY[indice] = mouseY;


  indice++;

  if (indice >= maxCirculos) {
    indice = 0;
  }

  if (cantidad < maxCirculos) {
    cantidad++;
  }
}
