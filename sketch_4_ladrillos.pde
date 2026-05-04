int columnas = 6;
int filas = 4;
int c, f;

void setup() {
  size(400, 400);

  c = width / columnas;
  f = height / filas;
}

void draw() {
  background(255);

  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      int desplazar = 0; 
      if (i % 2 == 1) {
        desplazar = c / 2;
      }
      rect(j * c + desplazar, i * f, c, f);
    }
  }
}
