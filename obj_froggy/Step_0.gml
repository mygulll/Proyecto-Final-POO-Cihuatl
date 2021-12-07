player.step();


if instance_exists(obj_player)
{
	var distancia = abs(x-obj_player.x);
	var facingX = x-obj_player.x;
}
else
{
	var distancia = 100;
	var facingX = 1;
}

var activate0 = 0;
var activate1 = 0;
var activate3 = 0;

if instance_exists(obj_player)
{
	if (distancia < 250) and obj_player.hurtd == false
	{
		if (obj_player.attacking == false and !place_meeting(x,y,obj_player))
		{
			if facingX < 0
			{
				activate0 = 1;
				activate1 = 0;
			}
			else
			{
				activate0 = 0;
				activate1 = 1;
			}
			if place_meeting(x+sign(facing),y,obj_solid) or distancia < 80
			{
				activate3 = irandom_range(0,1);
			}
			else
			{
				activate3 = 0;
			}
		}
	}
	else
	{
			activate0 = 0;
			activate1 = 0;
	}
}

player.morir();


facing = player.check_keyFace(activate0,activate1,facing);
player.check_keyJump(activate3,en_el_aire,random_range(-6,-8));
player.physycsWorld(facing);
player.sprite_setter(1);
subimage_counter = player.repeat_subimage(player_sprites,sprites_index,0.15,subimage_counter);

