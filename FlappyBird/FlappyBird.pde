ArrayList<Cuadrado> tubos;
Pelota bird;
float ultimoPar = 0;
PVector G = new PVector(0, 0.6);

boolean gameOver = false;
int puntaje = 0;

void setup() {
  size(800, 600);
  tubos = new ArrayList<Cuadrado>();
  bird = new Pelota(100, height/2);
}

void draw() {
  background(0);

  if (!gameOver) {
    AgregarTubos();
    bird.addFuerza(G);
    bird.mover();
    BorrarTubos();
    chequearColisiones();
    actualizarPuntaje();
  }

  for (Cuadrado t : tubos) {
    t.mover();
    t.mostrar();
  }

  bird.mostrar();
  mostrarPuntaje();

  if (gameOver) {
    mostrarGameOver();
  }
}

void mousePressed() {
  if (!gameOver) {
    bird.saltar();
  } else {
    reiniciar();
  }
}

void BorrarTubos() {
  for (int i = tubos.size()-1; i >= 0; i--) {
    Cuadrado Aux = tubos.get(i);
    if (Aux.pos.x < -Aux.ancho) {
      tubos.remove(i);
    }
  }
}

void AgregarTubos() {
  float tActual = millis();
  float dt = tActual - ultimoPar;

  if (dt > 2000) {
    float hueco = 180;            
    float centroHueco = random(150, height - 150);
    float anchoTubo = 60;

   
    float altoArriba = centroHueco - hueco/2;
    Cuadrado tuboArriba = new Cuadrado(width, 0, anchoTubo, altoArriba);

    float altoAbajo = height - (centroHueco + hueco/2);
    Cuadrado tuboAbajo = new Cuadrado(width, centroHueco + hueco/2, anchoTubo, altoAbajo);
    tuboAbajo.esDeArriba = false;

    tubos.add(tuboArriba);
    tubos.add(tuboAbajo);

    ultimoPar = tActual;
  }
}

void chequearColisiones() {
 
  if (bird.pos.y + bird.radio > height || bird.pos.y - bird.radio < 0) {
    gameOver = true;
  }

 
  for (Cuadrado t : tubos) {
    float cx = constrain(bird.pos.x, t.pos.x, t.pos.x + t.ancho);
    float cy = constrain(bird.pos.y, t.pos.y, t.pos.y + t.alto);
    float d = dist(bird.pos.x, bird.pos.y, cx, cy);
    if (d < bird.radio) {
      gameOver = true;
    }
  }
}

void actualizarPuntaje() {
  for (Cuadrado t : tubos) {
    if (t.esDeArriba && !t.contado && t.pos.x + t.ancho < bird.pos.x) {
      puntaje++;
      t.contado = true;
    }
  }
}

void mostrarPuntaje() {
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text(puntaje, width/2, 50);
}

void mostrarGameOver() {
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2 - 20);
  textSize(20);
  text("Click para reiniciar", width/2, height/2 + 20);
}

void reiniciar() {
  tubos.clear();
  bird = new Pelota(100, height/2);
  puntaje = 0;
  ultimoPar = millis();
  gameOver = false;
}



class Pelota {
  PVector pos;
  PVector vel;
  PVector acel;
  float radio = 15;

  Pelota(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acel = new PVector(0, 0);
  }

  void addFuerza(PVector f) {
    acel.add(f);
  }

  void mover() {
    vel.add(acel);
    vel.limit(12);
    pos.add(vel);
    acel.mult(0);
  }

  void saltar() {
    vel.y = -9;
  }

  void mostrar() {
    fill(255, 220, 0);
    noStroke();
    ellipse(pos.x, pos.y, radio*2, radio*2);
  }
}

class Cuadrado {
  PVector pos;
  float ancho, alto;
  float velocidad = 3;
  boolean esDeArriba = true;
  boolean contado = false;

  Cuadrado(float x, float y, float ancho, float alto) {
    pos = new PVector(x, y);
    this.ancho = ancho;
    this.alto = alto;
  }

  void mover() {
    pos.x -= velocidad;
  }

  void mostrar() {
    fill(0, 200, 0);
    noStroke();
    rect(pos.x, pos.y, ancho, alto);
  }
}
