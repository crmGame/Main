void playerPos() {
  player_x+=pxm;
  ybase = terrain_array.get(int(200+player_x));
  if (player_y >= ybase) {
    pym=0;
    player_y=ybase;
  } else {
    pym+=0.4;
  }
  if (keyPressed && key == ' ' && player_y>=pym) {
    
    pym = -4;
  }
  if (player_x<1 && pxm < 0) {
    player_x-=pxm;
  }
  player_y+=pym;
}

//////////////////////////////////////////////

void makePlayer() {
  beginShape();
  fill(200, 13, 74);
  vertex(0, 400);
  for (int i = 0; i < width; i++) {
    //point(i, ylist.get(i));
    vertex(i, terrain_array.get(int(i+player_x)));
  }
  vertex(400, 400);
  endShape();
}

//////////////////////////////////////////////

void userInput() {
  if (keyPressed) {
    if (key == 'd') {
      pxm = 7;
    }
    if (key == 'a') {
      pxm = -4;
    }
  } else {
    pxm = 5;
  }
  stroke(100);
}

