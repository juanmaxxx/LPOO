void setup(){
 size(800, 800);
}

void draw(){
 background(255);
 
 int cant = 5;
 float y = height/2;
 float diam = 70;
 float crec = 70;
 float x = diam/2;
 
 for(int i = 0; i < cant; i++){

   ellipse(x, y, diam, diam);
   x += diam/2;
   diam += crec;
   x += diam/2;
 }
}
