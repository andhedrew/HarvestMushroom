targetX = 0;
targetY = 0;

spriteX = x;
spriteY = y;

#macro TILE_SIZE 16;
#macro TILE_SIZE_HALF 8;

enum STATE
{
	IDLE,
	MOVE,
	
}

enum FACING
{
	WEST,
	SOUTH,
	EAST,
	NORTH
	
}

myFacing = FACING.WEST;
myState = STATE.IDLE;
image_speed = 0;
image_index = 0;

myInteractZone = instance_create_depth(x,y,depth,objInteractZone);