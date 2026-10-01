Pelota p;
int sep= 30;
Paleta j1, j2;
void setup() {
  size(800, 600);
  p=new Pelota( width/2, height/2);
  j1= new Paleta(sep);
  j2= new Paleta(width-sep);
}

void draw() {
  p.mover();
  p.contener();

  j1.mover(is_w, is_s);
  j2.mover(is_o, is_l);

  if (j1.chocaCon(p.pos, p.r)) {
    p.rebotar();
    p.separar(j1.pos);
  }

  if (j2.chocaCon(p.pos, p.r)) {
    p.rebotar();
    p.separar(j2.pos);
  }

  if (p.pos.x<0) {
    j2.puntaje++;
    p=new Pelota(width/2, height/2);
  }
  if (p.pos.x>width) {
    j1.puntaje++;
    p=new Pelota(width/2, height/2);
  }
  mostrarPuntaje();
  otroBackground();
  p.mostrar();
  j1.mostrar();
  j2.mostrar();
}

void otroBackground() {
  fill(0, 30);
  rect(0, 0, width, height);
}
void mostrarPuntaje() {
  fill(255,15);
  textSize(256);
  textAlign(CENTER, CENTER);
  text(j1.puntaje, width/3, height/2);
  text(j2.puntaje, 2*width/3, height/2);
}
