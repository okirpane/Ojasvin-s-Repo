class Bubble
{
  float x;
  float y;
  float circWidth;
  float yspeed;
  Bubble(float tempD)
  {
    x = random(width);
    y = height;
    circWidth = tempD;
    yspeed = random(0.5, 2.5);
  }

  void display()
  {
    strokeWeight(4);
    stroke(#F8B195);
    noFill();
    ellipse(x, y, circWidth, circWidth);
  }

  void ascend()
  {
    y = y - yspeed;
    x = x + random(-2, 2);
    if (x > a && x < a+w && y > b && y < b+h )
    {
      yspeed = -1;
      stroke(#6C5B7B);
      strokeWeight(10);
      rect (a, b, w, h);
    }
  }
}

float a = 300;
float b = 300;
float w = 50;
float h = 50;
int total = 0;

Bubble[] bubbles = new Bubble[100];
void setup()
{
  size(600, 600);
  for (int i=0; i < bubbles.length; i++)
  {
    bubbles[i] = new Bubble(random(20, 40));
  }
}

void draw()
{
  background(#F67280); 
  rectMode(CENTER);
  stroke (#C06C84);
  strokeWeight(10);
  fill (#6C5B7B);
  rect (a, b, w, h);
  for (int i = 0; i < bubbles.length; i++)
  {
    bubbles[i].ascend(); 
    bubbles[i].display();
    //bubbles[i].gogo();
  }
}