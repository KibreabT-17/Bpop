class TimeBar {
  float x, y;
  float width, height;
  float maxTime;
  float regenerationRate;

  TimeBar(float x, float y, float width, float height, float regenerationRate) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.maxTime = 100; // Initial health value
    this.regenerationRate = regenerationRate;
  }

  void display() {

    float red = map(maxTime, 0, 100, 255, 0);
    float green = map(maxTime, 0, 100, 0, 255);
    float blue = 0;


    fill(255);
    rectMode(CORNER);
    rect(x, y, width, height);


    float timeBarWidth = map(maxTime, 0, 100, 0, width);
    fill(red, green, blue);
    rect(x, y, timeBarWidth, height);
  }


  void update() {

    maxTime -= 0.09;
    maxTime = constrain(maxTime, 0, 100);
  }
}
