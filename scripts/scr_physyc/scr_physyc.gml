function scr_physyc(instance,peso)constructor
{
	self.peso = peso;
	self.instance = instance;
	
	sfx_jump = new SFX(snd_jump);
	
	
	function create()
	{
		
	}
	function step()
	{
		
	}
	
	function sprite_setter(switcher)
	{
		with (instance)
		{
			
			if (switcher == true)
			{
			if (en_el_aire == false)
			{
				if PHY_haccel > 1/other.peso
				{
					if sprites_index != 1
					{
						sprites_index = 1;
					}
				}
				else
				{
					sprites_index = 0;
				}
			}
			else
			{
				if (PHY_vspeed < -2)
				{
					sprites_index = 2;
				}
				else if (PHY_vspeed < -1 and PHY_vspeed >=-2)
				{
					sprites_index = 3;
				}
				else if (PHY_vspeed < 1 and PHY_vspeed >=-1)
				{
					sprites_index = 4;
				}
				else if (PHY_vspeed > 0 and PHY_vspeed <= 2)
				{
					sprites_index = 5;
				}
				else if (PHY_vspeed > 2)
				{
					sprites_index = 6;
				}
			}
			}
		}
	}
	
	function draw_sprites(array,index,subimage,facing,_x,_y)
	{
		draw_sprite_ext(array[index],subimage,_x,_y,sign(facing),1,0,c_white,1);
	}
	
	function repeat_subimage(array,index,velocity,counter)
	{
		var retorno = counter;
		if ((counter >= sprite_get_number(array[index])))
		{
			retorno = 0;
			//show_debug_message("0");
		}
		else
		{
			retorno = retorno + velocity;
			//show_debug_message(string(retorno));
		}
		return retorno;
	}
	
	function check_keyFace(_right,_left,_temp)
	{
		var retorno = _temp;
		if _right
		{
			retorno = 1;
		}
		else if _left
		{
			retorno = -1;
		}
		else
		{
			retorno = retorno*2;
		}
		
		return retorno;
	}
	
	function check_keyJump(_jump,_state,acceleration)
	{
		with(instance)
		{
			if (_jump and place_meeting(x,y+1,obj_solid))
			{
				other.sfx_jump.playSound()
				PHY_vspeed = acceleration;
			}
		}
	}
	
	function physycsWorld(_facing)
	{
		with(instance)
		{
			if (_facing <= 1 and _facing >= -1)
			{
				if (PHY_haccel < 3/other.peso)
				{
					PHY_haccel = PHY_haccel + 0.2/other.peso;
				}
				else
				{
					PHY_haccel = 3/other.peso;
				}
			}
			else
			{
				if (PHY_haccel > 0)
				{
					PHY_haccel = PHY_haccel - 0.2/other.peso;
				}
				else
				{
					PHY_haccel = 0;
				}
			}
			
			
			PHY_hspeed = PHY_haccel*sign(_facing);
			if place_meeting(x+PHY_hspeed,y,obj_solid)
			{
				while(!place_meeting(x+sign(PHY_hspeed),y,obj_solid))
				{
					x = x + sign(PHY_hspeed);
				}
				PHY_hspeed = 0;
			}
			x = x + PHY_hspeed;
			
			
			
			PHY_vspeed += 1/4;
			en_el_aire = true;
			if place_meeting(x,y+PHY_vspeed,obj_solid)
			{
				while(!place_meeting(x,y+sign(PHY_vspeed),obj_solid))
				{
					y = y + sign(PHY_vspeed);
					
				}
				PHY_vspeed = 0;
				en_el_aire = false;
			}
			y = y + PHY_vspeed;
		}
	}
}