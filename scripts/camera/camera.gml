function camera(_width,_height,_scale)constructor
{
	self.width = _width;
	self.height = _height
	self.scale = _scale;
	
	//Settear la camara.
	setCamera = function()
	{
		//Resolucion de la ventana.
		target_width = width*4;
		target_height = height*4;
		
		//Resolucion del juego.
		resolution_width = width;
		resolution_height = height;
		
		//Activar las vistas y su visibilidad.
		view_enabled = true;
		view_visible[0] = true;
		
		//Darle la resolucion del juego a la ventana.
		surface_resize(application_surface,resolution_width,resolution_height);
		
		//Aplicar el tamaño de la ventana.
		window_set_size(target_width,target_height);
		
		//Centrar la vista al cuadro de la ventana.
		window_center();
		
		//hacerle zoom a la vista
		camera_set_view_size(view_camera,width,height);
	}
	
	//Updatear la camara.
	function paso()
	{
		camera_set_view_size(view_camera,width,height);
	}
}