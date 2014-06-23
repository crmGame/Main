void setup() {
  size(400, 400);
  strokeWeight(1);
  stroke(255);
  terrain_array.add(float(200));
  initTerrain();
}

void draw() {
  stroke(255);
  playerPos();
  terrainGen();
  background(0);
  ellipse(200, player_y-10, 20, 20);
  makePlayer();
  userInput();
}
