int columnas = 20;
int filas = 15;

// Tamaño de cada celda
float anchoCelda;
float altoCelda;

// Matriz para guardar distancias
float[][] distancias;

void setup() {
  size(800, 600);

  anchoCelda = width / float(columnas);
  altoCelda = height / float(filas);


  distancias = new float[columnas][filas];

  noStroke();
}

void draw() {
  background(0);


  calcularDistancias();

  dibujarGrilla();
}

void calcularDistancias() {


  float distanciaMaxima = dist(0, 0, width, height);

  for (int x = 0; x < columnas; x++) {
    for (int y = 0; y < filas; y++) {

   
      float centroX = x * anchoCelda + anchoCelda / 2;
      float centroY = y * altoCelda + altoCelda / 2;


      float d = dist(mouseX, mouseY, centroX, centroY);


      float gris = map(d, 0, distanciaMaxima, 255, 0);


      gris = constrain(gris, 0, 255);


      distancias[x][y] = gris;
    }
  }
}

void dibujarGrilla() {


  for (int x = 0; x < columnas; x++) {
    for (int y = 0; y < filas; y++) {


      float gris = distancias[x][y];


      fill(gris);


      rect(
        x * anchoCelda,
        y * altoCelda,
        anchoCelda,
        altoCelda
      );
    }
  }
}
