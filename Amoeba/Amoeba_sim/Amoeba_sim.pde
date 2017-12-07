// color #F28327
PFont myFont;
int frames=100, num=200, sz=2;
float theta = 50;
float x;
float y;
int score;
int oldscore = 0;
float oldx;
float oldy;
float easing = 0.05;
boolean rel = false;
boolean detect = false;
Food[] food = new Food[1];

void setup() {
  size(1500, 1500);
  //fullScreen();
  myFont = createFont("Roboto-Black", 50);
  for (int i = 0; i < food.length; i++) {
    //food[i] = new Food(random(0, 1500), random(0, 1500), 2, 20);
    food[i] = new Food(200,200, 2, 10);
  }
  noStroke();
  smooth();
}

void draw() {
  randomSeed(125);
  background(20);
  for (int i = 0; i < food.length; i++) {
    food[i].move();
    food[i].display();
  }
  if (rel == true) {
    for (int i = 0; i < food.length; i++) {
      food[i].move();
      food[i].display();
    }
  }
  textSize(32);
  textFont(myFont);
  fill(#8FFFFF);
  text(oldscore, 30, 40); 
  if (rel == true) {
    x = (1 - easing)*oldx+easing*mouseX;
    y = (1-easing)*oldy+easing*mouseY;
  }
  float r=0;
  noStroke();
  fill(#457689);
  for (int i=0; i<=num; i++) {
    float offSet=TWO_PI/num*i;
    pushMatrix();
    //translate (x = width/2, y = height/2);
    translate(x, y);
    rotate(r);
    float d =  map(sin(theta-offSet*2), -1, 1, 20, 40);
    //println(d + 5) ; 
    //println(food[0].getXPos()) ;
    //println(food[0].getYPos()) ;
    for (int j=0; j<100; j++) {
      float x = random(20, 150);
      ellipse(d+5+x, 10+y, sz, sz);
      ellipse(x+d-10, 200, sz, sz);
    }
    r+=TWO_PI/num;
    popMatrix();
  }
  theta += TWO_PI/frames;
  oldx = x;
  oldy = y;
  fill(0,255,0) ;
  //ellipse(mouseX, mouseY, sz,sz) ;
  

}

void mouseReleased() {
  rel = !rel;
}