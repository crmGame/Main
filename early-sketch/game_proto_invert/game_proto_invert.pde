ArrayList <Float> terrain_array = new ArrayList<Float>();
/*
can be decalared in the void setup()
declare here if it doesn't change, static
declare in the setup to create new array, dynamic
*/

float terrain = 200;
/*
terrain value
indicates the current amount of terrain is occupying the window
*/

float wta;
/*
width terrain add value
adds this value to the current terrain location
use 1 for seamless
use > 1 for drops, cut, etc
*/

int player_x = 200;
/*
x pos of the player
200 defaults it into the middle of screen
*/

float player_y = 200;
/*
x pos of the player
200 defaults it into the middle of screen
*/

float pxm, pym = 0, ybase;
/*
pxm = player x position move
pym = player y position move
ybase = floor for player y pos

as the terrain is generated, it creates this floor for the player
need to find a way to separate these variables to use for collision
*/



