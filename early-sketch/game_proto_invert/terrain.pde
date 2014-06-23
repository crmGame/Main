void initTerrain() {
  for(int j = 0; j < width/30+1; j++) {
        if((terrain < 30 || terrain > height-30) == false){
      wta=random(-1, 1);
        }
        else {
          if(terrain < 75) {
            wta = 1;
          }
          if(terrain > height-75) {
            wta = -1;
          }
        }
      for(int i = 0; i < 30; i++) {
        terrain+=wta;
        terrain_array.add(terrain);
      }
      }
}
/*
terrain init
generates the terrain during setup()
performs a loop to generate the terrain content
uses "terrain" variable as a carrier

since wta is set to either 1 or -1,
it will only increment one pixel at a time

for each terrain variable created,
it gets stored in the terrain_array list
and then moves on to the next

ideas:
-change from 30 as arbitrary number
--we'll want to implement a function here to create variable terrain
--specifically to follow the diagonal movement

think of it this way
the terrain variable is the height value
it is re written as terrain + wta (which could be 1 or -1)
so the new value is a new increment at a different height
*/


//////////////////////////////////////////////

void terrainGen() {
  if(terrain_array.size() < player_x+401) {
        for(int j = 0; j < width/30+2; j++) {
        if((terrain < 30 || terrain > height-300) == false){
      wta=random(-1, 1);
        }
        else {
          if(terrain < 50) {
            wta = 1;
          }
          if(terrain > height-50) {
            wta = -1;
          }
        }
      for(int i = 0; i < 30; i++) {
        terrain+=wta;
        terrain_array.add(terrain);
      }
      }
  }
  
}

/*
generates the terrain in the draw function
compares the terrain_array size with the player value (+400, for width)

adds the wta value at the movement speed to the terrain,
to procedurally generate the new content
*/
