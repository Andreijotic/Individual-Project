class Player {
  int x, w, health, ammo;
  PImage player;
  
  Player (int x) {
    this.x = x;
    w = 50;
    health = 100;
    ammo = 100;
    player = loadImage("Character1.png");
  }
  
  void display() {
    imageMode(CENTER);
    player.resize(w,w);
  }
  
  void move(int x) {
    image(player, x, 400);
  }
  
  boolean fire() {
    if (ammo > 0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Enemy e) {
    float d = dist(p1.x+-20, 400, e.x, e.y);
    if (d < e.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  
}
