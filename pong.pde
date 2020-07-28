
Ball ball;
Player p1, p2;
int gameMod = 0;

void setup() {
  size(500, 500);
  ball = new Ball();
  p1 = new Player(40, height/2-30, 5, gameMod);
  p2 = new Player(width - 50, height/2-30, 5, gameMod);
}

void keyPressed() {
  if (key == 'w') {
    p1.control(-1);
  } else if (key == 's') {
    p1.control(1);
  }
  if (keyCode == UP) {
    p2.control(-1);
  } else if (keyCode == DOWN) {
    p2.control(1);
  }
  if (key == ' ') {
    ball.x = ball.y = 250;
  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    p1.control(0);
  }
  if (keyCode == UP || keyCode == DOWN) {
    p2.control(0);
  }
}

void draw() {
  background(0);
  textSize(30);
  text(p1.score, 70, 50);
  text(p2.score, width-90, 50);
  char chk = ball.update();
  if (chk == 'l') {
    p2.score ++;
  } else if (chk == 'r') {
    p1.score++;
  }
  ball.show();
  p1.collide(ball);
  //p1.y = ball.y-40;
  p1.update();
  p1.show();
  p2.collide(ball);
  p2.update();
  p2.show();
}
