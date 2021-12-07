sprite_index = huds[modo];
draw_sprite(sprite_index,image_index,0,0);
var i = 0;
for(i=0;i<global.vida;i++)
{
	draw_sprite(spr_heart,image_index,28+16*i,16);
}