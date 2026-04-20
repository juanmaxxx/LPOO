void setup() {
  size(800, 800);
}

void draw() {
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    line(width - pmouseX, pmouseY, width - mouseX, mouseY);
    line(pmouseX, height - pmouseY, mouseX, height - mouseY);
    line(width - pmouseX, height - pmouseY, width - mouseX, height - mouseY);
    }
}
