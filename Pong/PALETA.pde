class Paleta {
  PVector pos;
  int tx = 10, ty= 40;
  int puntaje = 0 ; 

  Paleta(float columna) {
    pos = new PVector(columna, height/2);
  }

  void mostrar() {
    rectMode(RADIUS);
    fill(255,0,map(pos.x, 0, width, 0, 255));
    rect(pos.x, pos.y, tx, ty);
  }

  void mover(boolean up, boolean down) {
    if (up) pos.y -=7;
    if (down) pos.y +=7;
    pos.y = constrain(pos.y, 0, height);
  }
 boolean chocaCon(PVector otraPos, float r){
   PVector PMC = new PVector(0,0);
   
   if (otraPos.x < pos.x-tx) PMC.x= pos.x-tx;
   else if (otraPos.x > pos.x+tx) PMC.x= pos.x+tx;
   else  PMC.x= otraPos.x;
   
   if (otraPos.y < pos.y-ty) PMC.y= pos.y-ty;
   else if (otraPos.y > pos.y+ty) PMC.y= pos.y+ty;
   else  PMC.y= otraPos.y;
   
   return ( PMC.dist(otraPos)<r); 
}
  
}
