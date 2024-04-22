// Andrei Jotic

Player p1;
boolean play;
PImage startScreen;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Timer eTimer;
int rTime;
int enemiesPassed;
int score;

void setup() {
  size(500, 500);
  p1 = new Player(width/2);
  rTime =  2000;
  eTimer = new Timer(rTime);
  eTimer.start();
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    image(startScreen, width/2, height/2);
    fill(27, 242, 75);
    p1.display();
    p1.move(mouseX);

    // enemies
    if (eTimer.isFinished()) {
      enemies.add(new Enemy(int(random(width)), -100));
      eTimer.start();
    }

    // render enemies
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      if (e.reachedBottom()) {
        enemiesPassed++;
        enemies.remove(e);
        score = score - 100;
      } else {
        e.display();
        e.move();
      }

      if (p1.intersect(e)) {
        p1.health -=e.diam /5;
        score+=e.diam / 2;
        enemies.remove(e);
      }
    }

    // render bullets
    for (int i = 0; i<bullets.size(); i++) {
      Bullet b = bullets.get(i);
      for (int j = 0; j < bullets.size(); j++) {
        Enemy e = enemies.get(j);
        if (b.intersect(e)) {
          score += e.diam;
          enemies.remove(e);
          bullets.remove(b);
        }
      }
      if (b.reachedTop()) {
        bullets.remove(b);
      } else {
        b.display();
        b.move();
      }
    }
  }
}
void startScreen () {
  startScreen = loadImage("background.png");
  startScreen.resize(width, height);
  imageMode(CENTER);
  image(startScreen, width/2, height/2);
  textAlign(CENTER);
  fill(0);
  textSize(50);
  text("Welcome to Pixel Peril", width/2, 100);
  text("Click to play...", width/2, 300);
  if (mousePressed) {
    play=true;
  }
}
