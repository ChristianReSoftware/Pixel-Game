draw_self();

draw_set_font(fnt_menu);
//Set postion of the button Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw text on position xy
draw_text(x,y,button_text);
//reset to default
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
