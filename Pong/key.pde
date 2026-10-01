boolean is_w= false, is_s= false, is_o= false, is_l= false; 

void keyPressed(){
if (key=='w'||key =='W') is_w= true; 
if (key=='s'||key =='S') is_s= true; 
if (key=='o'||key =='O') is_o= true; 
if (key=='l'||key =='L') is_l= true; 
}
void keyReleased(){
if (key=='w'||key =='W') is_w= false; 
if (key=='s'||key =='S') is_s= false; 
if (key=='o'||key =='O') is_o= false; 
if (key=='l'||key =='L') is_l= false; 

}
