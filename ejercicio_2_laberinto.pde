int columnas = 10;
int filas = 10;

float tam;

boolean[][][] laberinto;

final int ARRIBA = 0;
final int DERECHA = 1;
final int ABAJO = 2;
final int IZQUIERDA = 3;
final int DIAG1 = 4;
final int DIAG2 = 5;

void setup() {
  size(600, 600);

  tam = width / float(columnas);

  laberinto = new boolean[columnas][filas][6];

  generarLaberinto();
}

void draw() {
  background(255);

  dibujarLaberinto();
}

void generarLaberinto() {

  for (int x = 0; x < columnas; x++) {
    for (int y = 0; y < filas; y++) {

      for (int i = 0; i < 6; i++) {
        laberinto[x][y][i] = random(1) > 0.5;
      }
    }
  }
}

void dibujarLaberinto() {

  stroke(0);

  for (int x = 0; x < columnas; x++) {
    for (int y = 0; y < filas; y++) {

      float px = x * tam;
      float py = y * tam;

      if (laberinto[x][y][ARRIBA]) {
        line(px, py, px + tam, py);
      }

      if (laberinto[x][y][DERECHA]) {
        line(px + tam, py, px + tam, py + tam);
      }

      if (laberinto[x][y][ABAJO]) {
        line(px, py + tam, px + tam, py + tam);
      }

      if (laberinto[x][y][IZQUIERDA]) {
        line(px, py, px, py + tam);
      }

      if (laberinto[x][y][DIAG1]) {
        line(px, py, px + tam, py + tam);
      }

      if (laberinto[x][y][DIAG2]) {
        line(px + tam, py, px, py + tam);
      }
    }
  }
}
