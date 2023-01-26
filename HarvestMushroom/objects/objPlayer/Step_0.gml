var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);

var _throw = keyboard_check(ord("X"));

//interact space

switch myFacing
{
	case FACING.WEST:
		myInteractZone.x = x+TILE_SIZE;
		myInteractZone.y = y;
	break;
	case FACING.SOUTH:
		myInteractZone.x = x;
		myInteractZone.y = y+TILE_SIZE;
	break;
	case FACING.EAST:
		myInteractZone.x = x-TILE_SIZE;
		myInteractZone.y = y;
	break;
	case FACING.NORTH:
		myInteractZone.x = x;
		myInteractZone.y = y-TILE_SIZE;
	break;
}


switch myState
{
	case STATE.IDLE:
		image_speed = 0;
		image_index = 0;
		targetX = x;
		targetY = y;
		
		if _left
		{
			image_xscale = -1;
			targetX -= TILE_SIZE_HALF;
			myFacing = FACING.EAST;
		}
		
		if _right
		{
			image_xscale = 1;
			targetX += TILE_SIZE_HALF;
			myFacing = FACING.WEST;
		}
		if _up
		{
			targetY -= TILE_SIZE_HALF;
			myFacing = FACING.NORTH;
		}
		
		if _down
		{
			targetY += TILE_SIZE_HALF;
			myFacing = FACING.SOUTH;
		}
	
	
		if _throw
		{
			
			switch myFacing
			{
				case FACING.WEST:
					var _mushroom_x = x-16;
					var _mushroom_y = y;
					var _mushroom_facing = FACING.EAST;
				break;
				case FACING.SOUTH:
					var _mushroom_x = x;
					var _mushroom_y = y-16;
					var _mushroom_facing = FACING.NORTH;
				break;
				case FACING.EAST:
					var _mushroom_x = x+16;
					var _mushroom_y = y;
					var _mushroom_facing = FACING.WEST;
				break;
				case FACING.NORTH:
					var _mushroom_x = x;
					var _mushroom_y = y+16;
					var _mushroom_facing = FACING.SOUTH;
				break;
			}
			
			with myInteractZone
			{
				if place_meeting(x, y, objMushroom)
				{
					var _mush = instance_place(x,y, objMushroom);
					with _mush
					{
						
						if !place_meeting(_mushroom_x,_mushroom_y, objWall)
						{
							myState = STATE.MOVE;
							x = _mushroom_x
							y = _mushroom_y
							myFacing = _mushroom_facing;
						}
					}
				}
			}
		}
		
		
		spriteX = lerp(spriteX, x, 0.5);
		spriteY = lerp(spriteY, y, 0.5);
		
		//check for collsion
		if x != targetX or y != targetY
		{
			if !place_meeting(targetX,targetY, objWall)
			{
				myState = STATE.MOVE;
			}
			else
			{
				if x < targetX and spriteX == x
					spriteX += 2;
					
				if x > targetX and spriteX == x
					spriteX -= 2;
					
				if y < targetY and spriteY == y
					spriteY += 2;
					
				if y > targetY and spriteY == y
					spriteY -= 2;
			}
		}
		

	break;
	
	case STATE.MOVE:
	
	image_speed = 0.2;
	x = targetX;
	y = targetY;
	
	spriteX = lerp(spriteX, x, 0.3);
	spriteY = lerp(spriteY, y, 0.3);
	
	if round(spriteX) == x and round(spriteY) == y
		myState = STATE.IDLE;
	
	break;
	
}

