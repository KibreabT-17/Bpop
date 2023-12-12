
import ddf.minim.*;
import ddf.minim.spi.*;

Minim minim;
AudioPlayer player;
TimeBar timeBar;

PFont roMono;

char chArray[];
Bubble[] Bubbles;
color bg = color(100, 192, 100);
int score;
int timer;

void setup() {

  fullScreen();

  roMono = createFont("RobotoMono-Bold.ttf", 32);
  
  
  textFont(roMono);
  textAlign(CENTER, CENTER);


  timeBar = new TimeBar((width / 2)+160, 35, 300, 30, 2.5);
  
  Bubbles = new Bubble[13];
  chArray = new char[13];

  for (int i = 0; i < Bubbles.length; i++) {

    Bubbles[i] = new Bubble();
    chArray[i] = Bubbles[i].getChar();

    lowerBound += 100;
    upperBound += 100;
  }

  minim = new Minim(this);
  player = minim.loadFile("bubble_pop.wav");

  score = 0;
}

void draw() {
  background(220);

  if ( timeBar.maxTime > 0) {
    drawBubbles();
    drawScore();
    updateBubbles();
    drawTimeBar();
  } else {
    drawGameOver();
  }
  
  

}


void drawBubbles() {
  for (int i = 0; i < Bubbles.length; i++) {
    Bubbles[i].display();
  }
}


void drawScore() {
  fill(0);
  text("Score: " + score, width / 4, 50);
}


void updateBubbles() {
  for (int i = 0; i < Bubbles.length; i++) {
    Bubbles[i].update();

    if (Bubbles[i].isPopped()) {

      score++;
      Bubbles[i].reset();
      chArray[i] = Bubbles[i].getChar();
      timeBar.maxTime += timeBar.regenerationRate;
      timeBar.maxTime = constrain(timeBar.maxTime, 0, 100);

      timeBar.display();
    }

    if (Bubbles[i].isOutOfScreen()) {
      Bubbles[i].reset();
      chArray[i] = Bubbles[i].getChar();
    }
  }
}


void drawTimeBar() {

  timeBar.update();
  timeBar.display();
}



void drawGameOver() {
  fill(0);
  
  text("Game Over", width / 2, height / 2 - 50);
  text("Score: " + score, width / 2, height / 2);
  text("Press ENTER to play again", width / 2, height / 2 + 50);
}



void keyPressed() {
  if (keyCode == ENTER && timeBar.maxTime <= 0) {
    resetGame();
  }

  for (int i = 0; i < Bubbles.length; i++) {
    if (key == chArray[i]) {

      Bubbles[i].pop();
      player.loop(0);
      
      break;
    }
  }
}


void resetGame() {
  score = 0;
  timeBar.maxTime = 100;

  for (int i = 0; i < Bubbles.length; i++) {
    Bubbles[i].reset();
    chArray[i] = Bubbles[i].getChar();
  }
}




void stop() {

  player.close();
  minim.stop();
  super.stop();
}
