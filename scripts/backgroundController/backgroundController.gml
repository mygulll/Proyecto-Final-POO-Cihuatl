function backgroundController(sky,lower,superior)constructor
{
	self.sky = sky;
	self.lower = lower;
	self.superior = superior;
	
	function ponerCielo()
	{
		draw_sprite(sky,0,camera_get_view_x(view_camera),camera_get_view_y(view_camera));
	}
	
	function ponerFondo()
	{
		
		if instance_exists(obj_player)
		{
			var seguidorX = obj_player.x;
			var seguidorY = obj_player.y;
		}
		else
		{
			var seguidorX = obj_player_death.x;
			var seguidorY = obj_player_death.y;
		}
		
		draw_sprite(lower,0,0+seguidorX/2,-10);
		draw_sprite(superior,0,0+seguidorX/5,-10);
	}
}