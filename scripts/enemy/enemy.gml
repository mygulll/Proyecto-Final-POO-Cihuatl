function enemy(instance,peso):scr_physyc(instance,peso)constructor
{
	self.instance = instance;
	self.peso = peso;
	sfx_die = new SFX(snd_return);
	
	function morir()
	{
		with(instance)
		{
			if instance_exists(obj_player)
			{
				if (place_meeting(x,y,obj_player))
				{
					if (obj_player.attacking == true)
					{
						obj_player.texto = textoRANDOM[irandom_range(0,2)];
						if global.vida <=2
						{
							global.vida = global.vida + 1;
						}
						other.sfx_die.playSound();
						instance_destroy(self);
					}
					else
					{
						PHY_vspeed = -1;
						facing = facing*-1;
						PHY_hspeed = sign(facing) * 2;
					}
				}
			}
		}
	}
}