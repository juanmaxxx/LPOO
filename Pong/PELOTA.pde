class Pelota {
  PVector pos, vel,
    acel = new PVector (0, 0);

  float r = 10 ;

  Pelota(float px, float py) {
    pos = new PVector(px, py);
    vel = new PVector(random(10)<5?2:-2, random(10)<5?2:-2 ) ;
  }

  void mostrar() {
    noStroke();
    fill(255, 255, 0);
    ellipse(pos.x, pos.y, r, r);
  }

  void mover() {
    vel.add(acel);
    acel.mult(0);
    pos.add(vel);
  }

  void contener() {
    if (pos.y>height||pos.y<0 )
      vel.y *=-1;
  }
  void rebotar() {
    vel.x *=-1;
  }

  void separar(PVector otraPos) {
    PVector f = otraPos.copy();
    f.sub(pos);
    f.normalize();
    f.mult(-1);
    acel.add(f);
  }
}
