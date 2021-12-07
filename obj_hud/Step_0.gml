var dano = false;
if instance_exists(obj_player)
{
	dano = obj_player.hurtd;
}

if dano == true
{
	modo = 1;
}
else
{
	modo = 0;
}
