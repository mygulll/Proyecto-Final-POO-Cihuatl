function print(_mode,_str,_from,_length)constructor
{
	self.mode = _mode;
	self.str = _str;
	self.from = new vector(_from.getX(),_from.getY());
	self.length = _length;
	
	self.fontSize = sprite_get_height(spr_font01);
	
	self.status = true;
	
	soundSystemAccept = new SFX(snd_systemSelect);
	
	function setStr(_string) {self.str = _string}
	function setFrom(_vector) {self.from = _vector}
	
	function empezarVariables()
	{
		index = 0;
		string_index = 1;
		
	}
	
	function actualizarVariables()
	{
		if (status == true)
		{
			if (mode == 0) or (mode == 3)
			{
				if (keyboard_check_pressed(ord("Z")))
				{
					
					if (string_index < string_length(str[index]) and mode == 0)
					{
						string_index = string_length(str[index]);
					}
					else
					{
						string_index = 1;
						if (index < (array_length_1d(str)-1))
						{
							soundSystemAccept.playSound();
							index = index + 1;
						}
						else
						{
							desactivar();
						}
					}
				}
		
				if string_index < string_length(str[index])
				{
					string_index = string_index + 1;
				}
				else
				{
					string_index = string_length(str[index]);
				}
			}
		}
	}
	
	
	function imprimirTexto()
	{
		if (status == true)
		{
			if (mode == 0 or mode == 3)
			{
				var _temporalstring = string_copy(str[index],1,string_index);
				draw_text_ext(from.getX(),from.getY(),_temporalstring,fontSize,length)
			}
			else
			{
				draw_text_ext(from.getX(),from.getY(),str[0],fontSize,length)
			}
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