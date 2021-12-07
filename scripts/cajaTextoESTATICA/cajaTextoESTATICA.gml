function cajaTextoESTATICA(_array)constructor
{
	self.atlas = spr_textBoxFIXED;
	self.origen = new vector(sprite_get_xoffset(atlas),global.cameraSize.getY()-sprite_get_height(atlas)+sprite_get_yoffset(atlas));
	
	self.array = _array;
	
	self.texto = new print(0,array,origen,300);
	
	self.status = true;
	
	global.PLAYERactivado = false;
	
	function crear()
	{
		self.depth = -100000;
		texto.empezarVariables();
	}
	
	function paso()
	{
		if (status == true)
		{
			texto.actualizarVariables();
		}
	}
	
	function dibujar()
	{
		if (status == true)
		{
			var xx = view_get_xport(view_camera)+origen.getX();
			var yy = view_get_yport(view_camera)+origen.getY();
		
			var mugshot_xx = view_get_xport(view_camera)+camera_get_view_width(view_camera)-sprite_get_width(spr_mugshot_player);
			var mugshot_yy = view_get_yport(view_camera)+camera_get_view_height(view_camera)-sprite_get_height(spr_mugshot_player) - sprite_get_height(atlas)+3;
		
			draw_sprite(spr_mugshot_player,0,mugshot_xx,mugshot_yy);
			draw_sprite(spr_mugshot_pulgas,0,0,mugshot_yy);
			draw_sprite(atlas,0,xx,yy);
			texto.imprimirTexto();
			var textStatus = texto.getStatus();
			if (textStatus == false)
			{
				desactivar();
			}
		}
		
	}
	
	function desactivar()
	{
		status = false;
		global.PLAYERactivado = true;
	}
	function getStatus()
	{
		return status;
	}
}