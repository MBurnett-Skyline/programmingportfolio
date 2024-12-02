class Powerup {
  int x, y, diam, speed;
  char type;
  String put;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = int(random(30, 80));
    speed = int(random(1, 5));
    int rand = int(random(3));
    if (rand == 0) {
      type = 'h';
    } else if (rand == 1) {
      type = 'a';
    } else if (rand == 2) {
      type = 't';
    }
  }

  //Member Methods

  void display() {
    if (type == 'h') {
      fill(255, 0, 0);
      put = "HEALTH";
    } else if (type == 'a') {
      fill(0, 255, 0);
      put = "AMMO";
    } else if (type == 't') {
      fill(0, 0, 255);
      put = "XTRA TURRET";
    }

    ellipse(x, y, diam, diam);
    fill(0);
    text(put, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + 100) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(SpaceShip s) {
    float d = dist(x, y, s.x, s.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
