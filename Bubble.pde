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
  