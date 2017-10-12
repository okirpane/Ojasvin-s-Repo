PImage bugs;
Player jim; 

boolean upPressed = false; 
boolean downPressed = false; 
boolean leftPressed = false; 
boolean rightPressed = false; 


void setup() { 
  size(1000, 1000);  
  smooth(); 
  bugs = loadImage("bug.png");
  jim = new Player();
}

void draw() { 

  background(#FF667A); 
  jim.update();
}

class Player { 

  float x; 
  float y; 

  float speed = 4; 

  Player() {
    x = width/2; 
    y = height/2;
  }

  void update() {

    if(leftPressed) x-=speed; 
    else if(rightPressed) x+=speed;   
    
    if (upPressed) y-=speed; 
    else if (downPressed) y+=speed;   


    fill(28, 116, 111);
    bugs.resize(100,100);
    image(bugs, x, y);
    
  }
}

void keyPressed() { 

  if (key == CODED) {
    if (keyCode == UP) {
      bugs = loadImage("bug.png");
      upPressed = true;
    } 
    else if (keyCode == DOWN) { 
      bugs = loadImage("bug2.png");
      downPressed = true;
    } 
    else if (keyCode == LEFT) {
      bugs = loadImage("bug7.png");
      leftPressed = true;
    } 
    else if (keyCode == RIGHT) { 
      bugs = loadImage("bug8.png");
      rightPressed = true;
    }
  }
}

void keyReleased() { 

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    } 
    else if (keyCode == DOWN) { 
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    } 
    else if (keyCode == RIGHT) { 
      rightPressed = false;
    }
  }
}