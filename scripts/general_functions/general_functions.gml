function control_setup()
{
	buffer_time = 3;
	
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}

function get_controls(){

	right_key = keyboard_check(vk_right) + keyboard_check(ord("D")) + gamepad_button_check_pressed(0,gp_padr);
		right_key = clamp( right_key , 0 ,1);
	left_key = keyboard_check(vk_left) + keyboard_check(ord("A")) + gamepad_button_check_pressed(0,gp_padl);
		left_key = clamp( left_key , 0 ,1);
	run_key = keyboard_check(vk_shift);
		run_key = clamp( run_key , 0 ,1);
	//up_key = keyboard_check(vk_up);
	//down_key = keyboard_check(vk_down);
	
	space_key_pressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0,gp_face1);
		space_key_pressed = clamp( space_key_pressed , 0 ,1);
	space_key = keyboard_check(vk_space) + gamepad_button_check(0,gp_face1)
		space_key = clamp( space_key , 0 ,1);
	
	// jump Key Buffering
	if space_key_pressed
	{
		jump_key_buffer_timer = buffer_time;
	}
	if jump_key_buffer_timer > 0
	{
		jump_key_buffered = 1;
		jump_key_buffer_timer--;
	} else {
		jump_key_buffered = 0;
	}
}