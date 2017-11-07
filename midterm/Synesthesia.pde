import processing.pdf.*;
float speed = -1;
int b;
void setup(){
  size(1000,1000);
  beginRecord(PDF, "Ananya.pdf");
  background(255);
  noStroke();
}

void draw(){
  if (key == 'a'){
    add();
    fill(#64718D);
  }
  if(key == 'b'){
    add();
    fill(#4F3955);
  }
  if(key == 'c'){
    add();
    fill(#75556F);
  }
  if(key == 'd'){
    add();
    fill(#7E393D);
  }
  if(key == 'e'){
    add();
    fill(#73698F);
  }
  if(key == 'f'){
    add();
    fill(#955033);
  }
  if(key == 'g'){
    add();
    fill(#E68877);
  }
  if(key == 'h'){
    add();
    fill(#EFC183);
  }
  if(key == 'i'){
    add();
    fill(#B75E51);
  }
  if(key == 'j'){
    add();
    fill(#E69A5A);
  }
  if(key == 'k'){
    add();
    fill(#527C83);
  }
  if(key == 'l'){
    add();
    fill(#304D55);
  }
  if(key == 'm'){
    add();
    fill(#7DA9A4);
  }
  if(key == 'n'){
    add();
    fill(#C5ECCD);
  }
  if(key == 'o'){
    add();
    fill(#DEF2CC);
  }
  if(key == 'p'){
    add();
    fill(#2D2732);
  }
  if(key == 'q'){
    add();
    fill(#5A676C);
  }
  if(key == 'r'){
    add();
    fill(#06060F);
  }
  if(key == 's'){
    add();
    fill(#C4C2D9);
  }
  if(key == 't'){
    add();
    fill(#034E7B);
  }
  if(key == 'u'){
    add();
    fill(#73698F);
  }
  if(key == 'v'){
    add();
    fill(#64718D);
  }
  if(key == 'w'){
    add();
    fill(#4F3955);
  }
  if(key == 'x'){
    add();
    fill(#7E393D);
  }
  if(key == 'y'){
    add();
    fill(#75556F);
  }
  if(key == 'z'){
    add();
    fill(#E69A5A);
  }
  if(key == ' '){
    add();
    fill(255);
  }
  if(key == ','){
    add();
    fill(#E68877);
  }
  if(key == '.'){
    add();
    fill(#B75E51);
  }
  if(key == '"'){
    add();
    fill(#EFC183);
  }
  if (key == ENTER){
    endRecord();
  }
  rect(35+speed,35 + b,20,50);
}
  
  void add(){
    speed = speed + 3;
    if(speed >= 855){
      speed = 0;
      b += 50;}
    if (b >= 855){
      fill(255);
    }
  }
  