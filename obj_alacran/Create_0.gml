facing = 1;
en_el_aire = false;

player_sprites = [spr_alacran,//0
					spr_alacran,//1
					spr_alacran,//2
					spr_alacran,//3
					spr_alacran,//4
					spr_alacran,//6
					spr_alacran,//7
					spr_alacran,//8
					spr_alacran,//9
					spr_alacran,//10
					spr_alacran,//11
					spr_alacran,//12
					spr_alacran//13
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

textoRANDOM = [["No es un dios totalmente benevolente. Ándate con cuidado"],["Su piel irradia una energía que quema como mil soles"],["Es el quinto sol, su poder es incomparable."]];