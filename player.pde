
class Player {

  float x, y;
  float ySpeed;
  float len = 60;
  float wid = 10;
  float mul = 0;
  int score = 0;
  int mod;

  Player(float xC, float yC, float ys, int md) {
    this.x = xC;
    this.y = yC;
    this.ySpeed = ys;
    this.mod = md;
  }

  void show() {
    fill(255);
    noStroke();
    rect(x, y, wid, len, 5);
  }

  void update() {
    y = y + (mul*ySpeed);
    y = constrain(y, 0, height-len);
  }

  void control(int num) {
    mul = num;
  }

  void modSet(Ball b, boolean right) {
    if (mod == 0) {
      float diff = b.y-y;
      float ang = map(diff, 0, len, -PI/3, PI/3);

      if (right) {
        ang = -(ang + PI);
      }

      b.speedX = b.speed * cos(ang);
      b.speedY = b.speed * sin(ang);
    } else if (mod == 1) {
      b.speedX *= -1; 
      b.x += abs(b.speedX);
      if (right) {
        b.x += -abs(b.speedX);
      }
      b.speedY += ySpeed*mul;
    }
  }

  void collide(Ball b) {
    if (b.x-x <= wid+b.r && b.x-x > 0) {
      //left player
      if (b.y-y >0 && b.y-y < len) {
        modSet(b, false);
      }
    } else if (x-b.x <= b.r && b.x-x < 0) {
      //right player
      if (b.y-y >0 && b.y-y < len) {
        modSet(b, true);
      }
    }
  }
}
