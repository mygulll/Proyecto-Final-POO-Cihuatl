facing = 1;
en_el_aire = false;

player_sprites = [spr_frog,//0
					spr_frog,//1
					spr_frog,//2
					spr_frog,//3
					spr_frog,//4
					spr_frog,//6
					spr_frog,//7
					spr_frog,//8
					spr_frog,//9
					spr_frog,//10
					spr_frog,//11
					spr_frog,//12
					spr_frog//13
					]
sprites_index = 0;


subimage_counter = 0;

PHY_haccel = 0;
PHY_vspeed = 0;
PHY_hspeed = 0;

serAplastado = false;

player = new enemy(self,random_range(1.8,2.2));
player.create();




mostrarTexto = false;
texto = ["¡No me regreses!\nTexto de prueba"]

textoRANDOM = [["Si la escuchas llorar, corre."],["Si la escuchas llorar, corre."],["Si la escuchas llorar, corre."]];