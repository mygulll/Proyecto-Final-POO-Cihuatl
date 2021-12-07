player.step();


if instance_exists(obj_player)
{
	var distancia = abs(x-obj_player.x);
	var facingX = x-obj_player.x;
}
else
{
	var distancia = 150;
	var facingX = 1;
}

var activate0 = 0;
var activate1 = 0;


if distancia < 100
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
}
else
{
		activate0 = 0;
		activate1 = 0;
}


facing = player.check_keyFace(activate0,activate1,facing);
player.physycsWorld(facing);
player.sprite_setter(1);
subimage_counter = player.repeat_subimage(player_sprites,sprites_index,0.15,subimage_counter);

player.morir();