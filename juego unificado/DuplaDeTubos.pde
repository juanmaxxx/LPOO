class DuplaDeTubos {
  Cuadrado arriba, abajo;
  boolean contado = false;

  DuplaDeTubos(float x) {
    float hueco = 180;
    float centroHueco = random(150, height - 150);
    float anchoTubo = 60;

    float altoArriba = centroHueco - hueco/2;
    arriba = new Cuadrado(x, 0, anchoTubo, altoArriba);

    float altoAbajo = height - (centroHueco + hueco/2);
    abajo = new Cuadrado(x, centroHueco + hueco/2, anchoTubo, altoAbajo);
  }

  void mover() {
    arriba.mover();
    abajo.mover();
  }

  void mostrar() {

    arriba.mostrar();
    abajo.mostrar();
  }

  boolean seFueDePantalla() {
    return arriba.pos.x < -arriba.ancho;
  }

  boolean colisionaCon(PVector posPajaro, float radioPajaro) {
    return arriba.colisiona(posPajaro, radioPajaro) || abajo.colisiona(posPajaro, radioPajaro);
  }

  boolean paso(float xPajaro) {
    if (!contado && arriba.pos.x + arriba.ancho < xPajaro) {
      contado = true;
      return true;
    }
    return false;
  }
}
