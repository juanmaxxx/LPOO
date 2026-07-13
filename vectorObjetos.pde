Movil[] moviles; 
int cant = int(random(30, 180));

class Movil {
  PVector pos; 
  PVector vel;
  int R = 50; 

  Movil(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-10, 10), random(-10, 10));
  }

  void mover() {
    pos.add(vel);
  }

  void mostrar() {
    fill(#000205);//fill(#FFEA00);
    noStroke();
    ellipse(pos.x, pos.y, R*2, R*2);
  }

  void limitar1() {
    if (pos.y < -R) pos.y = height + R;
    if (pos.y > height + R) pos.y = -R;
    if (pos.x < -R) pos.x = width + R;
    if (pos.x > width + R) pos.x = -R;
  }

  void limitar2() {
    if (pos.x > width - R || pos.x < R) {
      vel.x = vel.x * -1;
    }
    if (pos.y > height - R || pos.y < R) {
      vel.y = vel.y * -1;
    }
  }
}

void setup() {
  size(800, 600);
  moviles = new Movil [cant];
  for (int i=0; i<cant; i++) {moviles[i]=new Movil(random(width), random(height));}
}

void draw() {
  background(#288320);//background(#153152);
  for (int i=0; i<cant; i++) {
    moviles[i].mover();
   
    if (mousePressed) {moviles[i].limitar2();} 
    else              {moviles[i].limitar1();}
    moviles[i].mostrar(); 
  }
}
