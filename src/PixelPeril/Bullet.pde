class Bullet {
  int x, y, w, h, speed;

  Bullet(int x, int y) {
    this.x = x;
    this.y = y;
    w = 6;
    h = 10;
    speed = 15;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Enemy e) {
    float d = dist(x, y, e.x, e.y);
    if (d<e.diam) {
      return true;
    } else {
      return false;
    }
  }
}
