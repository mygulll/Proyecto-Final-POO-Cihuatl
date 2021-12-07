function playableChar(instance,peso):scr_physyc(instance,peso)constructor
{
	self.instance = instance;
	
	sfx_hurt = new SFX(snd_hurt);
	sfx_die = new SFX(snd_dying);
	
	function checkCollisionwENEMY()
	{
		with(self.instance)
		{
			if attacking == false
			{
				var instance_hitted = instance_place(x, y, obj_enemyParent);
				if (place_meeting(x,y,instance_hitted) and hurtwaiter == 0 and hurtd == false)
				{
					if (PHY_vspeed <=0)
					{
						/*var instance_chocada = instance_place(x, y, obj_enemyParent);
						with(theInstance)
						{
							
						}*/
						hurtd = true;
						global.PLAYERactivado = false;
						if global.vida > 0
						{
							other.sfx_hurt.playSound();
						}
						else
						{
							other.sfx_die.playSound();
						}
						player.check_keyJump(1,en_el_aire,-2);
				
						facing = -1*sign(facing);
						sprites_index = irandom_range(7,8);
					}
					else
					{
						other.sfx_jump.playSound()
						PHY_vspeed = -3;
						
						var theInstance = instance_place(x, y, obj_enemyParent);
						with(theInstance)
						{
							serAplastado = true;
						}
					}
				}
			}
			
			
			if (hurtd == true)
			{
				if (hurtwaiter < 20)
				{
					hurtwaiter = hurtwaiter + 1;
					layer_set_visible("lyr_screenShake",true);
				}
				else
				{
					hurtwaiter = 0;
					hurtd = false;
					global.vida = global.vida - 1;
					global.PLAYERactivado = true;
					layer_set_visible("lyr_screenShake",false);
				}
			}
		}
	}
	
	function morir()
	{
		with (instance)
		{
			if (global.vida < 0 and en_el_aire == false)
			{
				instance_create_depth(x,y,self.depth-1,obj_player_death);
				obj_player_death.facing = facing;
				instance_destroy();
			}
		}
	}
	
	function sprite_setter()
	{
		with (instance)
		{
			
			if (global.PLAYERactivado == true)
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
	
	
	function check_keyAttack(_jump,_state,acceleration)
	{
		with(instance)
		{
			if (_jump and place_meeting(x,y+1,obj_solid))
			{
				attacking = true;
				other.sfx_jump.playSound()
				PHY_vspeed = acceleration;
			}
		}
	}
	
	function attack()
	{
		with(instance)
		{
			if (attacking == true)
			{
				global.PLAYERactivado = false;
				
				if (en_el_aire == true)
				{
					if (PHY_vspeed < 0)
					{
						sprites_index = 10;
					}
					else
					{
						sprites_index = 11;
					}
				}
				else
				{
					sprites_index = 12;
					
					if (abs(facing) != 2)
					{
						facing = facing * 2;
					}
				}
				
				attackingC +=1;
				if (attackingC > 45 and en_el_aire == false)
				{
					sprites_index = 12;
					attackingC = 0;
					global.PLAYERactivado = true;
					attacking = false;
				}
			}
		}
	}
	
	function ultimoPensamiento()
	{
		with(instance)
		{
			if texto[0] != ""
			{
				caja_de_texto.setTexto(texto);
				caja_de_texto.setPos(new vector(x-(string_width(texto[0])/2),y-60));
				texto_temp +=1
				if (texto_temp > 240)
				{
					texto[0] = "";
					texto_temp = 0;
				}
			}
		}
	}
}