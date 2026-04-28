
boolean puertaAbierta = false;
boolean ventanaSupAbierta = false;
boolean ventanaInfAbierta = false;
boolean ventanaAticoAbierta = false;

void setup() {
  size(800, 600);
}

void draw() {
  background(100, 200, 255); 


  fill(24, 150, 50);

  rect(0, 350, 800, 250); 


  fill(90, 40, 0);
  rect(250, 150, 300, 300);

  
  fill(120, 40, 0);
  triangle(400, 50, 550, 150, 250, 150);

 

 
  if (puertaAbierta) {
    
    fill(150); 
    rect(365, 360, 60, 90);
  } else {
    
    fill(120, 40, 0);
    rect(365, 360, 60, 90);
    fill(255, 200, 0); 
    ellipse(412, 410, 10, 10);
  }

  if (ventanaSupAbierta) {
    fill(150); 
    rect(280, 200, 60, 60);
  } else {
    fill(17, 17, 132); 
    rect(280, 200, 60, 60);
  }

  if (ventanaInfAbierta) {
    fill(150); 
    rect(460, 340, 60, 60);
  } else {
    fill(17, 17, 132); 
    rect(460, 340, 60, 60);
  }

  if (ventanaAticoAbierta) {
    fill(150); 
    ellipse(399, 100, 50, 50);
  } else {
    fill(17, 17, 132); 
    ellipse(399, 100, 50, 50);
  }
}

void mousePressed() {
  
  
  if (mouseX > 407 && mouseX < 417 && mouseY > 405 && mouseY < 415) {
    puertaAbierta = !puertaAbierta; 
  }
  
  
  else if (mouseX > 280 && mouseX < 340 && mouseY > 200 && mouseY < 260) {
    ventanaSupAbierta = !ventanaSupAbierta;
  }
  
  else if (mouseX > 460 && mouseX < 520 && mouseY > 340 && mouseY < 400) {
    ventanaInfAbierta = !ventanaInfAbierta;
  }
  
  float d = dist(mouseX, mouseY, 399, 100);
  if (d < 25) { 
    ventanaAticoAbierta = !ventanaAticoAbierta;
  }
}
