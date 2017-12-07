class Food {
  float xpos;
  float ypos;
  float moveX;
  float moveY;
  int c = 0;
  float offSet=TWO_PI/num;
  boolean win = false;
  boolean doOnce = false;
  float easing = 0.05 ;
  float x ;
  float y ;
  Food(float xpos_, float ypos_, float moveX_, float moveY_) {
    xpos = xpos_;
    ypos = ypos_;
    moveX = moveX_;
    moveY = moveY_;
  }
  void display() {
    c = 50;
    pushMatrix();
    noStroke();
    //translate(width/2,height/2) ;
    rotate(random(-PI, PI));
    //fill(#FFC7C5,100);
    fill(255,0,0) ;
    ellipse(xpos, ypos, 100, 10);
    popMatrix();
  }
  void move() {
    xpos = xpos + random(-1, 1);
    ypos = ypos + random(-1, 1);
    xpos = constrain(xpos, 0, width);
    ypos = constrain(ypos, 0, height);
    x = (1 - easing)*oldx+easing*mouseX;
    y = (1-easing)*oldy+easing*mouseY;
    //println("xPosition : " + (xpos)) ;
    //println("yPosition : " + (ypos+200) ) ;
    println(dist(mouseX, mouseY, xpos, ypos)) ;
    //println(dist( map(sin(theta-offSet*2), -1, 1, 20, 40)+5, 10, xpos+400, ypos+300)) ;
    //println(100+sz) ;
    if (dist(width-mouseX, height-mouseY, xpos, ypos)< 50){
      win = true; 
      
    }else{
      win = false;
      doOnce = true;
    }
    if (win == true && doOnce == true){
      oldscore++;
      doOnce = false;
    }
    /*if (xpos > width) {
     xpos = 0;
     }
     if (ypos > height) {
     ypos = 0;
     }*/
     oldx = x;
     oldy = y;
  }
  
  float getXPos() {
    return xpos ;
  }
   float getYPos() {
    return ypos ;
  }
}