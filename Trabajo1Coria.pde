void setup(){
  size(900, 600);
  background(200);
}

void draw(){
  int w = width;
  int h = height;
  stroke(0,30);
  
  line(mouseX, mouseY, 0, 0);
  line(mouseX, mouseY, w, 0);
  line(mouseX, mouseY, 0, h);
  line(mouseX, mouseY, w, h);
}
