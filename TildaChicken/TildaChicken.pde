PImage chicken;
int chickenSize; //Chicken Size (It's square so width equals height)
int chickenPosX; // This is the X Position of the chicken (usually centered)
int chickenPosY;//This is the Y Position of the chicken (adjust for jumps)

void setup() {
  size(500, 500);
  chicken = loadImage("tilda.png");
}

void draw() {
  background(0);
  chickenSize = (width + height)/15;
  chickenPosX = width/2;
  chickenPosY = height/2;
  chicken.resize(chickenSize, chickenSize);
  imageMode(CENTER);
  image(chicken, chickenPosX, chickenPosY);
}
