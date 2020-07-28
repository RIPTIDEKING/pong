class Ball {  
  float x;
  float y;
  float speedX = 2;
  float speedY = 0;
  float maxY = 2.5;
  float r = 10;
  float speed = 3;

  Ball() {
    newTurn();
  }

  void newTurn() {
    x = y = width/2;
    float ang = random(-PI/3, PI/3);
    float temp = random(1);
    if(temp > 0.5){
    ang += PI;
    }
    speedX = 3*cos(ang);
    speedY = 3*sin(ang);
  }

  char update() {
    char retVal = 'n';
    if (x < r) {
      retVal = 'l';
      newTurn();
    } else if (x > width-r) {
      retVal = 'r';
      newTurn();
    }
    if (y < r || y > height-r) {
      speedY *= -1;
    }
    if (abs(speedY)> maxY) {
      speedY = maxY*(speedY/abs(speedY));
    }
    x += speedX;
    y += speedY;
    return retVal;
  }

  void show() {
    fill(255);
    circle(x, y, r);
  }
}
