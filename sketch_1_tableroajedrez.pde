int cant = 8;
int tam = 0;

void setup () {

  size (800,800);
tam = width / cant;
}

void draw () {
  
for(int i=0;i<cant;i++) {
  for(int j=0; j < cant; j++) {
   if((i+j) % 2 == 0) {
       fill(0);
    }
    else{
       fill(255);
    }  
  rect(i * tam, j*tam ,tam ,tam);
    } 
  }
}
