// Exit if there is no player
if !instance_exists(obj_player_wiz) exit;

//get Camera Size
var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);

//get camera Target coordinates
var _cam_x = obj_player_wiz.x - _cam_width/2;
var _cam_y = obj_player_wiz.y - _cam_height/2;


//Constrain camera to room borders
_cam_x = clamp(_cam_x, 0, room_width - _cam_width);
_cam_y = clamp(_cam_y, 0, room_height - _cam_height);

//set cam coordinates
final_cam_x += _cam_x;
final_cam_y += _cam_y;