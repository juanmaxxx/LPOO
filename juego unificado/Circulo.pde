class Circulo {
  PVector pos, vel, acel;
  float radio;

  Circulo(float x, float y, float radio) {
    pos = new PVector(x, y);
    vel = new PVector(random(10)<5?2:-2, random(10)<5?2:-2);
    acel = new PVector(0, 0);
    this.radio = radio;
  }

  Circulo(float x, float y, float radio, boolean quieto) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acel = new PVector(0, 0);
    this.radio = radio;
  }

  void addFuerza(PVector f) {
    acel.add(f);
  }

  void saltar() {
    vel.y = -9;
  }


  void contener() {
    if (pos.y > height || pos.y < 0)
      vel.y *= -1;
  }

  void rebotar() {
    vel.x *= -1;
  }

  void separar(PVector otraPos) {
    PVector f = otraPos.copy();
    f.sub(pos);
    f.normalize();
    f.mult(-1);
    acel.add(f);
  }


  void mover() {
    vel.add(acel);
    vel.limit(12);
    pos.add(vel);
    acel.mult(0);
  }

  void mostrar() {
    noStroke();
    fill(255, 220, 0);
    ellipse(pos.x, pos.y, radio*2, radio*2);
  }
}
