int rightX=190;
int rightY=180;
int h=70;
int w=70;

float x = 200;
float y = 200;
float Size;
boolean Clicked=false;
void setup(){
  size(500,500);
}
void draw(){
  background(#72B5E8);
  fill(#9C7EFF);
  noStroke();
  ellipse(rightX,rightY,w,h);
  if(mouseX > rightX - (w/2) && mouseX < rightX + (w/2)){
    fill(#867EFF);
    noStroke();
  ellipse(rightX,rightY,w,h);
  }
  if(Clicked==true){
float randX = random(-3,3);
float randY = random(-3,3);
float randSize = random(-3,3);
color randCol = color(random(255),random(255),random(255));
 x = x+randX;
 y = y+randY;
  Size = Size + randSize;
 circles(x, y,Size,randCol);
}
}
void circles(float x, float y, float size, color c) {
 fill(c);
 ellipse(x, y, size, size);
} 
    
void mouseClicked(){
  if (mouseX>rightX-(w/2)&&mouseX<rightX+(w/2)){
    Clicked=true;
  }}
    