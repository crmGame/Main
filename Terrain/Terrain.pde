int xVal;
int yVal;
int[] rNumbers;
int yMemory;
int chickenPosY;
int chickAccum;
int chickposition;
int speed;



void setup() {
  size(500, 500);
  xVal = 0;
  yVal = height/2;
  //frameRate(25);
  background(255);
  rNumbers = new int[height];
  for (int i=0; i < height; i++) {
    rNumbers[i] = int(random(0,2));
  }
  chickposition = int(width/3.8);
  speed = 2;

}

void draw() {
  fill(255, 30);
  rect(0,0,width,height);
  terrainMove();
  terrain();
  fill(255,0,0);
  ellipse(chickposition, height/2 + chickAccum - 12 , 20, 20);
  
}

void terrain() {
  for(int i=0; i<width; i++){
    xVal = i;
    if (i == 0) {
      yVal = height/2 + yMemory;}
      else {
      yVal = yVal + rNumbers[i];
      }
    beginShape(POINTS);
    vertex(xVal, yVal);
    endShape();

  }
}

void terrainMove() {
  yMemory = rNumbers[0];
  chickAccum = 0;
  for (int i=0; i <chickposition; i++)
  {chickAccum = chickAccum + int(rNumbers[i]);}
  for (int i=0; i < (height - speed); i++) {
    rNumbers[i] = rNumbers[i+speed];
  }
  rNumbers[499] = int(random(0,2));


}
