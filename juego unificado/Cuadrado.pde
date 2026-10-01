class Cuadrado {
  PVector pos;
  PVector vel;          
  float ancho, alto;     
  float tx = 10, ty = 40;
  boolean esPaleta;
  int puntaje = 0;      

  Cuadrado(float x, float y, float ancho, float alto) {
    pos = new PVector(x, y);
    this.ancho = ancho;
    this.alto = alto;
    vel = new PVector(-3, 0); 
    esPaleta = false;
  }

  Cuadrado(float x, float y) {
    pos = new PVector(x, y);
    esPaleta = true;
  }

  void mover() {
    pos.add(vel);
  }

  void mover(boolean up, boolean down) {
    if (up) pos.y -= 7;
    if (down) pos.y += 7;
    pos.y = constrain(pos.y, 0, height);
  }

  void mostrar() {
    noStroke();
    if (esPaleta) {
      rectMode(RADIUS);
      fill(255, 0, map(pos.x, 0, width, 0, 255));
      rect(pos.x, pos.y, tx, ty);
    } else {
      rectMode(CORNER);
      fill(0, 200, 0);
      rect(pos.x, pos.y, ancho, alto);
    }
  }

  boolean colisiona(PVector otraPos, float r) {
    PVector pmc = new PVector(0, 0);

    if (esPaleta) {
      if (otraPos.x < pos.x-tx) pmc.x = pos.x-tx;
      else if (otraPos.x > pos.x+tx) pmc.x = pos.x+tx;
      else pmc.x = otraPos.x;

      if (otraPos.y < pos.y-ty) pmc.y = pos.y-ty;
      else if (otraPos.y > pos.y+ty) pmc.y = pos.y+ty;
      else pmc.y = otraPos.y;
    } else {
      pmc.x = constrain(otraPos.x, pos.x, pos.x+ancho);
      pmc.y = constrain(otraPos.y, pos.y, pos.y+alto);
    }

    return pmc.dist(otraPos) < r;
  }
}
