if keyboard_check_pressed(vk_escape) && !flag
{
	
	flag= true;
	//get Camera pos 
	// the position need to be fixed !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	var _cam_width = camera_get_view_width(view_camera[0]);
	var _cam_height = camera_get_view_height(view_camera[0]);
	//set x/y to the room mid
	x = _cam_width/2;
	y = _cam_height/2;
	
} else if keyboard_check_pressed(vk_escape) && flag {
	//Here code to close the button	
	flag = false;
}

if flag 
{
	draw_self();

	draw_set_font(fnt_menu);
	//Set postion of the button Text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	//draw text on position xy
	draw_text(x,y,button_text);
	//reset to default
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}