void setup(){
  size(800, 600);
}


void draw(){
  if (mousePressed){
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  println("Pos actual:", mouseX, mouseY, "Pos anterior", pmouseX, pmouseY);
}
