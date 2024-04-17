// Andrei Jotic

Player p1;
boolean play;
PImage startScreen;

void setup() {
  size(500, 500);
  p1 = new Player(width/2);
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    image(startScreen, width/2, height/2);
    fill(27, 242, 75);
    p1.display();
    p1.move(mouseX);
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
