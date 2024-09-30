
//X Movement
//Direction
move_dir = -1;
face = -1;

move_type = run_key;

//Get X Speed
x_speed = move_dir * move_speed[move_type];

//X collision
var _sub_pixel = 0.5;

if place_meeting( x + x_speed , y , collide_array)
{
	//Scoot up to wall precisely
	var _pixel_check = _sub_pixel * sign(x_speed);
	while !place_meeting(x + _pixel_check , y ,obj_gras_floor)
	{
		x += _pixel_check;
	}	
	//set xspedd to 0 to "collide"
	x_speed = 0;
}

//final Move
x += x_speed;