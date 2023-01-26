
switch myState
{
	case STATE.IDLE:
	image_speed = 0;
	break;
	
	case STATE.MOVE:
	image_speed = 0.5;
	switch myFacing
	{
		case FACING.WEST:
			targetX = x+mySpeed;
			targetY = y;
		break;
		case FACING.SOUTH:
			targetX = x;
			targetY = y+mySpeed;
		break;
		case FACING.EAST:
			targetX = x-mySpeed;
			targetY = y;
		break;
		case FACING.NORTH:
			targetX = x;
			targetY = y-mySpeed;
		break;
	}
	
	if !place_meeting(targetX, targetY, objWall)
	{
		x = targetX;
		y = targetY;
	}
	else
	{
		myState = STATE.IDLE;	
	}
			
	break;
	
}


spriteX = lerp(spriteX, x, 0.5);
spriteY = lerp(spriteY, y, 0.5);