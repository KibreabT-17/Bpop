int lowerBound = 20;
int upperBound = 120;

String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";


class Bubble {
  float br;
  float bg;
  float bb;
  float x;
  float y;
  float resetX;

  float radius;
  boolean popped;
  boolean outOfScreen = false;
  int randomIndex;
  char randomChar;
  int step = 1;

  Bubble() {
    br = random(100, 200);
    bg = random(100, 200);
    bb = random(100, 200);
    x = random(lowerBound, upperBound);
    y = random(height/2+50, height);
    resetX = x;
    radius = random(25, 50);


    randomIndex = (int) random(alphabet.length());
    randomChar = alphabet.charAt(randomIndex);

    popped = false;
  }

  void display() {
    if (!popped) {
      noStroke();
      fill(br, bg, bb);
      ellipse(x, y, radius * 2, radius * 2);
      fill(0);

      text(randomChar, x, y);
    }
  }

  void update() {
    if (!popped) {
      y -= step;
    }

    if (y < -radius) {
      outOfScreen = true;
    }
  }

  


  void pop() {
    popped = true;
  }


  boolean isPopped() {
    return popped;
  }

  boolean isOutOfScreen() {
    return outOfScreen;
  }


  void reset() {
    x = resetX;
    y = random(height/2+50, height);
    br = random(100, 200);
    bg = random(100, 200);
    bb = random(100, 200);
    randomIndex = (int) random(alphabet.length());
    randomChar = alphabet.charAt(randomIndex);
    popped = false;
    outOfScreen = false;
    step = 1;
  }

  void disappear() {

    step = 0;
    y = height + 110;
    popped = false;
  }


  char getChar() {

    return randomChar;
  }
}
