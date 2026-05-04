int []hlinea;
int i=0;
int x=0;
void setup (){

  size(800,600);
  hlinea = new int [width];
  for (i=0; i<width; i++){
   hlinea[i] = height/2;
  }
  
}void draw (){
for(i=0; i<width; i++){
line (i,hlinea[i],i,height);  
} actualizararray(); 

}
void actualizararray() {
if(mousePressed){
  int x = constrain(mouseX,0,width-1);
hlinea[x]=mouseY;
}
  
}
