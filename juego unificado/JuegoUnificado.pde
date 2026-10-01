final int INICIO = 0;
final int JUGANDO_FLAPPY = 1;
final int JUGANDO_PONG = 2;
final int GAME_OVER = 3;

int estadoDelJuego = INICIO;
String mensajeGameOver = "";


ArrayList<DuplaDeTubos> tubos;
Circulo bird;
float ultimoPar = 0;
PVector G = new PVector(0, 0.6);
int puntajeFlappy = 0;


Circulo pelotaPong;
Cuadrado paleta1, paleta2;
int sep = 30;
boolean is_w=false, is_s=false, is_o=false, is_l=false;

void setup() {
  size(800, 600);
}

void draw() {
  switch(estadoDelJuego) {
    case INICIO:
      pantallaInicio();
      break;
    case JUGANDO_FLAPPY:
      jugarFlappy();
      break;
    case JUGANDO_PONG:
      jugarPong();
      break;
    case GAME_OVER:
      pantallaGameOver();
      break;
  }
}

void pantallaInicio() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);

  textSize(48);
  text("MENÚ", width/2, height/4);

  textSize(26);
  text("FLAPPY BIRD", width/2, height/2 - 40);
  text("(tecla 1, o click arriba de la pantalla)", width/2, height/2 - 10);

  text("PONG", width/2, height/2 + 60);
  text("(tecla 2, o click abajo de la pantalla)", width/2, height/2 + 90);
}


void keyPressed() {
  if (key == ESC) {
    key = 0; // evita que Processing cierre el sketch
    estadoDelJuego = INICIO;
    return;
  }

  if (estadoDelJuego == INICIO) {
    if (key == '1') iniciarFlappy();
    if (key == '2') iniciarPong();
  }

  if (estadoDelJuego == JUGANDO_PONG) {
    if (key=='w'||key=='W') is_w = true;
    if (key=='s'||key=='S') is_s = true;
    if (key=='o'||key=='O') is_o = true;
    if (key=='l'||key=='L') is_l = true;
  }
}

void keyReleased() {
  if (key=='w'||key=='W') is_w = false;
  if (key=='s'||key=='S') is_s = false;
  if (key=='o'||key=='O') is_o = false;
  if (key=='l'||key=='L') is_l = false;
}

void mousePressed() {
  if (estadoDelJuego == INICIO) {
    if (mouseY < height/2) iniciarFlappy();
    else iniciarPong();
  } else if (estadoDelJuego == JUGANDO_FLAPPY) {
    bird.saltar();
  } else if (estadoDelJuego == GAME_OVER) {
    estadoDelJuego = INICIO;
  }
}


  tubos = new ArrayList<DuplaDeTubos>();
  bird = new Circulo(100, height/2, 15, true); // constructor "quieto"
  puntajeFlappy = 0;
  ultimoPar = millis();
  estadoDelJuego = JUGANDO_FLAPPY;
}

void jugarFlappy() {
  background(0);

  agregarTubos();
  bird.addFuerza(G);
  bird.mover();
  borrarTubos();
  chequearColisionesFlappy();
  actualizarPuntajeFlappy();

  for (DuplaDeTubos d : tubos) {
    d.mover();
    d.mostrar();
  }

  bird.mostrar();
  mostrarPuntajeFlappy();
}

void agregarTubos() {
  float tActual = millis();
  float dt = tActual - ultimoPar;

  if (dt > 2000) {
    tubos.add(new DuplaDeTubos(width));
    ultimoPar = tActual;
  }
}

void borrarTubos() {
  for (int i = tubos.size()-1; i >= 0; i--) {
    if (tubos.get(i).seFueDePantalla()) {
      tubos.remove(i);
    }
  }
}

void chequearColisionesFlappy() {
  if (bird.pos.y + bird.radio > height || bird.pos.y - bird.radio < 0) {
    finDelJuego("FLAPPY BIRD - te estrellaste. Puntaje: " + puntajeFlappy);
  }
  for (DuplaDeTubos d : tubos) {
    if (d.colisionaCon(bird.pos, bird.radio)) {
      finDelJuego("FLAPPY BIRD - te estrellaste. Puntaje: " + puntajeFlappy);
    }
  }
}

void actualizarPuntajeFlappy() {
  for (DuplaDeTubos d : tubos) {
    if (d.paso(bird.pos.x)) {
      puntajeFlappy++;
    }
  }
}

void mostrarPuntajeFlappy() {
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text(puntajeFlappy, width/2, 50);
}


void iniciarPong() {
  pelotaPong = new Circulo(width/2, height/2, 10);
  paleta1 = new Cuadrado(sep, height/2);
  paleta2 = new Cuadrado(width-sep, height/2);
  paleta1.puntaje = 0;
  paleta2.puntaje = 0;
  estadoDelJuego = JUGANDO_PONG;
}

void jugarPong() {
  otroBackground();

  pelotaPong.mover();
  pelotaPong.contener();
  paleta1.mover(is_w, is_s);
  paleta2.mover(is_o, is_l);

  if (paleta1.colisiona(pelotaPong.pos, pelotaPong.radio)) {
    pelotaPong.rebotar();
    pelotaPong.separar(paleta1.pos);
  }
  if (paleta2.colisiona(pelotaPong.pos, pelotaPong.radio)) {
    pelotaPong.rebotar();
    pelotaPong.separar(paleta2.pos);
  }

  if (pelotaPong.pos.x < 0) {
    paleta2.puntaje++;
    pelotaPong = new Circulo(width/2, height/2, 10);
  }
  if (pelotaPong.pos.x > width) {
    paleta1.puntaje++;
    pelotaPong = new Circulo(width/2, height/2, 10);
  }

  mostrarPuntajePong();
  pelotaPong.mostrar();
  paleta1.mostrar();
  paleta2.mostrar();

  // condición de fin de partida: el primero que llega a 5 gana
  if (paleta1.puntaje >= 5) finDelJuego("PONG - ¡Ganó el Jugador 1 (W/S)!");
  if (paleta2.puntaje >= 5) finDelJuego("PONG - ¡Ganó el Jugador 2 (O/L)!");
}

void otroBackground() {
  fill(0, 30);
  rect(0, 0, width, height);
}

void mostrarPuntajePong() {
  fill(255, 15);
  textSize(256);
  textAlign(CENTER, CENTER);
  text(paleta1.puntaje, width/3, height/2);
  text(paleta2.puntaje, 2*width/3, height/2);
}


void finDelJuego(String mensaje) {
  mensajeGameOver = mensaje;
  estadoDelJuego = GAME_OVER;
}

void pantallaGameOver() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("GAME OVER", width/2, height/2 - 40);
  textSize(22);
  text(mensajeGameOver, width/2, height/2);
  text("Click para volver al menú", width/2, height/2 + 50);
}
