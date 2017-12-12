// snake variables 
int amoebasize=1; //size of the snake 
int MAXLENGTH=1011; 
int headx[]=new int[MAXLENGTH]; //xlocation 
int heady[]=new int[MAXLENGTH]; //ylocation 
int i;
float x;
float y;
boolean gameStart = false;
float easing = 0.004;
int num_bubbles;
Bubble[] bubbles;

//FOOD VARIABLES 
float yumx=random(20, 1000); 
float yumy=random(20, 1000); 

//SPEED 
//int speed;         
int xspeed, yspeed; 
color filter_hue;
void setup () { 
   //fullScreen();
  size (1500, 1500); 
  noTint();
  filter_hue = 178;
  num_bubbles = (int)random(20, 50);
  bubbles = new Bubble[num_bubbles];
  for (int i=0; i<num_bubbles; i++ ) {
    bubbles[i] = new Bubble();
  }
  headx[0] = 250; 
  heady[0] = 250; 
  // SNAKE HEAD BEGINS UNMOVING. 
  //speed=1;           
  xspeed=0;     
  yspeed=0; 
  colorMode(HSB, 360, 100, 100);
  noStroke();
  smooth(8);
} 

void draw () { 
  noTint();
  background(255);
  for (int i=0; i<num_bubbles; i++ ) {
    bubbles[i].move_bubble();
    bubbles[i].draw_bubble();
  }
  fill(filter_hue, 100, 100, 60);
  noStroke();
  rect(width/2, height/2, width, height);
  if ( frameCount%10 == 0 ) {
    filter_hue = ++filter_hue%360;
  }
  if (gameStart) {
    fill(255);
    textSize(50);
    text(amoebasize, 40, 45);
    fill(255);
  textSize(32);
  text("The Life of an Amoeba", width/2-100, 50);
    fill(255, 0, 0, 100);
    
    ellipseMode(CENTER); 
    ellipse(yumx, yumy, 35, 35); 

    for (int i =0; i < amoebasize; i++) { 
      //tail 

      fill(200, 20, 200, 50); 
      rectMode(CENTER); 
      ellipse(headx[1], heady[1], 100+(amoebasize*10), 100+(amoebasize*10));
      fill (#5C8EFF,50);
      ellipse(headx[1], heady[1], 30+(amoebasize*5), 30+(amoebasize*5));

    } 
    headx[0]=headx[0]+xspeed; 
    heady[0]=heady[0]+yspeed; 

    for (int i = amoebasize; i > 0; i--) { 
      headx[i] = headx[i-1]; 
      heady[i] = heady[i-1];
    } 
    // FOOD 
    if (amoebasize<headx.length) 
    { 
      if (headx[0]>=yumx-20 && headx[0]<=yumx+20 && heady[0]>=yumy-20 && heady[0]<yumy+20) 
      { 
        yumx=(random(20, 1500)); 
        yumy=(random(20, 1500)); 

        amoebasize++; 

        if (i!=1) 
        { 
          headx[amoebasize -1] = headx[amoebasize - 2] - 0; 
          heady[amoebasize -1] = heady[amoebasize - 2] - 20;
        }
      }
    } 
    if (amoebasize >=5) {
      float targetX = headx[1];
      float dx = targetX - x;
      x += dx * easing;

      float targetY = heady[1];
      float dy = targetY - y;
      y += dy * easing;
      fill(#E84455,100);
      ellipse(x, y, 100 + (amoebasize*5), 100 + (amoebasize*5));
      fill(#ADAAA6,150);
      ellipse(x, y, 400 + (amoebasize*5), 400 + (amoebasize*5));
      if (dist(x, y, headx[1], heady[1]) <= 250+(amoebasize*5)) {
        gameStart = false;
        textSize(200);
        text("Game_Over", width/2,height/2);
        text("The Life of an Amoeba", width/2, height/2+100);
        amoebasize = 1;
        headx[0] = 250; 
        heady[0] = 250;
      }
    }
  }

}
void mousePressed(){
  gameStart = !gameStart;
}


void keyPressed() 
{ 
  // ARROW KEYS OR LETTER KEYS PRESSED. 
  // RIGHT & LEFT HAND CONTROLS. 

  if (keyCode==UP || key == 'w') 
  { 
    xspeed=0; 
    yspeed=-7;
  } else if (keyCode==DOWN || key =='s') 
  { 
    xspeed=0; 
    yspeed=7;
  } else if (keyCode==LEFT || key=='a') 
  { 
    xspeed=-7; 
    yspeed=0;
  } else if (keyCode==RIGHT || key =='d') 
  { 
    xspeed=7; 
    yspeed=0;
  }
} 

//class
class Bubble {

  float x, y, size, speed, direction, wander;
  color bubble_col = color(184, 8, 95, 9);

  Bubble() {
    x = random(width);
    y = random(height);
    size = random( 10, 30 );
    speed = random(1, 4 );
    direction = random( -PI/4, PI/4 );
    wander = 0.003; // random( 0.001, 0.008 );
  }

  void move_bubble() {
    x = x + speed*cos(direction);
    y = y + speed*sin(direction);
    direction += wander;
    if ( x < -size/2 ) x = width + size/2 ; 
    if ( x > width + size/2 ) x = -size/2 ;
    if ( y < -size/2 ) y = height + size/2 ; 
    if ( y > height + size/2 ) y = -size/2;
  }

  void draw_bubble() {
    noFill();
    stroke(bubble_col);
    for ( int i=0; i<4; i++ ) {
      strokeWeight(size/(i+1));
      ellipse(x, y, size, size);
    }
  }
}