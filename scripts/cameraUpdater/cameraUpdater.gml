// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function cameraUpdater()constructor{
	function create()
	{
		view_enabled = true;
		view_visible[0] = true;
		surface_resize(application_surface,320,180);
	}
	
	function step()
	{
		camera_set_view_size(view_camera,320,180);
		
		if(instance_exists(obj_player))
		{
			var _x = obj_player.x - 320/2;
			var _y = obj_player.y- 180/2;
		}
		else
		{
			var _x = camera_get_view_x(view_camera);
			var _y = camera_get_view_y(view_camera);
		}
		camera_set_view_pos(view_camera,_x,4);
	}
}