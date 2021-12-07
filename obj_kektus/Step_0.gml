player.step();


/*if instance_exists(obj_player)
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


if (distancia < 150)
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
	}
}
else
{
		activate0 = 0;
		activate1 = 0;
}
*/
player.morir();


facing = player.check_keyFace(0,0,facing);
player.physycsWorld(facing);
player.sprite_setter(1);
subimage_counter = player.repeat_subimage(player_sprites,sprites_index,0.15,subimage_counter);

