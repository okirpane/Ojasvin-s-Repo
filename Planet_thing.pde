class Planet {
  float radius;
  float distance;
  Planet[] planets;
  float angle;
  float orbitspeed;
  int [] red = {31,243,240,216,174,73,35,208};
  int [] green = {70,199,168,69,195,195,73,117};
  int [] blue = {187,63,74,44,171,208,165,101};

Planet(float r, float d, float o) {
  radius = r;
  distance = d;
  angle = random(TWO_PI);
  orbitspeed = o;
  fill (random(red[0],red[7]), random(green[0],green[7]), random(blue[0],blue[7]));

  //println(angle);
}

void orbit() {
  angle = angle + orbitspeed;
  if (planets != null) {
    for (int i = 0; i < planets.length; i++) {
      planets[i].orbit();
    }
  }
}

void spawnMoons(int total, int level) {
  planets = new Planet[total];
  for (int i = 0; i < planets.length; i++) {
    float r = radius/(level*2);
    float d = random(50, 150);
    float o = random(-0.1, 0.1);
    planets[i] = new Planet(r, d/level, o);
    if (level < 3) {
      int num = int(random(0, 4));
      planets[i].spawnMoons(num, level+1);
    }
  }
}

void show() {
  pushMatrix();
  noStroke();
  rotate(angle);
  translate(distance, 0);
  ellipse(0, 0, radius*2, radius*2);
  if (planets != null) {
    for (int i = 0; i < planets.length; i++) {
      planets[i].show();
    }
  }
  popMatrix();
}
}

Planet sun;

void setup() {
  size(600, 600);
  sun = new Planet(50, 0, 0);
  sun.spawnMoons(5, 1);
}

void draw() {
  background(11, 7, 12);
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
}