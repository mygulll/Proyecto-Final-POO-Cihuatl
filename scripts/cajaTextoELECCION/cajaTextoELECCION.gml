function cajaTextoELECCION(_strings,_vectorCoordenadas,_funciones,_argumentos)constructor
{
	self.strings = _strings;
	self.vectorCoo = _vectorCoordenadas;
	self.funciones = _funciones;
	self.argumentos = _argumentos
	
	self.textbox = new cajaTextoDINAMICA(strings,vectorCoo);
	
	self.index = 0;
	self.status = true;
	
	soundSystem = new SFX(snd_system);
	soundSystemAccept = new SFX(snd_systemSelect);
	
	function setArray(_array){self.strings = _array;textbox.setTexto(_array);}
	
	function crear()
	{
		textbox.crear();
	}
	function paso()
	{
		if (status == true)
		{
			textbox.paso();
			if keyboard_check_pressed(vk_down)
			{
				if (index < array_length(funciones)-1)
				{
					index = index + 1;
					soundSystem.playSound();
				}
				else
				{
					index = 0;
					soundSystem.playSound();
				}
			}
			else if keyboard_check_pressed(vk_up)
			{
				if (index > 0)
				{
					index = index - 1;
					soundSystem.playSound();
				}
				else
				{
					index = array_length(funciones)-1;
					soundSystem.playSound();
				}
			}
		
			if keyboard_check_pressed(ord("Z"))
			{
				soundSystemAccept.playSound();
				if (argumentos[index] == -4)
				{
					funciones[index]();
				}
				else
				{
					funciones[index](argumentos[index]);
				}
			}
		}
	}
	
	function dibujar()
	{
		if (status == true)
		{
			textbox.dibujar();
			draw_sprite(spr_textBoxSELECTOR,0,vectorCoo.getX(),vectorCoo.getY()+10*index);
		}
	}
	
	function desactivar()
	{
		status = false;
	}
	function getStatus()
	{
		return status;
	}
}