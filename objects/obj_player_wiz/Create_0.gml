//get Controlls-----------------------
control_setup()

x_speed = 0;
y_speed = 0;

face = 1;

move_dir = 0;
move_type = 0;
move_speed[0] = 2;
move_speed[1] = 3.5;

//Sprites---------------------------
idle_spr = spr_player_stay;
jump_spr = spr_player_jump;
run_spr = spr_player_run;
walk_spr = spr_player_walk;

//juming---------------------------
grav = 0.275;
term_vel = 4;
on_ground = true;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;

//Jump values for each jump
jump_hold_frames[0] = 18;
jump_speed[0] = -3.15;
jump_hold_frames[1] = 10;
jump_speed[1] = -2.85;

//coyote Time
//hangt ime
coyote_hang_frames = 2;
coyote_hang_timer = 0;
//jump buffer
coyote_jump_frames = 2;
coyote_jump_timer = 0;


//Collision Array-----------------------
collide_array = [obj_dirt,obj_gras_floor];


//Custom Function for player---------------
function set_on_ground(_val = true)
{
	if _val
	{
		on_ground = true;
		coyote_hang_timer = coyote_hang_frames;
	} else {
		on_ground = false;
		coyote_hang_timer = 0;
	}
}

