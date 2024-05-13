class Enemy {
  int x, y, diam, speed;
  PImage enemy;

  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(50, 100));
    speed = int(random(1, 10));
    enemy = loadImage("zombie.png");
  }

  void display() {
    imageMode(CENTER);
    enemy.resize(diam,diam);
    image(enemy,x,y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if(y>900) {
      return true;
    } else {
      return false;
    }
  }
}
