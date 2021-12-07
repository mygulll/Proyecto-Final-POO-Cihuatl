facing = 1;
en_el_aire = false;

player_sprites = [spr_kektus,//0
					spr_kektus,//1
					spr_kektus,//2
					spr_kektus,//3
					spr_kektus,//4
					spr_kektus,//6
					spr_kektus,//7
					spr_kektus,//8
					spr_kektus,//9
					spr_kektus,//10
					spr_kektus,//11
					spr_kektus,//12
					spr_kektus//13
					]
sprites_index = 0;


subimage_counter = 0;

PHY_haccel = 0;
PHY_vspeed = 0;
PHY_hspeed = 0;

serAplastado = false;

player = new enemy(self,1.5);
player.create();




mostrarTexto = false;
texto = ["¡No me regreses!\nTexto de prueba"]

textoRANDOM = [["No es un dios totalmente benevolente. Ándate con cuidado"],["Su piel irradia una energía que quema como mil soles"],["Es el quinto sol, su poder es incomparable."]];