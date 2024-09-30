// Set the position of the default audio listener to the player's position, for positional audio
// with audio emitters (such as in obj_end_gate)
audio_listener_set_position(0, x, y, 0);

get_controls();

//Y Movement----------------------
//Gravaty----------
if coyote_hang_timer > 0
{
	coyote_hang_timer--;
} else {
	//apply gravaty to the player
	y_speed += grav;
	//we're no longer on the ground
	set_on_ground(false);
}

//rest Jump Variables
if on_ground
{
	jump_count = 0;
	coyote_jump_timer = coyote_jump_frames;
} else {
	coyote_jump_timer --;
	if jump_count == 0 && coyote_jump_timer <= 0 { jump_count = 1; }
}

//Initiate the Jump-----------------
if jump_key_buffered && jump_count < jump_max
{
	//rest the buffer
	jump_key_buffered = false;
	jump_key_buffer_timer = 0;
	//increase the jump hold Timer
	jump_count++;
	// set the jump hold timer
	jump_hold_timer = jump_hold_frames[jump_count-1];
	//Tell oureself we're no longer on the ground
	set_on_ground(false);
	coyote_jump_timer = 0;
}
//cut off the jump by relausing the jump button
if !space_key
{
	jump_hold_timer = 0;
}
//Jump based on the timer/holding the button
if jump_hold_timer > 0
{
	//constantly set the ySpeed to be jumping speed
	y_speed = jump_speed[jump_count-1];
	//count down the timer
	jump_hold_timer--;
}

//Y Collision-----------------------------------------
var _sub_pixel = 0.1;

if place_meeting( x , y + y_speed , obj_gras_floor)
{
	//Scoot up to floor precisely
	var _pixel_check = _sub_pixel * sign(y_speed);
	while !place_meeting(x  , y + _pixel_check ,obj_gras_floor)
	{
		y += _pixel_check;
	}
	
	//Bonk Code (Optional)
	/*if y_speed < 0
	{
		jump_hold_timer = 0;
	}*/
	
	//set yspedd to 0 to "collide"
	y_speed = 0;
}

if y_speed > term_vel 
{
	y_speed = term_vel;
}

if place_meeting(x,y+1 ,obj_gras_floor) && y_speed >= 0
{
	set_on_ground(true);
	sprite_index = idle_spr;
} /*else {
	set_on_ground(false);
}*/


// Finly Move
y += y_speed;

// sprite---------------------------
if !on_ground
{
	sprite_index =jump_spr;
}else if (right_key| left_key) && on_ground && run_key //abs( x_speed ) > 0
{
	sprite_index = run_spr;
}else if (right_key| left_key) && on_ground && !run_key //abs( x_speed ) > 0
{
	sprite_index = walk_spr;
	
}else {
	sprite_index = idle_spr;
}

mask_index = idle_spr;
